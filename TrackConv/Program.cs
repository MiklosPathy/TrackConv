using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;

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

            XMRead xmreader = new XMRead(conv.Project.TrackFile);
            xmreader.Open();

            Console.WindowWidth = 200;
            Console.WindowHeight = 60;

            xmreader.Header.ToConsole();


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
            for (int i = 0; i < xmreader.Patterns.Length; i++)
            {
                XMPattern pattern = xmreader.Patterns[i];
                Console.WriteLine(i + ": " + pattern.LenghtOfPatternHeader + " " + pattern.PatternPackType + " " + pattern.NumberOfRows + " " + pattern.SizeOfPatternData);
            }

            Console.WriteLine("Instruments:");
            for (int i = 0; i < xmreader.Instruments.Length; i++)
            {
                XMInstrument instrument = xmreader.Instruments[i];
                Console.WriteLine(i + ": " + instrument.NumberOfSamples + " " + instrument.InstrumentName + " " + instrument.Samples[0].NameOfSample + " " + instrument.nextinstrumentofset);
            }

            List<XMNote> allnotes = new List<XMNote>();
            foreach (var item in xmreader.Header.PatternOrderTable)
            {
                XMPattern pattern = xmreader.Patterns[item];
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


            ////foreach (var item in xmreader.Header.PatternOrderTable)
            ////{
            ////    xmreader.Patterns[item].PatternToConsole();
            ////    break;
            ////}


            List<byte> bytes = new List<byte>();

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

            conv.CurrentBPM = xmreader.Header.DefaultBPM;
            conv.CurrentTickPerRow = xmreader.Header.DefaultTempo;
            if (conv.Project.OverrideRowPerBeat.HasValue) conv.CurrentRowPerBeat = conv.Project.OverrideRowPerBeat.Value;

            int patterncounter = 0;
            bool[] channelson = { true, true, true, true, true, true, true, true };
            foreach (var item in xmreader.Header.PatternOrderTable)
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

                bytes.AddRange(xmreader.Patterns[item].PatternToBytes(conv, channelson, FromRow, ToRow));
                //xmreader.Patterns[item].PatternToConsole();
                patterncounter++;

            }

            if (conv.Project.OutputDirectory != null) Directory.SetCurrentDirectory(conv.Project.OutputDirectory);

            CX16BasicWriter.ToFile(bytes);
            BinaryWriter.ToFile(bytes);



        }
    }
}
