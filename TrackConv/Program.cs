using System;

namespace TrackConv
{
    class Program
    {
        static void Main(string[] args)
        {
            XMRead xmreader = new XMRead(@"C:\Users\mpathy\Desktop\TrackerMuzax\modz\DAY 24 - 4mat-(Day24)-Blank_Page.xm");
            xmreader.Open();

            Console.WriteLine(xmreader.Header.IDString);
            Console.WriteLine(xmreader.Header.Modulename);
            Console.WriteLine(xmreader.Header.OneCharID);
            Console.WriteLine(xmreader.Header.TrackerName);
            Console.WriteLine("TrackerRevision: " + xmreader.Header.TrackerRevisionMajor + "." + xmreader.Header.TrackerRevisionMinor);
            Console.WriteLine("HeaderSize: " + xmreader.Header.HeaderSize);
            Console.WriteLine("SongLengthInPatterns: " + xmreader.Header.SongLengthInPatterns);
            Console.WriteLine("RestartPosition: " + xmreader.Header.RestartPosition);
            Console.WriteLine("NumberOfChannels: " + xmreader.Header.NumberOfChannels);
            Console.WriteLine("NumberOfPatterns: " + xmreader.Header.NumberOfPatterns);
            Console.WriteLine("NumberOfInstruments: " + xmreader.Header.NumberOfInstruments);
            Console.WriteLine("Flags: " + xmreader.Header.Flags);
            Console.WriteLine("DefaultTempo: " + xmreader.Header.DefaultTempo);
            Console.WriteLine("DefaultBPM: " + xmreader.Header.DefaultBPM);
            Console.WriteLine("PatternOrderTable: " + string.Join(' ', xmreader.Header.PatternOrderTable));

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

        }
    }
}
