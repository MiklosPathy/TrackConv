using System;
using System.Collections.Generic;
using System.Text;
using TrackConv.ITF;
using TrackConv.XM;

namespace TrackConv
{
    public class Conversion
    {
        public int CurrentBPM;
        public int CurrentTickPerRow;
        public int CurrentRowPerBeat = 4;
        public YM2151State CYMS = new YM2151State();
        public TCProject Project = new TCProject();
        public Dictionary<int, YM2151Instrument> DefinedInstruments = new Dictionary<int, YM2151Instrument>();
        [Obsolete]
        public XMRead XM;
        public ITFHeader ITF;
        public List<byte> OBs = new List<byte>();
    }
}
