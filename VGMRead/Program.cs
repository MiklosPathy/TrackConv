using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using TrackConv.Writer;

namespace VGMRead
{
    class Program
    {
        static void Main(string[] args)
        {
            VGMRead reader = new VGMRead(@"C:\Users\mpathy\Desktop\TrackerMuzax\vgzs\06 Chani's Eyes.vgm");
            reader.Open();

            //Statistics.VGMWaitTotal(reader);
            //Statistics.YM3812WaveformStatistics(reader);
            //Statistics.YM3812Notes(reader);
            //Visulaize.ChannelStats(reader);

            //Convert.
            double waittickcorrection = 0;
            double x16tickinmillisec = 1000 / 60;

            YM3812 ym3812 = new YM3812();
            YM2151 ym2151 = new YM2151();

            List<byte> outbytes = new List<byte>();
            //Start pause.
            outbytes.AddRange(new byte[] { 0, 60 });

            ym2151.Reset();
            ym2151.NextTick();
            ym3812.NextTick();
            foreach (var command in reader.VGMCommands)
            {
                if (command is YM3812Command) ym3812.ConsumeCommand((YM3812Command)command);
                if (command is VGMwait || command is VGMendofsounddata)
                {
                    ConvertYM3812stateToYM2151state(ym3812, ym2151);

                    outbytes.AddRange(ym2151.GetChangedRegisters());
                    outbytes.AddRange(ConvertYM3812KeyOnStateToYM2151KeyOnCommands(ym3812));


                    if (command is VGMwait)
                    {
                        var waitmillisecs = ((VGMwait)command).waitsamples / 44.100;
                        var unroundedwaitticks = waitmillisecs / x16tickinmillisec;
                        unroundedwaitticks += waittickcorrection;
                        var waitticks = Math.Round(unroundedwaitticks);
                        waittickcorrection = unroundedwaitticks - waitticks;

                        if (waitticks != 0)
                        {
                            while (waitticks > 0)
                            {
                                outbytes.Add(0);
                                if (waitticks > 255)
                                    outbytes.Add(255);
                                else
                                    outbytes.Add((byte)waitticks);
                                waitticks -= 255;
                            }
                        }
                    }

                    ym2151.NextTick();
                    ym3812.NextTick();
                }
            }

            //Trailing pause
            outbytes.AddRange(new byte[] { 0, 60 });

            Directory.SetCurrentDirectory(@"C:\Users\mpathy\Source\Repos\TrackConv\Player");
            CX16BasicWriter.ToFile(outbytes);
            DumbBinWriter.ToFile(outbytes);
        }

        public static void ConvertYM3812stateToYM2151state(YM3812 ym3812, YM2151 ym2151)
        {
            for (int channel = 0; channel < 9; channel++)
            {
                var chs = ym3812.GetChannelStats(channel);

                if (channel <= 7)
                {
                    //Operator settings
                    {
                        int opnum = 0;
                        TrackConv.YM2151operator op0 = new TrackConv.YM2151operator();
                        LoadFromYM3812Operator(op0, chs.OPR1);
                        int slot = opnum * 8 + channel;
                        SetYM2151Operator(ym2151, slot, op0);
                        opnum = 2;
                        TrackConv.YM2151operator op2 = new TrackConv.YM2151operator();
                        LoadFromYM3812Operator(op2, chs.OPR2);
                        slot = opnum * 8 + channel;
                        SetYM2151Operator(ym2151, slot, op2);
                    }

                    //PMS and AMS
                    {
                        byte PMS = chs.OPR2.Vibrato ? (byte)0x04 : (byte)0x00;
                        byte AMS = chs.OPR2.AmpMod ? (byte)0x02 : (byte)0x00;

                        //$38-$3F	-P​P​P​--​A​A​    Channel 0-7     PMS / AMS​  P = PMS , A = AMS​
                        byte register = (byte)(0x38 + channel);
                        byte value = 0;
                        value += (byte)(PMS << 4);
                        value += AMS;
                        ym2151.registers[register] = value;
                    }
                    //Connection and feedback
                    {
                        byte CON = 7;
                        if (chs.Connection == 0) CON = 6;
                        byte FB = (byte)chs.Feedback;

                        //$20-$27   L​R​F​F​F​C​C​C​    Channel 0-7     L = Left, R = Right, F = Feedback, C = Connection​
                        byte register = (byte)(0x20 + channel);
                        byte value = 0b11000000;
                        value += (byte)(FB << 3);
                        value += CON;
                        ym2151.registers[register] = value;
                    }
                    //Note (note octave cent)
                    {
                        var note = Tools.FrequencyToNote(chs.Freq);


                        if (!note.OutOfRange)
                        {
                            int note_ = note.note;
                            int octave_ = note.octave;
                            int cent_ = note.cent;
                            if (note.cent_sign < 0)
                            {
                                note_ -= 1;
                                if (note_ < 0)
                                {
                                    note_ = 11;
                                    octave_ -= 1;
                                    if (octave_ < 0)
                                    {
                                        note_ = 0;
                                        octave_ = 0;
                                        cent_ = -100;
                                    }
                                }
                                cent_ = 100 + cent_;
                            }
                            cent_ = cent_ * 64 / 100;

                            //$28 -$2F -​O​O​O​N​N​N​N​     Chn0 - 7    KeyCode​  O = Octive, N = Note​
                            byte register = (byte)(0x28 + channel);
                            byte value = 0;
                            value += (byte)((note_ & 0b00000111) << 4);
                            value += (byte)(octave_ & 0b00001111);
                            ym2151.registers[register] = value;

                            //$30 -$38 FFFFFF--     Chn0 - 7    F = keyFraction
                            register = (byte)(0x30 + channel);
                            value = 0;
                            value += (byte)((cent_ & 0b00111111) << 2);
                            ym2151.registers[register] = value;
                        }
                    }
                }
            }
        }
        private static List<byte> ConvertYM3812KeyOnStateToYM2151KeyOnCommands(YM3812 ym3812)
        {
            List<byte> result = new List<byte>();
            for (int channel = 0; channel < 9; channel++)
            {
                if (channel <= 7)
                {
                    if (ym3812.KeyOffHappened(channel))
                    {
                        //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                        //Minden operátor kuss.
                        byte register = (byte)(0x08);
                        byte value = 0b00000000;
                        value += (byte)(channel & 0b00000111);
                        result.Add(register);
                        result.Add(value);
                    }
                    if (ym3812.KeyOnHappened(channel))
                    {
                        //$08       -​S​S​S​S​C​C​C​    Key On(Play Sound)​ C = Channel S = Slot(C2 M2 C1 M1)​
                        //Most minden operátor szóljon.
                        byte operatormask = 0b01111000;
                        byte register = (byte)(0x08);
                        byte value = operatormask;
                        value += (byte)(channel & 0b00000111);
                        result.Add(register);
                        result.Add(value);
                    }
                }
            }
            return result;
        }

        public static void SetYM2151Operator(YM2151 ym2151, int slot, TrackConv.YM2151operator op)
        {
            byte register = 0;
            byte value = 0;

            //$40-$5F	-​D​D​D​M​M​M​M​    Slot1 - 32.     Detune / Mult​  D = Detune D1T, M = Mult​
            register = (byte)(0x40 + slot);
            value = 0;
            value += (byte)(op.DT << 4);
            value += op.MULT;
            ym2151.registers[register] = value;

            //$80-$9F  K​K​-​A​AA​A​A​     Slot1 - 32.     Keyscale / Attack​  K = Keycale, A = attack​
            register = (byte)(0x80 + slot);
            value = 0;
            value += (byte)(op.KS << 6);
            value += op.AR;
            ym2151.registers[register] = value;

            //$A0-$BF	A​-​-​D​D​D​D​D​    Slot1 - 32.      AMS Enable / Decay​   A = AMS - EN, D = Decay D1R​
            register = (byte)(0xA0 + slot);
            value = 0;
            value += (byte)(op.AM << 7);
            value += op.D1R;
            ym2151.registers[register] = value;

            //$C0-$DF	T​T​-​D​D​D​D​D​    Slot1 - 32.     DeTune2 / Decay​2         T = Detune DT2, D = Decay D2R​
            register = (byte)(0xC0 + slot);
            value = 0;
            value += (byte)(op.DT2 << 6);
            value += op.D2R;
            ym2151.registers[register] = value;

            //$E0-$FF  D​D​D​D​R​R​R​R​    Slot1 - 32.     Decay Level/ Release​        D = Decay D1L, R = Release Rate​
            register = (byte)(0xE0 + slot);
            value = 0;
            value += (byte)(op.D1L << 4);
            value += op.RR;
            ym2151.registers[register] = value;
        }

        public static void LoadFromYM3812Operator(TrackConv.YM2151operator ym2151op, YM3812OperatorStats ym3812op)
        {
            ym2151op.AM = ym3812op.AmpMod ? (byte)1 : (byte)0;
            ym2151op.AR = (byte)(ym3812op.Attack << 1);
            ym2151op.D1L = (byte)ym3812op.Sustain;
            ym2151op.D1R = (byte)(ym3812op.Decay << 1);
            ym2151op.D2R = (byte)(ym3812op.Release << 1);
            ym2151op.DT = 0;
            ym2151op.DT2 = 0;
            ym2151op.KS = (byte)ym3812op.KeyScaling;
            ym2151op.MULT = (byte)ym3812op.Mult;
            ym2151op.RR = (byte)(ym3812op.Release << 1);
            ym2151op.TL = (byte)(ym3812op.TotalLevel << 1);
        }
    }
}
