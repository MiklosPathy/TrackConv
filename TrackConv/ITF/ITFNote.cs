using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv.ITF
{
    public class ITFNote
    {
        public int? Instrument;
        public int? Note;
        public int? Volume;
        public bool NoteOff;
        public int? Effect;
        public int? EffectParam;

        public int? octave { get { return Note / 12; } set { Note = (byte)(Note % 12 + value * 12); } }
        public int? actualnote { get { return Note % 12; } set { Note = (byte)(octave * 12 + value); } }
    }


}
