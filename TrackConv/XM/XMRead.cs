using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using TrackConv.ITF;

namespace TrackConv.XM
{
    public class XMRead
    {
        public const int PatternStartAt = 0x0150; // Theoretically patterns start here in the file. Except if not. 



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
                XMPattern pattern = new XMPattern(filedata, offset, header);
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

        public ITFHeader ToITF()
        {
            ITFHeader result = new ITFHeader();
            result.BeatPerMinute = Header.DefaultBPM;
            result.TickPerRow = Header.DefaultTempo;

            foreach (var pat in Patterns)
            {
                ITFPattern itfp = new ITFPattern();
                bool emptypattern = true;
                for (int row = 0; row < pat.NumberOfRows; row++)
                {
                    ITFRow itfr = new ITFRow();
                    bool emptyrow = true;
                    for (int channel = 0; channel < Header.NumberOfChannels; channel++)
                    {
                        XMNote xmnote = pat.PatArr[row, channel];
                        ITFNote itfn = null;

                        if (xmnote != null)
                        {
                            emptyrow = false;
                            emptypattern = false;
                            itfn = new ITFNote();
                            if (xmnote.Instrument != 0) itfn.Instrument = xmnote.Instrument;
                            if (xmnote.Note != 0) itfn.Note = xmnote.Note;
                            itfn.Volume = xmnote.Volume;
                            itfn.NoteOff = xmnote.noteoff;
                            itfn.Effect = xmnote.Effect;
                            itfn.EffectParam = xmnote.EffectParam;
                        }
                        itfr.Channels.Add(itfn);
                    }
                    if (emptyrow) itfr = null;
                    itfp.Rows.Add(itfr);
                }
                if (emptypattern) itfp = null;
                result.Patterns.Add(itfp);
            }

            foreach (byte item in Header.PatternOrderTable)
            {
                result.PlayOrder.Add(result.Patterns[item]);
            }

            return result;
        }

    }
}
