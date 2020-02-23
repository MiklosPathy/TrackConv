using System;
using System.Collections.Generic;

namespace TrackConv
{
    public static class YM2151ExtensionMethods
    {
        private static readonly int[] Normal2YMNote = { 14, 0, 1, 2, 4, 5, 6, 8, 9, 10, 12, 13 };

        public static int ym2151note(this XMNote xmnote)
        {
            return Normal2YMNote[xmnote.note];
        }
        public static int ym2151octave(this XMNote xmnote)
        {
            if (xmnote.note == 0) return Math.Max(xmnote.octave - 1, 0);
            return xmnote.octave;
        }

        public static void NoteIntoBytes(this XMNote cn, List<byte> bytes, int channel, byte operatormask=0b01111000)
        {
            if (channel > 7) return;
            byte register, value = 0;

            if (cn.noteoff)
            {
                //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                //Minden operátor kuss.
                register = (byte)(0x08);
                value = 0b00000000;
                value += (byte)(channel & 0b00000111);
                addtobytes(bytes, register, value);
            }
            else
            {
                if (cn.Note != 0)
                {
                    //$28 -$2F -​O​O​O​N​N​N​N​     Chn0 - 7    KeyCode​  O = Octive, N = Note​
                    register = (byte)(0x28 + channel);
                    value = 0;
                    value += (byte)((cn.ym2151octave() & 0b00000111) << 4);
                    value += (byte)(cn.ym2151note() & 0b00001111);
                    addtobytes(bytes, register, value);

                    //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                    //Most minden operátor szóljon.
                    register = (byte)(0x08);
                    value = operatormask;
                    value += (byte)(channel & 0b00000111);
                    addtobytes(bytes, register, value);
                }
            }
        }

        private static double bpmtotickmillisec(int bpm)
        {
            const int tickperrow = 6;
            const int beat = 4;//1 beat 4 row
            int rowperminute = bpm * beat;
            int tickperminute = rowperminute * tickperrow;
            double tickpersec = tickperminute / 60;
            double secpertick = 1 / tickpersec;
            double millisecpertick = secpertick * 1000;
            return millisecpertick;
        }

        private static byte bpmtox16tick(int bpm)
        {
            double desiredcommodoreticks = bpmtotickmillisec(bpm) / ((double)1 / (double)60 * (double)1000);
            double result = Math.Max(1, desiredcommodoreticks);
            return (byte)result;
        }
        private static byte bpmtox16tickrow(int bpm)
        {
            double desiredcommodoreticks = bpmtotickmillisec(bpm) / ((double)1 / (double)60 * (double)1000) * (double)6;
            double result = Math.Max(1, desiredcommodoreticks);
            return (byte)result;
        }

        private static void addtimingbytescompressed(List<byte> bytes, double desiredcommodoreticks)
        {
            //byte register, value = 0;
            //if (bytes.Count > 1)
            //{
            //    bytes.
            //}
        }
        private static int accumulatedtiming;
        private static void addtobytes(List<byte> bytes, byte register, byte value)
        {
            if (register == 0)
            {
                accumulatedtiming += value;
                if (accumulatedtiming >= 255)
                {
                    bytes.Add(0); bytes.Add(255);
                    accumulatedtiming -= 255;
                }
            }
            else
            {
                if (accumulatedtiming != 0)
                {
                    bytes.Add(0); bytes.Add((byte)accumulatedtiming);
                    accumulatedtiming = 0;
                }
                bytes.Add(register); bytes.Add(value);
            }
        }
        public static List<byte> PatternToBytes(this XMPattern xmpattern)
        {
            int currentbpm = xmpattern.xmheader.DefaultBPM;

            List<byte> bytes = new List<byte>();
            byte register, value = 0;

            for (int rows = 0; rows < xmpattern.NumberOfRows; rows++)
            {
                //Is there any effects needs ticking here?
                bool tickingneeded = false;
                for (int channels = 0; channels < xmpattern.xmheader.NumberOfChannels; channels++)
                {
                    XMNote cn = xmpattern.PatArr[rows, channels];
                    int epu = (cn.EffectParam >> 4) & 0xF;
                    int epd = cn.EffectParam & 0xF;
                    tickingneeded =
                        tickingneeded ||
                        (cn.Effect == 0xE && epu == 0xD) ||
                        (cn.Effect == 0xE && epu == 0xC);

                    if (cn.Effect == 0xF) currentbpm = cn.EffectParam;
                }

                if (tickingneeded)
                {
                    XMNote[,] tickarr = new XMNote[6, xmpattern.xmheader.NumberOfChannels];

                    for (int channel = 0; channel < xmpattern.xmheader.NumberOfChannels; channel++)
                    {
                        XMNote cn = xmpattern.PatArr[rows, channel];
                        int epu = (cn.EffectParam >> 4) & 0xF;
                        int epd = cn.EffectParam & 0xF;

                        if (cn.Effect == 0xE && epu == 0xD)
                        {
                            if (epd > 5) epd = 5;
                            tickarr[epd, channel] = cn;
                        }
                        else if (cn.Effect == 0xE && epu == 0xC) //Note cut
                        {
                            if (epd > 5) epd = 5;
                            tickarr[0, channel] = cn;
                            tickarr[epd, channel] = new XMNote() { noteoff = true };
                        }
                        else
                        {
                            tickarr[0, channel] = cn;
                        }
                    }

                    for (int ticks = 0; ticks < 6; ticks++)
                    {
                        for (int channel = 0; channel < xmpattern.xmheader.NumberOfChannels; channel++)
                        {
                            XMNote cn = tickarr[ticks, channel];
                            if (cn != null) NoteIntoBytes(cn, bytes, channel);
                        }
                        //Timing
                        register = 0;
                        value = (byte)bpmtox16tick(currentbpm);
                        addtobytes(bytes, register, value);
                    }
                }
                else
                {
                    for (int channel = 0; channel < xmpattern.xmheader.NumberOfChannels; channel++)
                    {
                        XMNote cn = xmpattern.PatArr[rows, channel];
                        NoteIntoBytes(cn, bytes, channel);
                    }
                    //Timing
                    register = 0;
                    value = (byte)bpmtox16tickrow(currentbpm);
                    addtobytes(bytes, register, value);
                }
            }
            return bytes;
        }
    }
}

