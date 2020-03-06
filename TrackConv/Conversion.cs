using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class Conversion
    {
        public int CurrentBPM;
        public int CurrentTickPerRow;
        public YM2151State CYMS = new YM2151State();
        public TCProject Project = new TCProject();
    }
}
