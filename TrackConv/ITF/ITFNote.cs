using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv.ITF
{
    public struct ITFNote
    {
        public int? Note;
        public int? Volume;
        public bool NoteOff;
        public int? Effect;
        public int? EffectParam;
    }
}
