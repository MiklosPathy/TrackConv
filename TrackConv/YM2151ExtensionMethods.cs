using System;
using System.Collections.Generic;
using System.Linq;
using TrackConv.ITF;

namespace TrackConv
{
    public static class YM2151ExtensionMethods
    {
        //Linear note table.... Forget it. Little Japanase engineer will do it overcomplicated. Banzaii!!!
        private static readonly int[] Normal2YMNote = { 14, 0, 1, 2, 4, 5, 6, 8, 9, 10, 12, 13 };

        public static int ym2151note(this ITFNote itfnote)
        {
            return Normal2YMNote[itfnote.actualnote.Value];
        }
        public static int ym2151octave(this ITFNote itfnote)
        {
            if (itfnote.actualnote == 0) return Math.Max(itfnote.octave.Value - 1, 0);
            return itfnote.octave.Value;
        }

        private static void ResetChannel(List<byte> bytes, int channel, YM2151State cs)
        {
            byte register, value = 0;
            //Minden operátor kuss.
            register = (byte)(0x08);
            value = 0b00000000;
            value += (byte)(channel & 0b00000111);
            addtobytes(bytes, register, value, cs);

            for (int i = 0; i < 4; i++)
            {
                int slot = i * 8 + channel;
                //$60-$7F  -​V​V​V​V​V​V​V​    Slot1 - 32.     Volume​     V = Volume(TL)(0 = max)​
                register = (byte)(0x60 + slot);
                value = 127;
                addtobytes(bytes, register, value, cs);
            }
        }

        public static void NoteIntoBytes(this ITFNote cn, List<byte> bytes, int channel, Conversion conv, byte operatormask = 0b01111000)
        {
            if (channel > 7) return;
            byte register, value = 0;

            //Instrument setup for channel
            if (cn.Instrument != null)
                if (conv.CYMS.LastInstrumentPerChannel[channel] != cn.Instrument)
                {
                    ResetChannel(bytes, channel, conv.CYMS);
                    YM2151Instrument ci = conv.DefinedInstruments[cn.Instrument.Value];
                    var cbs = ci.ToControlBytes(channel);
                    foreach (var item in cbs)
                    {
                        addtobytes(bytes, item.Key, item.Value, conv.CYMS);
                    }
                    conv.CYMS.LastInstrumentPerChannel[channel] = (byte)cn.Instrument.Value;
                }

            //Volume control
            if (!cn.NoteOff && cn.Note != 0 && cn.Volume == 0) cn.Volume = 64;
            if (cn.Effect == 0xC) cn.Volume = cn.EffectParam;
            if (cn.Volume != 0)
            {
                if (conv.CYMS.LastInstrumentPerChannel[channel] != 0)
                {
                    YM2151Instrument ci = conv.DefinedInstruments[conv.CYMS.LastInstrumentPerChannel[channel]];
                    //Csak a hallható operátor hangerejét kéne módosítani. Elvileg.
                    //De most még nem.

                    Dictionary<byte, byte> tempd = new Dictionary<byte, byte>();
                    ci.SetVolumeToBytes(tempd, channel, (byte)cn.Volume.Value);
                    foreach (var item in tempd)
                    {
                        addtobytes(bytes, item.Key, item.Value, conv.CYMS);
                    }
                }
            }

            if (cn.NoteOff || cn.Effect == 0x14)
            {
                //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                //Minden operátor kuss.
                register = (byte)(0x08);
                value = 0b00000000;
                value += (byte)(channel & 0b00000111);
                addtobytes(bytes, register, value, conv.CYMS);
            }
            else
            {
                if (cn.Note.HasValue)
                {
                    if (conv.Project.YM2151Instruments[(byte)cn.Instrument - 1].Detune.HasValue)
                    {
                        int newnote = cn.Note.Value + conv.Project.YM2151Instruments[(byte)cn.Instrument - 1].Detune.Value;
                        if (newnote <= 0) throw new Exception("Detune error. Out of range downwards.");
                        cn.Note = (byte)(newnote);
                        if (cn.NoteOff) throw new Exception("Detune error. Out of range upwards.");
                    }

                    //$28 -$2F -​O​O​O​N​N​N​N​     Chn0 - 7    KeyCode​  O = Octive, N = Note​
                    register = (byte)(0x28 + channel);
                    value = 0;
                    value += (byte)((cn.ym2151octave() & 0b00000111) << 4);
                    value += (byte)(cn.ym2151note() & 0b00001111);
                    addtobytes(bytes, register, value, conv.CYMS);

                    //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                    //Most minden operátor szóljon.
                    register = (byte)(0x08);
                    value = operatormask;
                    value += (byte)(channel & 0b00000111);
                    addtobytes(bytes, register, value, conv.CYMS);
                }
            }


        }

        private static double bpmtotickmillisec(Conversion conv)
        {
            int rowperminute = conv.CurrentBPM * conv.CurrentRowPerBeat;
            int tickperminute = rowperminute * conv.CurrentTickPerRow;
            double tickpersec = tickperminute / 60;
            double secpertick = 1 / tickpersec;
            double millisecpertick = secpertick * 1000;
            return millisecpertick;
        }

        public static int playertickpersec = 60;

        private static byte bpmtoplayertick(Conversion conv)
        {
            double desiredplayerticks = bpmtotickmillisec(conv) / ((double)1 / (double)playertickpersec * (double)1000);
            double result = Math.Max(1, desiredplayerticks);
            return (byte)result;
        }
        private static byte bpmtoplayertickrow(Conversion conv)
        {
            double desiredplayerticks = bpmtotickmillisec(conv) / ((double)1 / (double)playertickpersec * (double)1000) * (double)conv.CurrentTickPerRow;
            double result = Math.Max(1, desiredplayerticks);
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

        private static void addtobytes(List<byte> bytes, byte register, byte value, YM2151State cs)
        {
            if (register == 0)
            {
                cs.accumulatedtiming += value;
                if (cs.accumulatedtiming >= 255)
                {
                    bytes.Add(0); bytes.Add(255);
                    cs.accumulatedtiming -= 255;
                }
            }
            else
            {
                if (cs.accumulatedtiming != 0)
                {
                    bytes.Add(0); bytes.Add((byte)cs.accumulatedtiming);
                    cs.accumulatedtiming = 0;
                }
                bytes.Add(register); bytes.Add(value);
            }
        }

        public static List<byte> PatternToBytes(this ITFPattern itfpattern, Conversion conv, bool[] channelson = null, int? FromRow = null, int? ToRow = null)
        {

            int usedchannels = Math.Min(itfpattern.Rows.Max(x => x.Channels.Count), 8);

            if (channelson == null)
            {
                channelson = new bool[usedchannels];
                for (int i = 0; i < channelson.Length; i++)
                {
                    channelson[i] = true;
                }
            }

            List<byte> bytes = new List<byte>();
            byte register, value = 0;

            for (int rows = 0; rows < itfpattern.Rows.Count; rows++)
            {
                if (FromRow.HasValue && FromRow.Value > rows) continue;
                if (ToRow.HasValue && ToRow.Value < rows) continue;

                //Is there any effects needs ticking here?
                bool tickingneeded = false;
                for (int channels = 0; channels < itfpattern.Rows[rows].Channels.Count; channels++)
                {
                    ITFNote cn = itfpattern.Rows[rows].Channels[channels];
                    //Tempo determination. This can come from all available channels.
                    if (cn.Effect == 0xF)
                    {
                        if (cn.EffectParam < 32) conv.CurrentTickPerRow = cn.EffectParam.Value;
                        else conv.CurrentBPM = cn.EffectParam.Value;
                    }

                    //Ticking will apply only for the phisycally converted channels.
                    if (channels > usedchannels) continue;
                    int epu = ((byte)cn.EffectParam.Value >> 4) & 0xF;
                    int epd = (byte)cn.EffectParam.Value & 0xF;
                    tickingneeded =
                        tickingneeded ||
                        (cn.Effect == 0xE && epu == 0xD) ||
                        (cn.Effect == 0xE && epu == 0xC) ||
                        (cn.Effect == 0xA && cn.EffectParam != 0);
                }

                if (tickingneeded)
                {
                    ITFNote[,] tickarr = new ITFNote[conv.CurrentTickPerRow, usedchannels];

                    for (int channel = 0; channel < usedchannels; channel++)
                    {
                        if (!channelson[channel]) continue;

                        ITFNote cn = itfpattern.Rows[rows].Channels[channel];
                        int epu = ((byte)cn.EffectParam.Value >> 4) & 0xF;
                        int epd = (byte)cn.EffectParam.Value & 0xF;

                        if (cn.Effect == 0xA && cn.EffectParam != 0) //Volume slide
                        {
                            tickarr[0, channel] = cn;
                            int volume = cn.Volume.Value;
                            int diff = -epd;
                            if (epu != 0) diff = epu;

                            for (int i = 1; i < conv.CurrentTickPerRow; i++)
                            {
                                volume += diff;
                                if (volume < 0) volume = 0;
                                if (volume > 64) volume = 64;
                                tickarr[i, channel] = new ITFNote() { Volume = (byte)volume };
                            }
                        }
                        else if (cn.Effect == 0xE && epu == 0xD)
                        {
                            if (epd > 5) epd = 5;
                            tickarr[epd, channel] = cn;
                        }
                        else if (cn.Effect == 0xE && epu == 0xC) //Note cut
                        {
                            if (epd > 5) epd = 5;
                            tickarr[0, channel] = cn;
                            tickarr[epd, channel] = new ITFNote() { NoteOff = true };
                        }
                        else
                        {
                            tickarr[0, channel] = cn;
                        }
                    }

                    for (int ticks = 0; ticks < conv.CurrentTickPerRow; ticks++)
                    {
                        for (int channel = 0; channel < usedchannels; channel++)
                        {
                            if (!channelson[channel]) continue;
                            ITFNote cn = tickarr[ticks, channel];
                            if (cn != null) NoteIntoBytes(cn, bytes, channel, conv);
                        }
                        //Timing
                        register = 0;
                        value = (byte)bpmtoplayertick(conv);
                        addtobytes(bytes, register, value, conv.CYMS);
                    }
                }
                else
                {
                    for (int channel = 0; channel < usedchannels; channel++)
                    {
                        if (!channelson[channel]) continue;
                        ITFNote cn = itfpattern.Rows[rows].Channels[channel];
                        NoteIntoBytes(cn, bytes, channel, conv);
                    }
                    //Timing
                    register = 0;
                    value = (byte)bpmtoplayertickrow(conv);
                    addtobytes(bytes, register, value, conv.CYMS);
                }
            }
            return bytes;
        }
    }
}

