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

        public static void OPL2registerUsageStatistics(VGMRead reader)
        {
            Console.WriteLine("OPL2 register usage statistics");
            var oplregwrites = reader.VGMCommands.Where(x => x is OPL2Command).Cast<OPL2Command>().ToList();
            var e = oplregwrites.GroupBy(x => x.Register).Select(group => new
            {
                Register = group.Key,
                Count = group.Count()
            }).OrderBy(x => x.Register).ToList(); ;

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
    }
}
