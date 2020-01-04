﻿using System;
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

    }
}