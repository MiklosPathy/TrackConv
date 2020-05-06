using System;
using System.Collections.Generic;
using System.Text;

namespace VGMRead
{
    public class YM3812
    {
        public void ConsumeCommand(YM3812Command command)
        {
            registers[command.Register] = command.Value;
        }

        public byte[] registers = new byte[255];

        //A0-A8
        //Frequency value low
        //FFFFFFFF
        //
        //B0-B8
        //Frequency value high
        //Octave
        //KeyOn
        //--KOOOFF

        private void ChanelLimiter(ref int channel)
        {
            if (channel < 0) channel = 0;
            if (channel > 8) channel = 8;
        }

        public int FNumber(int channel)
        {
            ChanelLimiter(ref channel);
            int freq = registers[0xA0 + channel];
            freq += (registers[0xB0 + channel] & 0b00000011) * 256;
            return freq;
        }
        public int Block(int channel)
        {
            ChanelLimiter(ref channel);
            return (registers[0xB0 + channel] & 0b00011100) >> 2;
        }
        public bool KeyOn(int channel)
        {
            ChanelLimiter(ref channel);
            return (registers[0xB0 + channel] & 0b00100000) > 1;
        }
        public double Freq(int channel)
        {
            //            FNum = Music Frequency * 2 ^ (20 - Block) / 49716 Hz
            //Music Frequency = FNum*49716 Hz / (2 ^ (20 - Block))
            return FNumber(channel) * 49716 / Math.Pow(2, 20 - Block(channel));
        }

        //E0-F5   Wave select
        //------WW

        public int Waveform(int op)
        {
            if (op < 0) op = 0;
            if (op > 0x15) op = 0x15;

            return registers[0xE0 + op];
        }
    }
}
