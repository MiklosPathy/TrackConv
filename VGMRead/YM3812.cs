using System;
using System.Collections.Generic;
using System.Text;

namespace VGMRead
{
    public struct YM3812OperatorStats
    {
        public int OperatorID;
        public bool AmpMod;
        public bool Vibrato;
        public bool EGType;
        public bool KeyScale;
        public int Mult;
        public int KeyScaling;
        public int TotalLevel;
        public int Attack;
        public int Decay;
        public int Sustain;
        public int Release;
    }
    public struct YM3812ChannelStats
    {
        public int ChannelID;
        public int FNumber;
        public int Block;
        public double Freq;
        public int Feedback;
        public int Connection;
        public YM3812OperatorStats OPR1;
        public YM3812OperatorStats OPR2;
    }
    public class YM3812
    {
        public YM3812()
        {
            for (int i = 1; i < 19; i++)
            {
                Operators[i] = new YM3812OperatorStats();
                Operators[i].OperatorID = i;
            }

            for (int i = 0; i < 9; i++)
            {
                Channels[i] = new YM3812ChannelStats();
                Channels[i].ChannelID = i;
                Channels[i].OPR1 = Operators[GetOPR1ID(i)];
                Channels[i].OPR2 = Operators[GetOPR2ID(i)];
            }
        }
        public void ConsumeCommand(YM3812Command command)
        {
            registers[command.Register] = command.Value;
        }

        public byte[] registers = new byte[255];
        private YM3812OperatorStats[] Operators = new YM3812OperatorStats[19]; //Operator numbering starts with 1. 0. position unused.
        private YM3812ChannelStats[] Channels = new YM3812ChannelStats[9];
        public YM3812OperatorStats GetOperatorStats(int OperatorID)
        {
            if (OperatorID < 1) OperatorID = 1;
            if (OperatorID > 18) OperatorID = 18;
            YM3812OperatorStats result = Operators[OperatorID];
            int opofs = OperatorIDToOperatorOffset(OperatorID);
            result.AmpMod = AmpMod(opofs);
            result.Attack = Attack(opofs);
            result.Decay = Decay(opofs);
            result.EGType = EGType(opofs);
            result.KeyScale = KeyScale(opofs);
            result.KeyScaling = KeyScaling(opofs);
            result.Mult = Mult(opofs);
            result.Release = Release(opofs);
            result.Sustain = Sustain(opofs);
            result.TotalLevel = TotalLevel(opofs);
            result.Vibrato = Vibrato(opofs);
            return result;
        }
        public YM3812ChannelStats GetChannelStats(int ChannelID)
        {
            ChanelLimiter(ref ChannelID);
            YM3812ChannelStats result = Channels[ChannelID];
            result.Block = Block(ChannelID);
            result.Connection = Connection(ChannelID);
            result.Feedback = Feedback(ChannelID);
            result.FNumber = FNumber(ChannelID);
            result.Freq = Freq(ChannelID);
            result.OPR1 = GetOperatorStats(result.OPR1.OperatorID);
            result.OPR2 = GetOperatorStats(result.OPR2.OperatorID);
            return result;
        }

        //20-35       Amp Mod / Vibrato / EG type / Key Scaling / Multiple
        //AVEKMMMM
        public bool AmpMod(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x20 + opofs] & 0b10000000) > 1;
        }
        public bool Vibrato(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x20 + opofs] & 0b01000000) > 1;
        }
        public bool EGType(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x20 + opofs] & 0b00100000) > 1;
        }
        public bool KeyScale(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x20 + opofs] & 0b00010000) > 1;
        }
        public int Mult(int opofs)
        {
            OperatorLimiter(ref opofs);
            return registers[0x20 + opofs] & 0b00001111;
        }
        //40-55  Key scaling level / Operator output level (Total Level)
        //KKTTTTTT
        public int KeyScaling(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x40 + opofs] & 0b11000000) >> 6;
        }
        public int TotalLevel(int opofs)
        {
            OperatorLimiter(ref opofs);
            return registers[0x40 + opofs] & 0b00111111;
        }
        //60-75       Attack Rate / Decay Rate
        //AAAADDDD
        public int Attack(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x60 + opofs] & 0b11110000) >> 4;
        }
        public int Decay(int opofs)
        {
            OperatorLimiter(ref opofs);
            return registers[0x60 + opofs] & 0b00001111;
        }
        //80-95       Sustain Level / Release Rate
        //SSSSRRRR
        public int Sustain(int opofs)
        {
            OperatorLimiter(ref opofs);
            return (registers[0x80 + opofs] & 0b11110000) >> 4;
        }
        public int Release(int opofs)
        {
            OperatorLimiter(ref opofs);
            return registers[0x80 + opofs] & 0b00001111;
        }

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
        //BD         AM depth / Vibrato depth / Rhythm control
        //DDRRRRRR (Rythm On, BD, SD, TOM, TC, HH)
        public int AMVibrDepth()
        {
            return (registers[0xBD] & 011000000) >> 6;
        }


        //C0-C8 Feedback/Connection
        //----FFFC
        public int Feedback(int channel)
        {
            ChanelLimiter(ref channel);
            return (registers[0xC0 + channel] & 0b00001110) >> 1;
        }

        public int Connection(int channel)
        {
            ChanelLimiter(ref channel);
            return registers[0xC0 + channel] & 0b00000001;
        }


        //E0-F5   Wave select
        //------WW

        public int Waveform(int opofs)
        {
            OperatorLimiter(ref opofs);
            return registers[0xE0 + opofs];
        }

        private void OperatorLimiter(ref int opofs)
        {
            if (opofs < 0) opofs = 0;
            if (opofs > 0x15) opofs = 0x15;
        }

        public static int OperatorIDToOperatorOffset(int oper)
        {
            //ÚÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
            //³ OPR ³ 1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18 ³
            //ÃÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
            //³ OFS ³ 00  01  02  03  04  05  08  09  0A  0B  0C  0D  10  11  12  13  14  15 ³
            //ÀÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
            switch (oper)
            {
                case 1: return 0x00;
                case 2: return 0x01;
                case 3: return 0x02;
                case 4: return 0x03;
                case 5: return 0x04;
                case 6: return 0x05;
                case 7: return 0x08;
                case 8: return 0x09;
                case 9: return 0x0A;
                case 10: return 0x0B;
                case 11: return 0x0C;
                case 12: return 0x0D;
                case 13: return 0x10;
                case 14: return 0x11;
                case 15: return 0x12;
                case 16: return 0x13;
                case 17: return 0x14;
                case 18: return 0x15;
                default:
                    throw new Exception("Operator not exists:" + oper);
            }
        }
        //The next two tables illustrates which operators together form a channel:

        //ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
        //³              M E L O D I C M O D E              ³
        //ÃÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄ´
        //³ CHAN ³ 0  ³ 1  ³ 2  ³ 3  ³ 4  ³ 5  ³ 6  ³ 7  ³ 8  ³
        //ÃÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄ´
        //³ OPR1 ³ 1  ³ 2  ³ 3  ³ 7  ³ 8  ³ 9  ³ 13 ³ 14 ³ 15 ³
        //³ OPR2 ³ 4  ³ 5  ³ 6  ³ 10 ³ 11 ³ 12 ³ 16 ³ 17 ³ 18 ³
        //ÀÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÙ

        //ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
        //³                P E R C U S S I O N   M O D E                ³
        //ÃÄÄÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄÂÄÄÄÄ´
        //³ CHAN ³ 0  ³ 1  ³ 2  ³ 3  ³ 4  ³ 5  ³ BD ³ SD ³ TT ³ CY ³ HH ³
        //ÃÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄ´
        //³ OPR1 ³ 1  ³ 2  ³ 3  ³ 7  ³ 8  ³ 9  ³ 13 ³ 17 ³ 15 ³ 18 ³ 14 ³
        //³ OPR2 ³ 4  ³ 5  ³ 6  ³ 10 ³ 11 ³ 12 ³ 16 ³    ³    ³    ³    ³
        //ÀÄÄÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÁÄÄÄÄÙ
        public static int GetOPR1ID(int ChannelID)
        {
            switch (ChannelID)
            {
                case 0: return 1;
                case 1: return 2;
                case 2: return 3;
                case 3: return 7;
                case 4: return 8;
                case 5: return 9;
                case 6: return 12;
                case 7: return 14;
                case 8: return 15;
                default:
                    throw new Exception("Illegal ChannelID:" + ChannelID);
            }
        }
        public static int GetOPR2ID(int ChannelID)
        {
            switch (ChannelID)
            {
                case 0: return 4;
                case 1: return 5;
                case 2: return 6;
                case 3: return 10;
                case 4: return 11;
                case 5: return 12;
                case 6: return 16;
                case 7: return 17;
                case 8: return 18;
                default:
                    throw new Exception("Illegal ChannelID:" + ChannelID);
            }
        }


    }
}
