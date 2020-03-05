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
            string projectfilename = "TCProject.json";
            if (args.Count() > 0) projectfilename = args[0];

            TCProject project;
            string jsonString;
            var jsonserializeroptions = new JsonSerializerOptions
            {
                WriteIndented = true,
                AllowTrailingCommas = true,
                ReadCommentHandling = JsonCommentHandling.Skip,
            };
            if (!File.Exists(projectfilename))
            {
                project = new TCProject();
                jsonString = JsonSerializer.Serialize(project, jsonserializeroptions);
                File.WriteAllText(projectfilename, jsonString);
                Console.WriteLine("Default config file written. It will be good for you." + projectfilename);
                Environment.Exit(0);
            }
            Directory.SetCurrentDirectory(Path.GetDirectoryName(projectfilename));

            jsonString = File.ReadAllText(projectfilename);
            project = JsonSerializer.Deserialize<TCProject>(jsonString, jsonserializeroptions);

            XMRead xmreader = new XMRead(project.TrackFile);
            xmreader.Open();

            Console.WindowWidth = 200;
            Console.WindowHeight = 60;

            xmreader.Header.ToConsole();



            YM2151State cs = new YM2151State();

            int instrnr = 1;
            foreach (string instrumentfilename in project.YM2151Instruments)
            {
                YM215Instrument instr = new YM215Instrument();
                instr.ReadFromDMP(instrumentfilename);
                cs.DefinedInstruments[instrnr] = instr;
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



            int patterncounter = 0;
            bool[] channelson = { true, true, true, true, true, true, true, true };
            foreach (var item in xmreader.Header.PatternOrderTable)
            {
                int? FromRow = null;
                int? ToRow = null;

                if (project.ConvertFrom != null && project.ConvertFrom.Track.HasValue)
                {
                    if (project.ConvertFrom.Track.Value == patterncounter)
                        FromRow = project.ConvertFrom.Row;
                    if (project.ConvertFrom.Track.Value > patterncounter)
                    {
                        patterncounter++;
                        continue;
                    }
                }

                if (project.ConvertTo != null && project.ConvertTo.Track.HasValue)
                {
                    if (project.ConvertTo.Track.Value == patterncounter)
                        ToRow = project.ConvertTo.Row;
                    if (project.ConvertTo.Track.Value < patterncounter)
                    {
                        patterncounter++;
                        continue;
                    }
                }

                bytes.AddRange(xmreader.Patterns[item].PatternToBytes(cs, channelson, FromRow, ToRow));
                xmreader.Patterns[item].PatternToConsole();
                patterncounter++;

            }

            CX16BasicWriter.ToFile(bytes);
            BinaryWriter.ToFile(bytes);



        }
    }
}
