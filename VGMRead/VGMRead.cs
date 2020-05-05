using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackConv;

namespace VGMRead
{
    public class VGMRead
    {
        public readonly string FileName;
        private byte[] filedata;

        public VGMHeader Header { get; private set; }

        public VGMRead(string filename)
        {
            FileName = filename;
        }

        public void Open()
        {
            filedata = File.ReadAllBytes(FileName);
            Header = new VGMHeader(filedata);

            var a = Header.VGMdataoffset;
        }


    }

    public class VGMHeader
    {
        /*
             00  01  02  03   04  05  06  07   08  09  0A  0B   0C  0D  0E  0F
        0x00 ["Vgm " ident]   [EoF offset]     [Version]        [SN76489 clock]
        0x10 [YM2413 clock]   [GD3 offset]     [Total # samples][Loop offset    ]
        0x20 [Loop # samples ][Rate           ][SN FB][SNW][SF] [YM2612 clock   ]
        0x30 [YM2151 clock]   [VGM data offset][Sega PCM clock] [SPCM Interface]
        0x40 [RF5C68 clock]   [YM2203 clock]   [YM2608 clock]   [YM2610/B clock]
        0x50 [YM3812 clock]   [YM3526 clock]   [Y8950 clock]    [YMF262 clock]
        0x60 [YMF278B clock]  [YMF271 clock]   [YMZ280B clock]  [RF5C164 clock]
        0x70 [PWM clock]      [AY8910 clock]   [AYT] [AY Flags] [VM] ***[LB][LM]
        0x80 [GB DMG clock]   [NES APU clock]  [MultiPCM clock] [uPD7759 clock]
        0x90 [OKIM6258 clock] [OF][KF][CF]***  [OKIM6295 clock] [K051649 clock]
        0xA0 [K054539 clock]  [HuC6280 clock]  [C140 clock]     [K053260 clock]
        0xB0 [Pokey clock]    [QSound clock]   ************     [Extra Hdr ofs]
        0xC0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xD0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xE0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xF0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        */

        public static class Consts
        {
            public const int Vgmident = 0x0000;              // ["Vgm " ident]
            public const int EoFoffset = 0x0004;             // [EoF offset]
            public const int Version = 0x0008;               // [Version]
            public const int SN76489clock = 0x000C;          // [SN76489 clock]
            public const int YM2413clock = 0x0010;           // [YM2413 clock]
            public const int GD3offset = 0x0014;             // [GD3 offset]
            public const int Totalsamples = 0x0018;          // [Total # samples]
            public const int Loopoffset = 0x001C;            // [Loop offset    ]
            public const int Loopsamples = 0x0020;           // [Loop # samples ]
            public const int Rate = 0x0024;                  // [Rate           ]
            public const int SNFB = 0x0028;                  // [SN FB]
            public const int SNW = 0x002A;                   // [SNW]
            public const int SF = 0x002B;                    // [SF]
            public const int YM2612clock = 0x002C;           // [YM2612 clock   ]
            public const int YM2151clock = 0x0030;           // [YM2151 clock]
            public const int VGMdataoffset = 0x0034;         // [VGM data offset]
            public const int SegaPCMclock = 0x0038;          // [Sega PCM clock]
            public const int SPCMInterface = 0x003C;         // [SPCM Interface]
            public const int RF5C68clock = 0x0040;           // [RF5C68 clock]
            public const int YM2203clock = 0x0044;           // [YM2203 clock]
            public const int YM2608clock = 0x0048;           // [YM2608 clock]
            public const int YM2610Bclock = 0x004C;          // [YM2610/B clock]
            public const int YM3812clock = 0x0050;           // [YM3812 clock]
            public const int YM3526clock = 0x0054;           // [YM3526 clock]
            public const int Y8950clock = 0x0058;            // [Y8950 clock]
            public const int YMF262clock = 0x005C;           // [YMF262 clock]
        }

        private byte[] filedata;
        public VGMHeader(byte[] filedata)
        {
            this.filedata = filedata;
            if (Vgmident != "Vgm ") throw new Exception("Non Vgm file, exitus.");

        }

        public string Vgmident { get { return filedata.ReadAsString(Consts.Vgmident, 4); } }
        public int EoFoffset { get { return filedata.ReadAsLittleendianDWord(Consts.EoFoffset) + Consts.EoFoffset; } }

        public int VersionNum { get { return int.Parse(filedata[Consts.Version + 1].ToString("X")); } }
        public int VersionSubNum { get { return int.Parse(filedata[Consts.Version].ToString("X")); } }
        public int VersionCombined { get { return VersionNum * 100 + VersionSubNum; } }
        public string VersionString { get { return string.Format("{0}.{1}", VersionNum, VersionSubNum); } }
        public int GD3offset { get { return filedata.ReadAsLittleendianDWord(Consts.GD3offset); } }
        public int Totalsamples { get { return filedata.ReadAsLittleendianDWord(Consts.Totalsamples); } }
        public int Loopoffset { get { return filedata.ReadAsLittleendianDWord(Consts.Loopoffset); } }
        public int Loopsamples { get { return filedata.ReadAsLittleendianDWord(Consts.Loopsamples); } }
        public int Rate { get { return filedata.ReadAsLittleendianDWord(Consts.Rate); } }
        public int VGMdataoffset
        {
            get
            {
                if (VersionCombined < 150) return 0x40;
                return filedata.ReadAsLittleendianDWord(Consts.VGMdataoffset) + Consts.VGMdataoffset;
            }
        }


    }
}
