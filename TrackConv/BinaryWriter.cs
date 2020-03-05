using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TrackConv
{
    public static class BinaryWriter
    {
        public static void ToFile(List<byte> bytes)
        {
            bytes.AddRange(new byte[] { 0, 60, 0, 0 });
            File.WriteAllBytes(@"music.bin", bytes.ToArray());
        }
    }
}
