using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class YM2151State
    {
        public byte[] LastInstrumentPerChannel = new byte[8];
        public int accumulatedtiming;
    }
}
