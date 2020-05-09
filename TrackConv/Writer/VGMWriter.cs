using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TrackConv.Writer
{
    public static class VGMWriter
    {
        /*
        ---- 00  01  02  03   04  05  06  07   08  09  0A  0B   0C  0D  0E  0F
        0x00 ["Vgm " ident]   [EoF offset]     [Version]        [SN76489 clock]
        0x10 [YM2413 clock]   [GD3 offset]     [Total # samples][Loop offset  ]
        0x20 [Loop # samples] [Rate           ][SN FB][SNW][SF] [YM2612 clock ]
        0x30 [YM2151 clock]   [VGM data offset][Sega PCM clock] [SPCM Interface]
        0x40 [RF5C68 clock]   [YM2203 clock]   [YM2608 clock]   [YM2610/B clock]
        0x50 [YM3812 clock]   [YM3526 clock]   [Y8950 clock]    [YMF262 clock]
        0x60 [YMF278B clock]  [YMF271 clock]   [YMZ280B clock]  [RF5C164 clock]
        0x70 [PWM clock]      [AY8910 clock]   [AYT] [AY Flags] [VM]***[LB][LM]
        0x80 [GB DMG clock]   [NES APU clock]  [MultiPCM clock] [uPD7759 clock]
        0x90 [OKIM6258 clock] [OF][KF][CF]***  [OKIM6295 clock] [K051649 clock]
        0xA0 [K054539 clock]  [HuC6280 clock]  [C140 clock]     [K053260 clock]
        0xB0 [Pokey clock]    [QSound clock]   ************     [Extra Hdr ofs]
        0xC0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xD0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xE0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xF0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        */
        public static void ToFile(List<byte> bytes)
        {
            List<byte> vgmdata = new List<byte>();
            int eofoffset = 0;
            int totalsamples = 0;

            for (int i = 0; i < bytes.Count; i += 2)
            {
                if (bytes[i] == 0)
                {
                    int wait = 735 * bytes[i + 1];
                    totalsamples += wait;
                    while (wait > 0)
                    {
                        vgmdata.Add(0x61);
                        if (wait > UInt16.MaxValue)
                        {
                            vgmdata.AddRange(BitConverter.GetBytes(UInt16.MaxValue));
                        }
                        else
                        {
                            vgmdata.AddRange(BitConverter.GetBytes((UInt16)wait));
                        }
                        wait -= UInt16.MaxValue;
                    }
                }
                else
                {
                    vgmdata.AddRange(new byte[] { 0x54, bytes[i], bytes[i + 1] });
                }
            }
            vgmdata.Add(0x66);
            eofoffset = vgmdata.Count - 4;

            List<byte> tofile = new List<byte>();
            tofile.AddRange(new byte[] { (byte)'V', (byte)'g', (byte)'m', (byte)' ' });
            tofile.AddRange(BitConverter.GetBytes(eofoffset));
            tofile.AddRange(BitConverter.GetBytes(0x00000170));
            tofile.AddRange(new byte[12]);
            tofile.AddRange(BitConverter.GetBytes(totalsamples));
            tofile.AddRange(new byte[8]);
            tofile.AddRange(BitConverter.GetBytes(60));
            tofile.AddRange(new byte[8]);
            tofile.AddRange(BitConverter.GetBytes(3579545));
            tofile.AddRange(BitConverter.GetBytes(0x000000CC));
            tofile.AddRange(new byte[200]);
            tofile.AddRange(vgmdata);

            File.WriteAllBytes(@"music.vgm", tofile.ToArray());
        }
    }
}
