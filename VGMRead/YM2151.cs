using System;
using System.Collections.Generic;
using System.Text;

namespace VGMRead
{
    public class YM2151
    {
        public byte[] prevregisters = new byte[256];
        public byte[] registers = new byte[256];

        public void NextTick()
        {
            for (int i = 0; i < 256; i++)
            {
                prevregisters[i] = registers[i];
            }
        }
        public List<byte> GetChangedRegisters()
        {
            List<byte> result = new List<byte>();
            for (int i = 0; i < 256; i++)
            {
                if (i != 0x08)
                    if (prevregisters[i] != registers[i])
                    {
                        result.Add((byte)i);
                        result.Add(registers[i]);
                    }
            }
            return result;
        }
        public void Reset()
        {
            for (int i = 0; i < 256; i++)
            {
                registers[i] = 0;
                if (i >= 0x60 && i <= 0x7F) registers[i] = 127;
            }
        }

        //Linear note table.... Forget it. Little Japanase engineer will do it overcomplicated. Banzaii!!!
        private static readonly int[] Normal2YMNote = { 14, 0, 1, 2, 4, 5, 6, 8, 9, 10, 12, 13 };

        public static int ym2151note(MusicalNote itfnote)
        {
            return Normal2YMNote[itfnote.note];
        }
        public static int ym2151octave(MusicalNote itfnote)
        {
            if (itfnote.note == 0) return Math.Max(itfnote.octave - 1, 0);
            return itfnote.octave;
        }

    }

}
