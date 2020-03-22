using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv.ITF
{
    public class ITFPattern
    {
        public ITFRow[] Rows;
    }

    public class ITFRow
    {
        public ITFNote[] Channels;
    }
}
