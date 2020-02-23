using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class TCProject
    {
        public string TrackFile { get; set; } = "Example.xm";
        public List<string> YM2151Instruments { get; set; } = new List<string>() { "Instr1.dmp", "Instr2.dmp" };

    }
}
