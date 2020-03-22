using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv.ITF
{
    public class ITFHeader
    {
        /// <summary>
        /// This is obvious.
        /// </summary>
        public int BeatPerMinute = 125;
        /// <summary>
        /// For some reason trackers like to use multiple rows for one Beat.
        /// </summary>
        public int RowPerBeat = 4;
        /// <summary>
        /// In case of some effects (like arpeggie) one row is multiplied for ticks. One tick is the real playing speed.
        /// Tick per second calculation (frequency) : BeatPerMinute*RowPerBeat*TickPerRow/60
        /// Millisec per tick = 1000/Tick per second
        /// </summary>
        public int TickPerRow = 6;

        public List<ITFPattern> PlayOrder = new List<ITFPattern>();

        public List<ITFPattern> Patterns = new List<ITFPattern>();


    }
}
