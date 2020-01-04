using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TrackConv
{
    public class XMRead
    {
        public const int PatternStartAt = 0x0150; // Theoretically patterns start here in the file

        internal string ReadAsString(int from, int until)
        {
            string result = "";
            for (int i = from; i < until; i++)
            {
                result += Convert.ToChar(filedata[i]);
            }
            return result;
        }

        internal int ReadAsWord(int from)
        {
            int result = filedata[from + 1] * 256;
            result += filedata[from];
            return result;
        }

        internal int ReadAsDWord(int from)
        {
            int result = (int)filedata[from + 3] * 16777216;
            result += (int)filedata[from + 2] * 65536;
            result += (int)filedata[from + 1] * 256;
            result += (int)filedata[from];
            return result;
        }

        internal byte[] CopyOutByteArray(int From, int Lenght)
        {
            byte[] result = new byte[Lenght];
            for (int i = 0; i < Lenght; i++)
            {
                result[i] = filedata[From + i];
            }
            return result;
        }

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
            private XMRead parent;
            public XMHeader(XMRead parent, byte[] filedata)
            {
                this.filedata = filedata;
                this.parent = parent;
            }

            public string IDString { get { return parent.ReadAsString(Consts.IDString, Consts.Modulename); } }
            public string Modulename { get { return parent.ReadAsString(Consts.Modulename, Consts.OneCharID); } }
            public char OneCharID { get { return Convert.ToChar(filedata[Consts.OneCharID]); } }
            public string TrackerName { get { return parent.ReadAsString(Consts.TrackerName, Consts.TrackerRevision); } }
            public byte TrackerRevisionMajor { get { return filedata[Consts.TrackerRevision + 1]; } }
            public byte TrackerRevisionMinor { get { return filedata[Consts.TrackerRevision]; } }
            public int HeaderSize { get { return parent.ReadAsDWord(Consts.HeaderSize); } }
            public int SongLengthInPatterns { get { return Math.Min(parent.ReadAsWord(Consts.SongLengthInPatterns), 256); } }
            public int RestartPosition { get { return parent.ReadAsWord(Consts.RestartPosition); } }
            public int NumberOfChannels { get { return parent.ReadAsWord(Consts.NumberOfChannels); } }
            public int NumberOfPatterns { get { return parent.ReadAsWord(Consts.NumberOfPatterns); } }
            public int NumberOfInstruments { get { return Math.Min(parent.ReadAsWord(Consts.NumberOfInstruments), 128); } }
            public int Flags { get { return parent.ReadAsWord(Consts.Flags); } }
            public int DefaultTempo { get { return parent.ReadAsWord(Consts.DefaultTempo); } }
            public int DefaultBPM { get { return parent.ReadAsWord(Consts.DefaultBPM); } }
            public byte[] PatternOrderTable { get { return parent.CopyOutByteArray(Consts.PatternOrderTable, SongLengthInPatterns); } }


        }
        public class XMPattern
        {
            private static class Consts
            {
                public const int LenghtOfPatternHeader = 0x0000;// h                   1 dword Length of pattern block/header ??
                public const int PatternPackType = 0x0004;// h                   1 byte Pattern pack type
                public const int NumberOfRows = 0x0005;// h                   1 word Number of rows in pattern(1..256)
                public const int SizeOfPatternData = 0x0007;// h                   1 word Size of pattern data
            }

            private byte[] filedata;
            private XMRead parent;
            private int offset;

            public XMPattern(XMRead parent, byte[] filedata, int offset)
            {
                this.filedata = filedata;
                this.parent = parent;
                this.offset = offset;
            }

            public int LenghtOfPatternHeader { get { return parent.ReadAsDWord(offset + Consts.LenghtOfPatternHeader); } }
            public byte PatternPackType { get { return filedata[offset + Consts.PatternPackType]; } }
            public int NumberOfRows { get { return parent.ReadAsWord(offset + Consts.NumberOfRows); } }
            public int SizeOfPatternData { get { return parent.ReadAsWord(offset + Consts.SizeOfPatternData); } }

        }

        public class XMInstrument
        {
            private static class Consts
            {
                public const int InstrumentHeaderSize = 0x0000;// h                   1 dword Instrument block/header size
                public const int InstrumentName = 0x0004;// h                  22 char ASCII Instrument name, 0 padded?
                public const int InstrumentType = 0x001A; // h                   1 byte Instrument type(always 0)
                public const int NumberOfSamples = 0x001B;// h                   1 word Number of samples in instrument
                public const int SampleHeaderSize = 0x001D; // h                   1 dword Sample header size
                public const int SampleNumbersForAllNotes = 0x0021;// h                  96 byte Sample numbers for all notes
                public const int PointsOfVolumeEnvelope = 0x0081;// h                  48 byte Points of volume envelope
                public const int PointsOfPanningEnvelope = 0x00C1;// h                  48 byte Points of panning envelope
                public const int NumberOfVolumePoints = 0x0101; // h                   1 byte Number of volume points
                public const int NumberOfPanningPoints = 0x0102;// h                   1 byte Number of panning points
                public const int VolumeSustainPoint = 0x0103; // h                   1 byte Volume sustain point
                public const int VolumeLoopStartPoint = 0x0104; // h                   1 byte Volume loop start point
                public const int VolumeLoopEndPoint = 0x0105;// h                   1 byte Volume loop end point
                public const int PanningSustainPoint = 0x0106; // h                   1 byte Panning sustain point
                public const int PanningLoopStartPoint = 0x0107;// h                   1 byte Panning loop start point
                public const int PanningLoopEndPoint = 0x0108;// h                   1 byte Panning loop end point
                public const int VolumeType = 0x0109;// h                   1 byte Volume type, bitmapped
                                                     //0 - Volume on
                                                     //1 - Sustain on
                                                     //2 - Loop on
                public const int PanningType = 0x010A;// h                   1 byte Panning type, bitmapped
                                                      //0 - Panning on
                                                      //1 - Sustain on
                                                      //2 - Loop on
                public const int VibratoType = 0x010B;// h                   1 byte Vibrato type
                public const int VibratoSweep = 0x010C;//                   1 byte Vibrato sweep
                public const int VibratoDepth = 0x010D;// h                   1 byte Vibrato depth
                public const int VibratoRate = 0x010E; // h                   1 byte Vibrato rate
                public const int VolumeFadeout = 0x010F; // h                   1 word Volume fadeout
                public const int Reserved = 0x0111;// h                   1 word Reserved
            }

            public class XMSample
            {
                private static class Consts
                {
                    public const int SampleLength = 0x0000; // h                   1 dword Sample length
                                                            //="LEN"
                    public const int SampleLoopStart = 0x0004;// h                   1 dword Sample loop start
                    public const int SampleLoopLength = 0x0008;// h                   1 dword Sample loop length
                    public const int Volume = 0x000C;// h                   1 byte Volume
                    public const int Finetune = 0x000D;// h                   1 byte Finetune for sample(-128..+127)
                                                       //+-127 is one half tone
                    public const int SampleType = 0x000E;// h                   1 byte Sample type, bitmapped
                                                         //0,1 : Loop type :
                                                         //		0 - no loop
                                                         //		1 - forward loop
                                                         //		2 - ping-pong loop
                                                         //		3 - reserved
                                                         //   4?: sample is 16-bit
                    public const int SamplePan = 0x000F;// h                   1 byte Sample pan
                    public const int RelativeNote = 0x0010;// h                   1 byte Relative note number(signed byte)
                                                           //                    (-96..+95), 0 -> C-4 sounds as C-4
                    public const int Reserved = 0x0011;     //h                   1 byte Reserved
                    public const int NameOfSample = 0x0012;// h                  22 char ASCII name of sample, 0 padded
                    public const int SampleData = 0x0028;// h               "LEN" byte Sample data.The sample data is stored
                                                         // as delta compressed data like the ProTracker.
                }

                private byte[] filedata;
                private XMRead parent;
                private int offset;

                public XMSample(XMRead parent, byte[] filedata, int offset)
                {
                    this.filedata = filedata;
                    this.parent = parent;
                    this.offset = offset;
                }

                public int SampleLength { get { return parent.ReadAsDWord(offset + Consts.SampleLength); } }
                public int SampleLoopStart { get { return parent.ReadAsDWord(offset + Consts.SampleLoopStart); } }
                public int SampleLoopLength { get { return parent.ReadAsDWord(offset + Consts.SampleLoopLength); } }
                public byte Volume { get { return filedata[offset + Consts.Volume]; } }
                public byte Finetune { get { return filedata[offset + Consts.Finetune]; } }
                public byte SampleType { get { return filedata[offset + Consts.SampleType]; } }
                public byte SamplePan { get { return filedata[offset + Consts.SamplePan]; } }
                public byte RelativeNote { get { return filedata[offset + Consts.RelativeNote]; } }
                public byte Reserved { get { return filedata[offset + Consts.Reserved]; } }
                public string NameOfSample { get { return parent.ReadAsString(offset + Consts.NameOfSample, offset + Consts.SampleData); } }

                //public const int SampleData = 0x0028;// h               "LEN" byte Sample data.The sample data is stored
                // as delta compressed data like the ProTracker.
            }

            private byte[] filedata;
            private XMRead parent;
            private int offset;
            public int nextinstrumentofset;

            private XMSample[] samples;
            public XMSample[] Samples { get { return samples; } }

            public XMInstrument(XMRead parent, byte[] filedata, int offset)
            {
                this.filedata = filedata;
                this.parent = parent;
                this.offset = offset;

                samples = new XMSample[NumberOfSamples];

                nextinstrumentofset = offset + InstrumentHeaderSize;
                for (int i = 0; i < NumberOfSamples; i++)
                {
                    XMSample sample = new XMSample(parent, filedata, nextinstrumentofset);
                    samples[i] = sample;
                    nextinstrumentofset += (SampleHeaderSize + sample.SampleLength);
                }
            }

            public int InstrumentHeaderSize { get { return parent.ReadAsDWord(offset + Consts.InstrumentHeaderSize); } }
            public string InstrumentName { get { return parent.ReadAsString(offset + Consts.InstrumentName, offset + Consts.InstrumentType); } }
            public byte InstrumentType { get { return filedata[offset + Consts.InstrumentType]; } }
            public int NumberOfSamples { get { return parent.ReadAsWord(offset + Consts.NumberOfSamples); } }
            public int SampleHeaderSize { get { return parent.ReadAsDWord(offset + Consts.SampleHeaderSize); } }
            public byte[] SampleNumbersForAllNotes { get { return parent.CopyOutByteArray(offset + Consts.SampleNumbersForAllNotes, 96); } }
            public byte[] PointsOfVolumeEnvelope { get { return parent.CopyOutByteArray(offset + Consts.PointsOfVolumeEnvelope, 48); } }
            public byte[] PointsOfPanningEnvelope { get { return parent.CopyOutByteArray(offset + Consts.PointsOfPanningEnvelope, 48); } }
            public byte NumberOfVolumePoints { get { return filedata[offset + Consts.NumberOfVolumePoints]; } }
            public byte NumberOfPanningPoints { get { return filedata[offset + Consts.NumberOfPanningPoints]; } }
            public byte VolumeSustainPoint { get { return filedata[offset + Consts.VolumeSustainPoint]; } }
            public byte VolumeLoopStartPoint { get { return filedata[offset + Consts.VolumeLoopStartPoint]; } }
            public byte VolumeLoopEndPoint { get { return filedata[offset + Consts.VolumeLoopEndPoint]; } }
            public byte PanningSustainPoint { get { return filedata[offset + Consts.PanningSustainPoint]; } }
            public byte PanningLoopStartPoint { get { return filedata[offset + Consts.PanningLoopStartPoint]; } }
            public byte PanningLoopEndPoint { get { return filedata[offset + Consts.PanningLoopEndPoint]; } }
            public byte VolumeType { get { return filedata[offset + Consts.VolumeType]; } }
            public byte PanningType { get { return filedata[offset + Consts.PanningType]; } }
            public byte VibratoType { get { return filedata[offset + Consts.VibratoType]; } }
            public byte VibratoSweep { get { return filedata[offset + Consts.VibratoSweep]; } }
            public byte VibratoDepth { get { return filedata[offset + Consts.VibratoDepth]; } }
            public byte VibratoRate { get { return filedata[offset + Consts.VibratoRate]; } }
            public byte VolumeFadeout { get { return filedata[offset + Consts.VolumeFadeout]; } }
        }

        public readonly string FileName;
        private byte[] filedata;


        public XMRead(string filename)
        {
            FileName = filename;
        }

        private XMHeader header;
        public XMHeader Header { get { return header; } }
        private XMPattern[] patterns;
        public XMPattern[] Patterns { get { return patterns; } }
        private XMInstrument[] instruments;
        public XMInstrument[] Instruments { get { return instruments; } }

        public void Open()
        {
            filedata = File.ReadAllBytes(FileName);

            header = new XMHeader(this, filedata);
            patterns = new XMPattern[header.NumberOfPatterns];
            instruments = new XMInstrument[header.NumberOfInstruments];

            int offset = PatternStartAt;
            for (int patternnumber = 0; patternnumber < header.NumberOfPatterns; patternnumber++)
            {
                XMPattern pattern = new XMPattern(this, filedata, offset);
                patterns[patternnumber] = pattern;
                offset += (pattern.SizeOfPatternData + pattern.LenghtOfPatternHeader);
            }

            for (int instrumentnumber = 0; instrumentnumber < header.NumberOfInstruments; instrumentnumber++)
            {
                XMInstrument instrument = new XMInstrument(this, filedata, offset);
                instruments[instrumentnumber] = instrument;
                offset = instrument.nextinstrumentofset;
            }

        }

    }
}
