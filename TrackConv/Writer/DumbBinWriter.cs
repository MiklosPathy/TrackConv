using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TrackConv.Writer
{
    public static class DumbBinWriter
    {
        public static void ToFile(List<byte> bytes)
        {
            bytes.AddRange(new byte[] { 0, 0 });
            File.WriteAllBytes(@"music.bin", bytes.ToArray());
        }
    }
}
