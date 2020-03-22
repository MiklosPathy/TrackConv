using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv.ITF
{
    public class ITFPattern
    {
        public List<ITFRow> Rows = new List<ITFRow>();
    }

    public class ITFRow
    {
        public List<ITFNote> Channels = new List<ITFNote>();
    }
}
