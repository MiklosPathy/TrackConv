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
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\toccata&fugue.xm");
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\scale.xm");

            //xmreader.Open();

            //Console.WindowWidth = 200;
            //Console.WindowHeight = 60;

            //xmreader.Header.ToConsole();

            //Console.WriteLine("Patterns:");
            //for (int i = 0; i < xmreader.Patterns.Length; i++)
            //{
            //    XMPattern pattern = xmreader.Patterns[i];
            //    Console.WriteLine(i + ": " + pattern.LenghtOfPatternHeader + " " + pattern.PatternPackType + " " + pattern.NumberOfRows + " " + pattern.SizeOfPatternData);
            //}

            //Console.WriteLine("Instruments:");
            //for (int i = 0; i < xmreader.Instruments.Length; i++)
            //{
            //    XMInstrument instrument = xmreader.Instruments[i];
            //    Console.WriteLine(i + ": " + instrument.NumberOfSamples + " " + instrument.InstrumentName + " " + instrument.Samples[0].NameOfSample + " " + instrument.nextinstrumentofset);
            //}

            //List<XMNote> allnotes = new List<XMNote>();
            //foreach (var item in xmreader.Header.PatternOrderTable)
            //{
            //    XMPattern pattern = xmreader.Patterns[item];
            //    if (pattern.PatArr != null)
            //        foreach (var arre in pattern.PatArr)
            //        {
            //            if (arre == null)
            //                Console.WriteLine("NULL");
            //            allnotes.Add(arre);
            //        }
            //}


            //Console.WriteLine("Used effects:");
            //var effects = allnotes.Select(x => x.Effect).Distinct().OrderBy(x => x).ToList();
            //foreach (var item in effects)
            //{
            //    Console.WriteLine(item.ToString("X2"));
            //}


            ////foreach (var item in xmreader.Header.PatternOrderTable)
            ////{
            ////    xmreader.Patterns[item].PatternToConsole();
            ////    break;
            ////}


            byte[] filedata;
            //filedata = File.ReadAllBytes("Organ_Additive.dmp");
            filedata = File.ReadAllBytes("OscillatorTest.dmp");
            //Console.WriteLine(filedata.Length);
            YM215Instrument instr = new YM215Instrument();
            instr.ReadFromDMP(filedata);

            instr.ToConsole();

            List<byte> bytes = new List<byte>();

            //for (int i = 0; i < 8; i++)
            int i = 0;
            {
                var e = instr.ToControlBytes(i);
                foreach (var item in e)
                {
                    bytes.Add(item.Key);
                    bytes.Add(item.Value);
                }
            }

 
            XMNote note = new XMNote() { octave = 3, note = 0 };
            note.NoteIntoBytes(bytes, 0, 0b01100000);
            note.note = 4;
            note.NoteIntoBytes(bytes, 0, 0b00011000);


            //foreach (var item in xmreader.Header.PatternOrderTable)
            //{
            //    bytes.AddRange(xmreader.Patterns[item].PatternToBytes());
            //}

            int linenumber = 10000;
            const int maxiteminline = 16;

            string cx16basicplayer = @"100 GOSUB 500
110 TT=TI
120 READ R,D
130 POKE $9FE0,R:POKE $9FE1,D
140 IF(R>0)THEN GOTO 120
150 IF(D=0)THEN GOTO 200
160 TT=TT+D
170 FOR I=0 TO 1 STEP 0
180 IF(TI>=TT)THEN GOTO 110
190 NEXT I
200 GOSUB 500
210 END
500 REM RESET SOUND CHIP
510 FOR I = 0 TO 255 : POKE $9FE0, I : POKE $9FE1, 0 : NEXT
520 RETURN";


            List<string> lines = new List<string>();
            lines.Add(cx16basicplayer);

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
    }
}
