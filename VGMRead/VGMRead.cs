using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VGMRead
{
    public class VGMRead
    {
        public readonly string FileName;
        private byte[] filedata;

        public VGMRead(string filename)
        {
            FileName = filename;
        }

        public void Open()
        {
            filedata = File.ReadAllBytes(FileName);



        }


    }

    public class VGMHEader
    {
        /*
               00  01  02  03   04  05  06  07   08  09  0A  0B  0C  0D  0E  0F
        0x00 ["Vgm " ident] [EoF offset] [Version] [SN76489 clock]
        0x10 [YM2413 clock] [GD3 offset] [Total # samples][Loop offset    ]
        0x20 [Loop # samples ][Rate           ][SN FB ][SNW][SF][YM2612 clock   ]
        0x30 [YM2151 clock] [VGM data offset] [Sega PCM clock] [SPCM Interface]
        0x40 [RF5C68 clock] [YM2203 clock] [YM2608 clock] [YM2610/B clock]
        0x50 [YM3812 clock] [YM3526 clock] [Y8950 clock] [YMF262 clock]
        0x60 [YMF278B clock] [YMF271 clock] [YMZ280B clock] [RF5C164 clock]
        0x70 [PWM clock] [AY8910 clock] [AYT] [AY Flags] [VM] ***[LB][LM]
        0x80 [GB DMG clock] [NES APU clock] [MultiPCM clock] [uPD7759 clock]
        0x90 [OKIM6258 clock] [OF] [KF] [CF] ***[OKIM6295 clock][K051649 clock]
        0xA0 [K054539 clock] [HuC6280 clock] [C140 clock] [K053260 clock]
        0xB0 [Pokey clock] [QSound clock] ************[Extra Hdr ofs]
        0xC0  *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xD0  *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xE0  *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xF0  *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        */
        private byte[] filedata;
        public VGMHEader(byte[] filedata)
        {
            this.filedata = filedata;
        }
    }
}
