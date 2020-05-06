using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace VGMRead
{
    static class Statistics
    {
        public static void VGLCommandStatistics(VGMRead reader)
        {
            Console.WriteLine("VGL Command statistics");
            var commandstat = reader.VGMCommands.GroupBy(x => x.CommandByte).Select(group => new
            {
                Command = group.Key,
                Count = group.Count()
            }).OrderBy(x => x.Command).ToList();

            foreach (var item in commandstat)
            {
                Console.WriteLine(item.Command.ToString("X") + " " + item.Count);
            }
        }

        public static void YM3812registerUsageStatistics(VGMRead reader)
        {
            Console.WriteLine("YM3812 register usage statistics");
            var oplregwrites = reader.VGMCommands.Where(x => x is YM3812Command).Cast<YM3812Command>().ToList();
            var e = oplregwrites.GroupBy(x => x.Register).Select(group => new
            {
                Register = group.Key,
                Count = group.Count()
            }).OrderBy(x => x.Register).ToList();

            foreach (var item in e)
            {
                Console.WriteLine(item.Register.ToString("X") + " " + item.Count);
            }
        }

        public static void VGMWaitUsageStatistics(VGMRead reader)
        {
            Console.WriteLine("VGMWait usage statistics");
            var waits = reader.VGMCommands.Where(x => x is VGMwait).Cast<VGMwait>().ToList();
            var e2 = waits.GroupBy(x => x.waitsamples).Select(group => new
            {
                Waitsamples = group.Key,
                Count = group.Count()
            }).OrderBy(x => x.Waitsamples).ToList(); ;

            foreach (var item in e2)
            {
                Console.WriteLine(item.Waitsamples + " " + VGMWait2mSec(item.Waitsamples).ToString("N3") + " " + item.Count);
            }
        }

        public static void VGMWaitTotal(VGMRead reader)
        {
            Console.WriteLine("VGMWait total");
            var waits = reader.VGMCommands.Where(x => x is VGMwait).Cast<VGMwait>().ToList();
            var waittotal = waits.Sum(x => x.waitsamples);
            Console.WriteLine("Sum:" + waittotal);
            Console.WriteLine("Header:" + reader.Header.Totalsamples);
            Console.WriteLine("Sum in msec: " + VGMWait2mSec(waittotal).ToString("N3"));
        }

        public static double VGMWait2mSec(int waits)
        {
            return waits / 44.100;
        }
        public static void YM3812WaveformStatistics(VGMRead reader)
        {
            //E0-F5   Wave select
            Console.WriteLine("YM3812 Waveform statistics");
            var oplregwrites = reader.VGMCommands.Where(x => x is YM3812Command).Cast<YM3812Command>().ToList();
            oplregwrites = oplregwrites.Where(x => x.Register >= 0xE0 && x.Register <= 0xF5).ToList();
            var waves = oplregwrites.GroupBy(x => x.Value).Select(group => new
            {
                Wave = group.Key,
                Count = group.Count()
            }).OrderBy(x => x.Wave).ToList();
            foreach (var item in waves)
            {
                Console.WriteLine(item.Wave.ToString("X") + " " + item.Count);
            }
        }

        public static void YM3812Notes(VGMRead reader)
        {
            Console.WriteLine("YM3812 Notes");

            YM3812 chip = new YM3812();
            foreach (var command in reader.VGMCommands)
            {
                if (command is YM3812Command) chip.ConsumeCommand((YM3812Command)command);
                if (command is VGMwait || command is VGMendofsounddata)
                {
                    string line = "| ";
                    for (int i = 0; i < 8; i++)
                    {
                        line += (chip.KeyOn(i) ? "O" : " ") + " " + Tools.FrequencyToNote(chip.Freq(i)) + " " + ((int)Math.Round(chip.Freq(i))).ToString("D4") + " | ";
                    }
                    if (command is VGMwait) line += Statistics.VGMWait2mSec(((VGMwait)command).waitsamples).ToString("0000");

                    Console.WriteLine(line);
                }
            }
        }

    }
}
