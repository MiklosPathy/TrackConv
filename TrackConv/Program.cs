using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using TrackConv.ITF;
using TrackConv.XM;

namespace TrackConv
{
    class Program
    {
        static void Main(string[] args)
        {
            Conversion conv = new Conversion();

            string projectfilename = "Default.tcproject";
            if (args.Count() > 0) projectfilename = args[0];

            projectfilename = Path.GetFullPath(projectfilename);

            string jsonString;
            var jsonserializeroptions = new JsonSerializerOptions
            {
                WriteIndented = true,
                AllowTrailingCommas = true,
                ReadCommentHandling = JsonCommentHandling.Skip,
            };
            if (!File.Exists(projectfilename))
            {
                conv.Project = new TCProject();
                jsonString = JsonSerializer.Serialize(conv.Project, jsonserializeroptions);
                File.WriteAllText(projectfilename, jsonString);
                Console.WriteLine("Default project file written. It will be good for you. " + projectfilename);
                Environment.Exit(0);
            }
            Directory.SetCurrentDirectory(Path.GetDirectoryName(projectfilename));

            jsonString = File.ReadAllText(projectfilename);
            conv.Project = JsonSerializer.Deserialize<TCProject>(jsonString, jsonserializeroptions);

            conv.XM = new XMRead(conv.Project.TrackFile);
            conv.XM.Open();

            conv.ITF = conv.XM.ToITF();


            Console.WindowWidth = 200;
            Console.WindowHeight = 60;

            conv.XM.Header.ToConsole();


            int instrnr = 1;
            foreach (Instrument instrument in conv.Project.YM2151Instruments)
            {
                YM2151Instrument instr = new YM2151Instrument();
                instr.ReadFromDMP(instrument.DMPFile);
                conv.DefinedInstruments[instrnr] = instr;
                instrnr++;
                Console.WriteLine("Instrument " + instrnr);
                instr.ToConsole();
            }

            Console.WriteLine("Patterns:");
            for (int i = 0; i < conv.XM.Patterns.Length; i++)
            {
                XMPattern pattern = conv.XM.Patterns[i];
                Console.WriteLine(i + ": " + pattern.LenghtOfPatternHeader + " " + pattern.PatternPackType + " " + pattern.NumberOfRows + " " + pattern.SizeOfPatternData);
            }

            Console.WriteLine("Instruments:");
            for (int i = 0; i < conv.XM.Instruments.Length; i++)
            {
                XMInstrument instrument = conv.XM.Instruments[i];
                Console.WriteLine(i + ": " + instrument.NumberOfSamples + " " + instrument.InstrumentName + " " + instrument.Samples[0].NameOfSample + " " + instrument.nextinstrumentofset);
            }

            List<XMNote> allnotes = new List<XMNote>();
            foreach (var item in conv.XM.Header.PatternOrderTable)
            {
                XMPattern pattern = conv.XM.Patterns[item];
                if (pattern.PatArr != null)
                    foreach (var arre in pattern.PatArr)
                    {
                        if (arre == null)
                            Console.WriteLine("NULL");
                        allnotes.Add(arre);
                    }
            }


            Console.WriteLine("Used effects:");
            var effects = allnotes.Select(x => x.Effect).Distinct().OrderBy(x => x).ToList();
            foreach (var item in effects)
            {
                Console.WriteLine(item.ToString("X2"));
            }


            ////foreach (var item in conv.XM.Header.PatternOrderTable)
            ////{
            ////    conv.XM.Patterns[item].PatternToConsole();
            ////    break;
            ////}


            ////for (int i = 0; i < 8; i++)
            //int i = 0;
            //{
            //    var e = instr.ToControlBytes(i);
            //    foreach (var item in e)
            //    {
            //        bytes.Add(item.Key);
            //        bytes.Add(item.Value);
            //    }
            //}


            //XMNote note = new XMNote() { octave = 3, note = 0 };
            //note.NoteIntoBytes(bytes, 0, 0b01100000);
            //note.note = 4;
            //note.NoteIntoBytes(bytes, 0, 0b00011000);

            conv.CurrentBPM = conv.ITF.BeatPerMinute;
            conv.CurrentTickPerRow = conv.ITF.TickPerRow;
            if (conv.Project.OverrideRowPerBeat.HasValue) conv.CurrentRowPerBeat = conv.Project.OverrideRowPerBeat.Value;

            //Start pause
            conv.OBs.AddRange(new byte[] { 0, 60 });


            int patterncounter = 0;
            bool[] channelson = { true, true, true, true, true, true, true, true };
            foreach (var item in conv.ITF.PlayOrder)
            {
                int? FromRow = null;
                int? ToRow = null;

                if (conv.Project.ConvertFrom != null && conv.Project.ConvertFrom.Track.HasValue)
                {
                    if (conv.Project.ConvertFrom.Track.Value == patterncounter)
                        FromRow = conv.Project.ConvertFrom.Row;
                    if (conv.Project.ConvertFrom.Track.Value > patterncounter)
                    {
                        patterncounter++;
                        continue;
                    }
                }

                if (conv.Project.ConvertTo != null && conv.Project.ConvertTo.Track.HasValue)
                {
                    if (conv.Project.ConvertTo.Track.Value == patterncounter)
                        ToRow = conv.Project.ConvertTo.Row;
                    if (conv.Project.ConvertTo.Track.Value < patterncounter)
                    {
                        patterncounter++;
                        continue;
                    }
                }

                conv.OBs.AddRange(item.PatternToBytes(conv, channelson, FromRow, ToRow));
                //conv.XM.Patterns[item].PatternToConsole();
                patterncounter++;

            }

            if (conv.Project.OutputDirectory != null) Directory.SetCurrentDirectory(conv.Project.OutputDirectory);

            //Trailing pause
            conv.OBs.AddRange(new byte[] { 0, 60 });

            CX16BasicWriter.ToFile(conv.OBs);
            BinaryWriter.ToFile(conv.OBs);
            DMFWriter.ToDMF(conv);


        }
    }
}
