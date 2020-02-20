using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
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
        private int offset;

        public XMPattern(byte[] filedata, int offset)
        {
            this.filedata = filedata;
            this.offset = offset;
        }

        public int LenghtOfPatternHeader { get { return filedata.ReadAsDWord(offset + Consts.LenghtOfPatternHeader); } }
        public byte PatternPackType { get { return filedata[offset + Consts.PatternPackType]; } }
        public int NumberOfRows { get { return filedata.ReadAsWord(offset + Consts.NumberOfRows); } }
        public int SizeOfPatternData { get { return filedata.ReadAsWord(offset + Consts.SizeOfPatternData); } }

        private byte[] patterndata;
        public byte[] PatternData
        {
            get
            {
                if (patterndata == null) patterndata = filedata.CopyOutByteArray(offset + LenghtOfPatternHeader, SizeOfPatternData);
                return patterndata;
            }
        }

        public void PatternToConsole(XMHeader header)
        {
            int offset = 0;
            int channel = 0;
            byte row = 0;
            XMNote xmnote = new XMNote();

            while (offset < PatternData.Length)
            {
                xmnote.TryParseNextNoteFrom(ref offset, PatternData);
                if (channel == 0)
                {
                    Console.ForegroundColor = ConsoleColor.Cyan;
                    Console.Write(row.ToString("D2"));
                    Console.ResetColor();
                    Console.Write("|");
                }
                xmnote.ToConsole();
                channel++;
                if (channel == header.NumberOfChannels)
                {
                    channel = 0;
                    row++;
                    Console.WriteLine();
                }
            }
        }

        public XMNote[,] PatArr;

        public void PatternToArray(XMHeader header)
        {
            PatArr = new XMNote[NumberOfRows, header.NumberOfChannels];
            int offset = 0;
            int channel = 0;
            byte row = 0;


            while (offset < PatternData.Length)
            {
                XMNote xmnote = new XMNote();
                PatArr[row, channel] = xmnote;
                xmnote.TryParseNextNoteFrom(ref offset, PatternData);
                channel++;
                if (channel == header.NumberOfChannels)
                {
                    channel = 0;
                    row++;
                }
            }
        }

        public List<byte> PatternToBytes(XMHeader header)
        {
            List<byte> bytes = new List<byte>();
            byte register, value = 0;

            for (int i = 0; i < NumberOfRows; i++)
            {
                for (int j = 0; j < header.NumberOfChannels; j++)
                {
                    XMNote cn = PatArr[i, j];
                    if (cn.Note != 0)
                    {
                        //$28 -$2F -​O​O​O​N​N​N​N​     Chn0 - 7    KeyCode​  O = Octive, N = Note​
                        register = (byte)(0x28 + j);
                        value = 0;
                        value += (byte)((cn.octave & 0b00000111) << 4);
                        value += (byte)(cn.note & 0b00001111);
                        bytes.Add(register);
                        bytes.Add(value);

                        //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                        //Most minden operátor szóljon.
                        register = (byte)(0x08);
                        value = 0b01111000;
                        value += (byte)(j & 0b00000111);
                        bytes.Add(register);
                        bytes.Add(value);
                    }
                    if (cn.noteoff)
                    {
                        //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                        //Minden operátor kuss.
                        register = (byte)(0x08);
                        value = 0b00000000;
                        value += (byte)(j & 0b00000111);
                        bytes.Add(register);
                        bytes.Add(value);
                    }
                }

                //Timing
                register = 0;
                value = 100;
                bytes.Add(register);
                bytes.Add(value);

            }
            return bytes;
        }
    }
}
