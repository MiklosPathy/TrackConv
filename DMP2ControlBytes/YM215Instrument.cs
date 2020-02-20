﻿using System;
using System.Collections.Generic;
using System.Text;

namespace DMP2ControlBytes
{
    public class YM2151operator
    {
        /// <summary>
        /// Phase Multiply
        /// Octave detune upwards
        /// 4 bits;
        /// </summary>
        public byte MULT;
        /// <summary>
        /// Total Level
        /// Simply: Volume
        /// 7 bits
        /// </summary>
        public byte TL;
        /// <summary>
        /// Attack Rate
        /// 5 bits
        /// </summary>
        public byte AR;
        /// <summary>
        /// First Decay Rate
        /// 5 bits
        /// </summary>
        public byte D1R;
        /// <summary>
        /// Second Decay Rate
        /// 5 bits
        /// </summary>
        public byte D2R;
        /// <summary>
        /// Release Rate
        /// 4 bits;
        /// </summary>
        public byte RR;
        /// <summary>
        /// First Decay Level.
        /// AKA: Sustain Level
        /// 4 bits
        /// </summary>
        public byte D1L;

        /// <summary>
        /// AM Enabled for operator
        /// 1 bit
        /// </summary>
        public byte AM;
        /// <summary>
        /// Key scale? Probably KS in registers.
        /// 2 bits
        /// </summary>
        public byte KS;
        /// <summary>
        /// Detune
        /// 3 bits
        /// </summary>
        public byte DT;
        /// <summary>
        /// Detune 2
        /// Useless Idiotic Detune Function
        /// 2 bits
        /// </summary>
        public byte DT2;


        public byte SSGEG_Enabled;
    }
    public class YM215Instrument
    {
        public byte FILE_VERSION;
        public byte SYSTEM_YM2151;
        public byte INSTRUMENT_MODE;
        /// <summary>
        /// Phase Modulation Sensitivity
        /// LFO -> Freq (Vibrato)
        /// 3 bits
        /// </summary>
        public byte PMS;
        /// <summary>
        /// Self Feedback level
        /// 3 bit
        /// </summary>
        public byte FB;
        /// <summary>
        /// Algorithm
        /// 3 bit
        /// </summary>
        public byte CON;
        /// <summary>
        /// Amplitude Modulation Sensitivity
        /// LFO -> Amplitude
        /// 2 bits
        /// </summary>
        public byte AMS;
        /// <summary>
        /// Operators
        /// </summary>
        public YM2151operator[] OPS = new YM2151operator[4] { new YM2151operator(), new YM2151operator(), new YM2151operator(), new YM2151operator() };
        public void ReadFromDMP(byte[] data)
        {
            int position = 0;
            //START OF DMP FORMAT
            //  1 Byte: FILE_VERSION, must be 11(0x0B) for DefleMask v0.12.0
            FILE_VERSION = data[position]; position++;
            //  1 Byte:  System:
            //SYSTEM_YM2151         0x08
            SYSTEM_YM2151 = data[position]; position++;
            //  1 Byte:   Instrument Mode(1 = FM, 0 = STANDARD)
            INSTRUMENT_MODE = data[position]; position++;
            //  IF INSTRUMENT MODE IS FM ( = 1)
            //  1 Byte: LFO(FMS on YM2612, PMS on YM2151)
            PMS = data[position]; position++;
            //  1 Byte: FB
            FB = data[position]; position++;
            //  1 Byte: ALG
            CON = data[position]; position++;
            //  1 Byte: LFO2(AMS on YM2612, AMS on YM2151)
            AMS = data[position]; position++;

            //  Repeat this TOTAL_OPERATORS times
            for (int i = 0; i < 4; i++)
            {
                //1 Byte: MULT
                OPS[i].MULT = data[position]; position++;
                //1 Byte: TL
                OPS[i].TL = data[position]; position++;
                //1 Byte: AR
                OPS[i].AR = data[position]; position++;
                //1 Byte: DR
                OPS[i].D1R = data[position]; position++;
                //1 Byte: SL
                OPS[i].D1L = data[position]; position++;
                //1 Byte: RR
                OPS[i].RR = data[position]; position++;
                //1 Byte: AM
                OPS[i].AM = data[position]; position++;
                //1 Byte: RS  //Probably Key Scale
                OPS[i].KS = data[position]; position++;
                //1 Byte: DT(DT2 << 4 | DT on YM2151)
                OPS[i].DT = data[position]; position++;
                OPS[i].DT2 = (byte)(OPS[i].DT >> 4);
                //1 Byte: D2R
                OPS[i].D2R = data[position]; position++;
                //1 Byte: SSGEG_Enabled << 3 | SSGEG
                OPS[i].SSGEG_Enabled = data[position]; position++;

            }

            //For some reason Operator 1 and 2 are swapped in the DMP file...
            YM2151operator op = OPS[1];
            OPS[1] = OPS[2];
            OPS[2] = op;

            //END OF DMP FORMAT
        }

        public void ToConsole()
        {
            Console.WriteLine("File version (11):" + FILE_VERSION + "\t System (8):" + SYSTEM_YM2151 + "\t Instrument Mode (1):" + INSTRUMENT_MODE);
            Console.WriteLine("PMS:" + PMS + "\t FB:" + FB + "\t CON:" + CON + "\t AMS:" + AMS);
            Console.WriteLine("--------------------------------------------");
            Console.Write("OPS:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + i); }; Console.WriteLine();
            Console.WriteLine("--------------------------------------------");
            Console.Write("MULT:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].MULT); }; Console.WriteLine();
            Console.Write("TL:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].TL); }; Console.WriteLine();
            Console.Write("AR:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].AR); }; Console.WriteLine();
            Console.Write("D1R:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].D1R); }; Console.WriteLine();
            Console.Write("D2R:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].D2R); }; Console.WriteLine();
            Console.Write("RR:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].RR); }; Console.WriteLine();
            Console.Write("D1L:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].D1L); }; Console.WriteLine();
            Console.Write("AM:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].AM); }; Console.WriteLine();
            Console.Write("RS:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].KS); }; Console.WriteLine();
            Console.Write("DT:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].DT); }; Console.WriteLine();
            Console.Write("SS:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + OPS[i].SSGEG_Enabled); }; Console.WriteLine();
        }

        public Dictionary<byte, byte> ToControlBytes(int channel, bool left = true, bool right = true)
        {
            byte register, value = 0;
            Dictionary<byte, byte> bytes = new Dictionary<byte, byte>();

            channel = (byte)channel & 0b00000111;

            //$20-$27   L​R​F​F​F​C​C​C​    Channel 0-7     L = Left, R = Right, F = Feedback, C = Connection​
            FB = (byte)(FB & 0b00000111);
            CON = (byte)(CON & 0b00000111);
            register = (byte)(0x20 + channel);
            value = 0;
            value += (byte)(left ? 0b10000000 : 0);
            value += (byte)(right ? 0b01000000 : 0);
            value += (byte)(FB << 3);
            value += CON;
            bytes[register] = value;

            //$38-$3F	-P​P​P​--​A​A​    Channel 0-7     PMS / AMS​  P = PMS , A = AMS​
            AMS = (byte)(FB & 0b00000011);
            PMS = (byte)(FB & 0b00000111);
            register = (byte)(0x38 + channel);
            value = 0;
            value += (byte)(PMS << 4);
            value += AMS;
            bytes[register] = value;

            for (int i = 0; i < 4; i++)
            {
                int slot = i * 8 + channel;
                YM2151operator op = OPS[i];

                //$40-$5F	-​D​D​D​M​M​M​M​    Slot1 - 32.     Detune / Mult​  D = Detune D1T, M = Mult​
                register = (byte)(0x40 + slot);
                value = 0;
                op.DT = (byte)(op.DT & 0b00000111);
                op.MULT = (byte)(op.DT & 0b00001111);
                value += (byte)(op.DT << 4);
                value += op.MULT;
                bytes[register] = value;

                //$60 -$7F  -​V​V​V​V​V​V​V​    Slot1 - 32.     Volume​     V = Volume(TL)(0 = max)​
                register = (byte)(0x60 + slot);
                value = 0;
                op.TL = (byte)(op.TL & 0b01111111);
                value += op.TL;
                bytes[register] = value;

                //$80 -$9F  K​K​-​A​AA​A​A​     Slot1 - 32.     Keyscale / Attack​  K = Keycale, A = attack​
                register = (byte)(0x80 + slot);
                value = 0;
                op.KS = (byte)(op.KS & 0b00000011);
                op.AR = (byte)(op.AR & 0b00011111);
                value += (byte)(op.KS << 5);
                value += op.AR;
                bytes[register] = value;

                //$A0-$BF	A​-​-​D​D​D​D​D​    Slot1 - 32.      AMS Enable / Decay​   A = AMS - EN, D = Decay D1R​
                register = (byte)(0xA0 + slot);
                value = 0;
                op.AM = (byte)(op.AM & 0b00000001);
                op.D1R = (byte)(op.D1R & 0b00011111);
                value += (byte)(op.AM << 7);
                value += op.D1R;
                bytes[register] = value;

                //$C0-$DF	T​T​-​D​D​D​D​D​    Slot1 - 32.     DeTune2 / Decay​2         T = Detune DT2, D = Decay D2R​
                register = (byte)(0xC0 + slot);
                value = 0;
                op.DT2 = (byte)(op.DT2 & 0b00000011);
                op.D2R = (byte)(op.D2R & 0b00011111);
                value += (byte)(op.DT2 << 6);
                value += op.D2R;
                bytes[register] = value;

                //$E0 -$FF  D​D​D​D​R​R​R​R​    Slot1 - 32.     Decay Level/ Release​        D = Decay D1L, R = Release Rate​
                register = (byte)(0xE0 + slot);
                value = 0;
                op.D1L = (byte)(op.D1L & 0b00001111);
                op.RR = (byte)(op.RR & 0b00001111);
                value += (byte)(op.D1L << 6);
                value += op.RR;
                bytes[register] = value;
            }




            return bytes;
        }
    }
}
