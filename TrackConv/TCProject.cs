using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class TCProject
    {
        public string TrackFile { get; set; } = "Example.xm";
        public List<string> YM2151Instruments { get; set; } = new List<string>() { "Instr1.dmp", "Instr2.dmp" };
        public Position ConvertFrom { get; set; } = new Position() { Track = 0, Row = 0 };
        public Position ConvertTo { get; set; } = null;

    }

    public class Position
    {
        public int? Track { get; set; }
        public int? Row { get; set; }
    }
}
