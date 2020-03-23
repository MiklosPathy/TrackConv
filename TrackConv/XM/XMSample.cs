using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv.XM
{
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
        private int offset;

        public XMSample(byte[] filedata, int offset)
        {
            this.filedata = filedata;
            this.offset = offset;
        }

        public int SampleLength { get { return filedata.ReadAsDWord(offset + Consts.SampleLength); } }
        public int SampleLoopStart { get { return filedata.ReadAsDWord(offset + Consts.SampleLoopStart); } }
        public int SampleLoopLength { get { return filedata.ReadAsDWord(offset + Consts.SampleLoopLength); } }
        public byte Volume { get { return filedata[offset + Consts.Volume]; } }
        public byte Finetune { get { return filedata[offset + Consts.Finetune]; } }
        public byte SampleType { get { return filedata[offset + Consts.SampleType]; } }
        public byte SamplePan { get { return filedata[offset + Consts.SamplePan]; } }
        public byte RelativeNote { get { return filedata[offset + Consts.RelativeNote]; } }
        public byte Reserved { get { return filedata[offset + Consts.Reserved]; } }
        public string NameOfSample { get { return filedata.ReadAsString(offset + Consts.NameOfSample, offset + Consts.SampleData); } }

        //public const int SampleData = 0x0028;// h               "LEN" byte Sample data.The sample data is stored
        // as delta compressed data like the ProTracker.
    }
}
