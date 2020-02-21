using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace TrackConv
{
    class Program
    {
        static void Main(string[] args)
        {
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\TrackerMuzax\modz\DAY 24 - 4mat-(Day24)-Blank_Page.xm");
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\satell.xm");
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\DAY 24 - 4mat-(Day24)-Blank_Page.xm");
            XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\toccata&fugue.xm");
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\scale.xm");
            xmreader.Open();

            Console.WindowWidth = 200;
            Console.WindowHeight = 60;

            xmreader.Header.ToConsole();

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


            //foreach (var item in xmreader.Header.PatternOrderTable)
            //{
            //    xmreader.Patterns[item].PatternToConsole();
            //    break;
            //}


            List<byte> bytes = new List<byte>();
            foreach (var item in xmreader.Header.PatternOrderTable)
            {
                bytes.AddRange(xmreader.Patterns[item].PatternToBytes());
            }

            int linenumber = 10000;
            const int maxiteminline = 16;
            List<string> lines = new List<string>();

            string currentline = "";
            int curritem = 1;

            int remainingitems = bytes.Count;

            foreach (var item in bytes)
            {
                if (curritem == 1)
                    currentline = linenumber + " DATA ";
                if (curritem <= maxiteminline)
                    currentline += "$" + item.ToString("X2");
                if (curritem < maxiteminline && remainingitems != 1) currentline += ",";
                if (curritem == maxiteminline || remainingitems == 1)
                {
                    curritem = 1;
                    lines.Add(currentline);
                    linenumber += 10;
                }
                else curritem++;
                remainingitems--;
            }
            lines.Add(linenumber + " DATA 0,0");

            File.WriteAllLines(@"notes.txt", lines.ToArray());




        }

        public static Dictionary<string, string> xmEffects = new Dictionary<string, string>()
        {
            ["0xy"] = "Arpeggio",
            ["1xx"] = "Portamento Up",
            ["2xx"] = "Portamento Down",
            ["3xx"] = "Tone Portamento",
            ["4xy"] = "Vibrato",
            ["5xy"] = "Volume Slide + Tone Portamento",
            ["6xy"] = "Volume Slide + Vibrato",
            ["7xy"] = "Tremolo",
            ["8xx"] = "Set Panning",
            ["9xx"] = "Sample Offset",
            ["Axy"] = "Volume Slide",
            ["Bxx"] = "Position Jump",
            ["Cxx"] = "Set Volume",
            ["Dxx"] = "Pattern Break",
            ["E1x"] = "Fine Portamento Up",
            ["E2x"] = "Fine Portamento Down",
            ["E3x"] = "Glissando Control",
            ["E4x"] = "Set Vibrato Waveform",
            ["E5x"] = "Set Finetune",
            ["E60"] = "Pattern Loop Start",
            ["E6x"] = "Pattern Loop",
            ["E7x"] = "Set Tremolo Waveform",
            ["E8x"] = "Set Panning",
            ["E9x"] = "Retrigger",
            ["EAx"] = "Fine Volume Slide Up",
            ["EBx"] = "Fine Volume Slide Down",
            ["ECx"] = "Note Cut",
            ["EDx"] = "Note Delay",
            ["EEx"] = "Pattern Delay",
            ["EFx"] = "Set Active Macro",
            ["Fxx"] = "Set Speed / Tempo",
            ["Gxx"] = "Set Global Volume",
            ["Hxy"] = "Global Volume Slide",
            ["Kxx"] = "Key Off",
            ["Lxx"] = "Set Envelope Position",
            ["Pxy"] = "Panning Slide",
            ["Rxy"] = "Retrigger",
            ["Txy"] = "Tremor",
            ["X1x"] = "Extra Fine Portamento Up",
            ["X2x"] = "Extra Fine Portamento Down",
            ["X5x"] = "Set Panbrello Waveform",
            ["X6x"] = "Fine Pattern Delay",
            ["X9x"] = "Sound Control",
            ["XAx"] = "High Offset",
            ["Yxy"] = "Panbrello",
            ["Zxx"] = "MIDI Macro",
            ["\\xx"] = "Smooth MIDI Macro",
        };
    }
}
