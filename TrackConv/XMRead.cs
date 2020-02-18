using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TrackConv
{
    public class XMRead
    {
        public const int PatternStartAt = 0x0150; // Theoretically patterns start here in the file



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

            header = new XMHeader(filedata);
            patterns = new XMPattern[header.NumberOfPatterns];
            instruments = new XMInstrument[header.NumberOfInstruments];

            //int offset = XMHeader.Consts.PatternOrderTable + header.SongLengthInPatterns;//   PatternStartAt;
            int offset = XMHeader.Consts.HeaderSize + header.HeaderSize;//   PatternStartAt;
            for (int patternnumber = 0; patternnumber < header.NumberOfPatterns; patternnumber++)
            {
                XMPattern pattern = new XMPattern(filedata, offset);
                patterns[patternnumber] = pattern;
                offset += (pattern.SizeOfPatternData + pattern.LenghtOfPatternHeader);
            }

            for (int instrumentnumber = 0; instrumentnumber < header.NumberOfInstruments; instrumentnumber++)
            {
                XMInstrument instrument = new XMInstrument(filedata, offset);
                instruments[instrumentnumber] = instrument;
                offset = instrument.nextinstrumentofset;
            }

        }

    }
}
