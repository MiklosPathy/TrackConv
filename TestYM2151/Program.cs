using NAudio.Wave;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using YM2151ns;

namespace CallLibOpenMPT
{
    public class YMshell : WaveProvider16
    {
        private Thread playthread;
        private YM2151 chip;
        public YMshell()
        {
            SetWaveFormat(44100, 2);

            ym2161c.init_tables();
            chip = ym2161c.ym2151_init(1000000, 44100);
            ym2161c.init_chip_tables(chip);
            ym2161c.ym2151_reset_chip(chip);
            ym2161c.ym2151_set_mask(chip, 0);


            playthread = new Thread(new ThreadStart(SynthThread));
            playthread.IsBackground = true;
            playthread.Start();
        }

        public override int Read(short[] buffer, int offset, int sampleCount)
        {
            ym2161c.ym2151_update_one(chip, buffer, sampleCount);
            return sampleCount;
        }

        public void setregister(byte r, byte v)
        {
            ym2161c.ym2151_write_reg(chip, r, v);
        }

        private int DesiredLatency = 50;

        private void SynthThread()
        {
            WaveOutEvent _waveOutEvent = new WaveOutEvent();
            _waveOutEvent.DeviceNumber = -1;
            _waveOutEvent.DesiredLatency = DesiredLatency;
            _waveOutEvent.NumberOfBuffers = 2;
            _waveOutEvent.Init(this);
            _waveOutEvent.Play();

            while (true)
            {
                if (_waveOutEvent.DesiredLatency != DesiredLatency)
                {
                    _waveOutEvent.Stop();
                    while (_waveOutEvent.PlaybackState != PlaybackState.Stopped) Thread.Sleep(10);
                    _waveOutEvent.DesiredLatency = DesiredLatency;
                    _waveOutEvent.Init(this);
                    _waveOutEvent.Play();
                }
                Thread.Sleep(1);
            }
        }

        public void RESET_SOUND_CHIP()
        {
            for (int i = 0; i < 256; i++)
            {
                ym2161c.ym2151_write_reg(chip, (byte)i, 0);
            }
            for (int i = 0x60; i < 0x80; i++)
            {
                ym2161c.ym2151_write_reg(chip, (byte)i, 127);
            }
        }

        public void NOTE_ON_FOR_CHANNEL(int CH)
        {
            ym2161c.ym2151_write_reg(chip, 0x08, (byte)(0x78 + CH));
        }

        public void NOTE_OFF_FOR_CHANNEL(int CH)
        {
            ym2161c.ym2151_write_reg(chip, 0x08, (byte)(CH));
        }
        public void NOTE_OFF_FOR_ALL_CHANNELS()
        {
            for (int i = 0; i <= 7; i++)
            {
                NOTE_OFF_FOR_CHANNEL(i);
            }
        }
        public void SETUP_TIMBRE_FOR_CHANNEL(int CH)
        {
            //ENABLE L / R, SET CONNECTION 7, FEEDBACK 2
            ym2161c.ym2151_write_reg(chip, (byte)(0x20 + CH), (byte)(0xE0 + 7));

            //SOME DETUNE FOR EACH OPERATOR
            ym2161c.ym2151_write_reg(chip, (byte)(0x40 + CH), 0x00);
            ym2161c.ym2151_write_reg(chip, (byte)(0x48 + CH), 0x20);
            ym2161c.ym2151_write_reg(chip, (byte)(0x50 + CH), 0x40);
            ym2161c.ym2151_write_reg(chip, (byte)(0x58 + CH), 0x60);
            //VOLUME
            ym2161c.ym2151_write_reg(chip, (byte)(0x60 + CH), 0x00);
            ym2161c.ym2151_write_reg(chip, (byte)(0x68 + CH), 0x00);
            ym2161c.ym2151_write_reg(chip, (byte)(0x70 + CH), 0x00);
            ym2161c.ym2151_write_reg(chip, (byte)(0x78 + CH), 0x00);
            //ATTACK
            ym2161c.ym2151_write_reg(chip, (byte)(0x80 + CH), 0x18);
            ym2161c.ym2151_write_reg(chip, (byte)(0x88 + CH), 0x18);
            ym2161c.ym2151_write_reg(chip, (byte)(0x90 + CH), 0x18);
            ym2161c.ym2151_write_reg(chip, (byte)(0x98 + CH), 0x18);
            //RELEASE
            ym2161c.ym2151_write_reg(chip, (byte)(0xE0 + CH), 0x05);
            ym2161c.ym2151_write_reg(chip, (byte)(0xE8 + CH), 0x05);
            ym2161c.ym2151_write_reg(chip, (byte)(0xF0 + CH), 0x05);
            ym2161c.ym2151_write_reg(chip, (byte)(0xF8 + CH), 0x05);
        }
        public void SETUP_NOTE_FREQUENCY_FOR_CHANNEL(int NO, int OC, int CH)
        {
            ym2161c.ym2151_write_reg(chip, (byte)(0x28 + CH), (byte)(OC * 16 + NO));
        }

    }



    class Program
    {
        public class Rec
        {
            public Rec(int ch, int oc, int no, int ko, int wa)
            {
                CH = ch; OC = oc; NO = no; KO = ko; WA = wa;
            }
            public int CH;
            public int OC;
            public int NO;
            public int KO;
            public int WA;
            public override string ToString()
            {
                return CH + " " + OC + " " + NO + " " + KO + " " + WA;
            }
        }

        static public readonly Rec[] data = new Rec[]
            {
new Rec(0,5,0,1,1000),
new Rec(0,5,1,2,1000),
new Rec(0,5,2,2,1000),
new Rec(0,5,3,2,1000),
new Rec(0,5,4,2,1000),
new Rec(0,5,5,0,5000),
new Rec(1,5,9,1,1000),
new Rec(0,5,0,0,1000),
new Rec(0,5,9,0,3000),
new Rec(2,6,0,1,1000),
new Rec(3,6,9,1,1000),
new Rec(2,6,0,0,1000),
new Rec(3,6,9,0,3000),
new Rec(8,0,0,0,0),
            };



        static void Main(string[] args)
        {
            YMshell sh = new YMshell();
            sh.RESET_SOUND_CHIP();

            var bytes = File.ReadAllBytes(args[0]);

            string output = "";
            for (int i = 0; i < bytes.Count(); i += 2)
            {
                byte r = bytes[i];
                byte v = bytes[i + 1];
                sh.setregister(r, v);
                output += r.ToString("X2") + " " + v.ToString("X2") + " ";
                if (r == 0)
                {
                    Console.WriteLine(output);
                    output = "";
                    Thread.Sleep((int)(v * 16.6666));
                }
            }


            //for (int i = 0; i <= 7; i++)
            //{
            //    sh.SETUP_TIMBRE_FOR_CHANNEL(i);
            //}

            //foreach (Rec rec in data)
            //{
            //    Console.WriteLine(rec);
            //    if (rec.CH != 8)
            //    {
            //        sh.SETUP_NOTE_FREQUENCY_FOR_CHANNEL(rec.NO, rec.OC, rec.CH);
            //        if (rec.KO == 1) sh.NOTE_ON_FOR_CHANNEL(rec.CH);
            //        if (rec.KO == 0) sh.NOTE_OFF_FOR_CHANNEL(rec.CH);
            //        Thread.Sleep(rec.WA);
            //    }
            //}

            //Console.In.Read();
        }
    }
}
