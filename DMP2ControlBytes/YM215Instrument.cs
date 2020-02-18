using System;
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

        public byte AM;
        public byte RS;
        /// <summary>
        /// Detune?
        /// </summary>
        public byte DT;

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
                //1 Byte: RS
                OPS[i].RS = data[position]; position++;
                //1 Byte: DT(DT2 << 4 | DT on YM2151)
                OPS[i].DT = data[position]; position++;
                //1 Byte: D2R
                OPS[i].D2R = data[position]; position++;
                //1 Byte: SSGEG_Enabled << 3 | SSGEG
                OPS[i].SSGEG_Enabled = data[position]; position++;
            }

            //END OF DMP FORMAT
        }
    }
}
