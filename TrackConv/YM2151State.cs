using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class YM2151State
    {
        public Dictionary<int, YM215Instrument> DefinedInstruments = new Dictionary<int, YM215Instrument>();
        public byte[] LastInstrumentsPerChannel = new byte[8];
        public int accumulatedtiming;
    }
}
