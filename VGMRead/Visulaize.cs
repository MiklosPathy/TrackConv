using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;

namespace VGMRead
{
    public class Visulaize
    {
        public static void ChannelStats(VGMRead reader)
        {
            Console.CursorVisible = false;
            Console.SetWindowSize(200, 50);
            //Console.SetWindowSize(20, 20);
            //Console.SetWindowPosition(100, 20);
            Console.SetCursorPosition(0, 0);
            Console.WriteLine("ChannelStats");

            DrawStatic();
            YM3812 chip = new YM3812();

            int position = 0;

            foreach (var command in reader.VGMCommands)
            {
                if (command is YM3812Command) chip.ConsumeCommand((YM3812Command)command);
                if (command is VGMwait || command is VGMendofsounddata)
                {
                    for (int i = 0; i < 9; i++)
                    {
                        var channelstat = chip.GetChannelStats(i);
                        DrawChannelStat(channelstat);
                    }
                    Console.SetCursorPosition(20, 0);
                    Console.WriteLine(position);
                    Console.SetCursorPosition(0, 25);
                    if (command is VGMwait)
                    {
                        int w = (int)(((VGMwait)command).waitsamples / 44.100);
                        position += w;
                        Thread.Sleep(w);
                    }
                }
            }
            Console.CursorVisible = true;
        }

        static void DrawStatic()
        {
            Console.SetCursorPosition(0, 1);
            Console.Write("ChannelID");
            Console.SetCursorPosition(0, 2);
            Console.Write("Freq");
            Console.SetCursorPosition(0, 3);
            Console.Write("Note");
            Console.SetCursorPosition(0, 4);
            Console.Write("KeyOn");

            Console.SetCursorPosition(0, 6);
            Console.Write("Connection");
            Console.SetCursorPosition(0, 7);
            Console.Write("Feedback");

            Console.SetCursorPosition(0, 10);
            Console.Write("OperatorID");
            Console.SetCursorPosition(0, 11);
            Console.Write("Attack");
            Console.SetCursorPosition(0, 12);
            Console.Write("Decay");
            Console.SetCursorPosition(0, 13);
            Console.Write("Sustain");
            Console.SetCursorPosition(0, 14);
            Console.Write("Release");

            Console.SetCursorPosition(0, 15);
            Console.Write("TotalLevel");
            Console.SetCursorPosition(0, 16);
            Console.Write("Mult");

            Console.SetCursorPosition(0, 17);
            Console.Write("EG");
            Console.SetCursorPosition(0, 18);
            Console.Write("VIB");
            Console.SetCursorPosition(0, 19);
            Console.Write("AMP");
            Console.SetCursorPosition(0, 20);
            Console.Write("KS");
            Console.SetCursorPosition(0, 21);
            Console.Write("KeyScaling");
            Console.SetCursorPosition(0, 22);
            Console.Write("Waveform");

        }

        static void DrawChannelStat(YM3812ChannelStats cs)
        {
            int hp = 20 * cs.ChannelID + 15;

            Console.SetCursorPosition(hp, 1);
            Console.Write(cs.ChannelID);
            Console.SetCursorPosition(hp, 2);
            Console.Write(cs.Freq.ToString("0000.00"));
            Console.SetCursorPosition(hp, 3);
            Console.Write(Tools.FrequencyToNote(cs.Freq));
            Console.SetCursorPosition(hp, 4);
            Console.Write(cs.KeyOn ? "On" : "  ");

            Console.SetCursorPosition(hp, 6);
            Console.Write(cs.Connection == 0 ? "FM" : "  ");
            Console.SetCursorPosition(hp, 7);
            Console.Write(cs.Feedback);

            DrawOPStat(cs.OPR1, hp, 9);
            DrawOPStat(cs.OPR2, hp + 10, 9);
        }

        static void DrawOPStat(YM3812OperatorStats os, int hp, int vp)
        {
            Console.SetCursorPosition(hp, vp + 1);
            Console.Write(os.OperatorID.ToString("00"));
            Console.SetCursorPosition(hp, vp + 2);
            Console.Write(os.Attack.ToString("00"));
            Console.SetCursorPosition(hp, vp + 3);
            Console.Write(os.Decay.ToString("00"));
            Console.SetCursorPosition(hp, vp + 4);
            Console.Write(os.Sustain.ToString("00"));
            Console.SetCursorPosition(hp, vp + 5);
            Console.Write(os.Release.ToString("00"));

            Console.SetCursorPosition(hp, vp + 6);
            Console.Write(os.TotalLevel.ToString("00"));
            Console.SetCursorPosition(hp, vp + 7);
            Console.Write(os.Mult.ToString("00"));

            Console.SetCursorPosition(hp, vp + 8);
            Console.Write(os.EGType ? "EG" : "  ");
            Console.SetCursorPosition(hp, vp + 9);
            Console.Write(os.Vibrato ? "VIB" : "   ");
            Console.SetCursorPosition(hp, vp + 10);
            Console.Write(os.AmpMod ? "AMP" : "   ");
            Console.SetCursorPosition(hp, vp + 11);
            Console.Write(os.KeyScale ? "KS" : "  ");
            Console.SetCursorPosition(hp, vp + 12);
            Console.Write(os.KeyScaling);
            Console.SetCursorPosition(hp, vp + 13);
            Console.Write(os.Waveform);

        }
    }
}
