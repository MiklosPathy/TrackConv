using System;

namespace TrackConv
{



    class Program
    {
        static void Main(string[] args)
        {
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\TrackerMuzax\modz\DAY 24 - 4mat-(Day24)-Blank_Page.xm");
            XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\satell.xm");
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\DAY 24 - 4mat-(Day24)-Blank_Page.xm");
            //XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\bach_tocatta_fugue_d_minor.xm");
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

            foreach (var item in xmreader.Header.PatternOrderTable)
            {
                xmreader.Patterns[item].PatternToConsole(xmreader.Header);
            }

            



        }


    }
}
