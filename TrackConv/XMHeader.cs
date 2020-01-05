using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class XMHeader
    {
        private static class Consts
        {
            public const int IDString = 0x0000;// h                  17 char ID = "Extended module: "
            public const int Modulename = 0x0011;// h                  20 char Module name, padded with zeroes
            public const int OneCharID = 0x0025; //h                   1 char ID = 01Ah
            public const int TrackerName = 0x0026;// h                  20 char Tracker name
            public const int TrackerRevision = 0x003A;// h                   1 word Tracker revision number, hi-byte is major version
            public const int HeaderSize = 0x003C;// h                   1 dword Header size
            public const int SongLengthInPatterns = 0x0040; // h                   1 word Song length in patterns
            public const int RestartPosition = 0x0042;// h                   1 word Restart position
            public const int NumberOfChannels = 0x0044;// h                   1 word Number of channels
            public const int NumberOfPatterns = 0x0046;// h                   1 word Number of patterns(< 256)
                                                       //								 ="PAT"
            public const int NumberOfInstruments = 0x0048;// h                   1 word Number of instruments(<128)
            public const int Flags = 0x004A;// h                   1 word Flags :
                                            //0 - Linear frequency table / Amiga freq.table
            public const int DefaultTempo = 0x004C; // h                   1 word Default tempo
            public const int DefaultBPM = 0x004E; // h                   1 word Default BPM
            public const int PatternOrderTable = 0x0050;// h                 256 byte Pattern order table
        }

        private byte[] filedata;
        public XMHeader(byte[] filedata)
        {
            this.filedata = filedata;
        }

        public string IDString { get { return filedata.ReadAsString(Consts.IDString, Consts.Modulename); } }
        public string Modulename { get { return filedata.ReadAsString(Consts.Modulename, Consts.OneCharID); } }
        public char OneCharID { get { return Convert.ToChar(filedata[Consts.OneCharID]); } }
        public string TrackerName { get { return filedata.ReadAsString(Consts.TrackerName, Consts.TrackerRevision); } }
        public byte TrackerRevisionMajor { get { return filedata[Consts.TrackerRevision + 1]; } }
        public byte TrackerRevisionMinor { get { return filedata[Consts.TrackerRevision]; } }
        public int HeaderSize { get { return filedata.ReadAsDWord(Consts.HeaderSize); } }
        public int SongLengthInPatterns { get { return Math.Min(filedata.ReadAsWord(Consts.SongLengthInPatterns), 256); } }
        public int RestartPosition { get { return filedata.ReadAsWord(Consts.RestartPosition); } }
        public int NumberOfChannels { get { return filedata.ReadAsWord(Consts.NumberOfChannels); } }
        public int NumberOfPatterns { get { return filedata.ReadAsWord(Consts.NumberOfPatterns); } }
        public int NumberOfInstruments { get { return Math.Min(filedata.ReadAsWord(Consts.NumberOfInstruments), 128); } }
        public int Flags { get { return filedata.ReadAsWord(Consts.Flags); } }
        public int DefaultTempo { get { return filedata.ReadAsWord(Consts.DefaultTempo); } }
        public int DefaultBPM { get { return filedata.ReadAsWord(Consts.DefaultBPM); } }
        public byte[] PatternOrderTable { get { return filedata.CopyOutByteArray(Consts.PatternOrderTable, SongLengthInPatterns); } }

        public void ToConsole()
        {
            Console.WriteLine(IDString);
            Console.WriteLine(Modulename);
            Console.WriteLine(OneCharID);
            Console.WriteLine(TrackerName);
            Console.WriteLine("TrackerRevision: " + TrackerRevisionMajor + "." + TrackerRevisionMinor);
            Console.WriteLine("HeaderSize: " + HeaderSize);
            Console.WriteLine("SongLengthInPatterns: " + SongLengthInPatterns);
            Console.WriteLine("RestartPosition: " + RestartPosition);
            Console.WriteLine("NumberOfChannels: " + NumberOfChannels);
            Console.WriteLine("NumberOfPatterns: " + NumberOfPatterns);
            Console.WriteLine("NumberOfInstruments: " + NumberOfInstruments);
            Console.WriteLine("Flags: " + Flags);
            Console.WriteLine("DefaultTempo: " + DefaultTempo);
            Console.WriteLine("DefaultBPM: " + DefaultBPM);
            Console.WriteLine("PatternOrderTable: " + string.Join(' ', PatternOrderTable));
        }
    }
}
