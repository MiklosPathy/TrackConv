using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class TCProject
    {
        public string TrackFile { get; set; } = "Example.xm";
        public List<Instrument> YM2151Instruments { get; set; } = new List<Instrument>()
        {
          new Instrument() { DMPFile = "Instr1.dmp", Detune = null },
          new Instrument() { DMPFile="Instr2.dmp", Detune= 0 }
        };
        public Position ConvertFrom { get; set; } = new Position() { Track = 0, Row = 0 };
        public Position ConvertTo { get; set; } = null;
        public int? OverrideRowPerBeat { get; set; }
        public string OutputDirectory { get; set; }

    }

    public class Position
    {
        public int? Track { get; set; }
        public int? Row { get; set; }
    }

    public class Instrument
    {
        public string DMPFile { get; set; }
        public int? Detune { get; set; }
    }
}
