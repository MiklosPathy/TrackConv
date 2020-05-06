using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VGMRead
{
    class Program
    {
        static void Main(string[] args)
        {
            VGMRead reader = new VGMRead(@"C:\Users\mpathy\Desktop\TrackerMuzax\vgzs\06 Chani's Eyes.vgm");
            reader.Open();




            #region VGL Command statistics
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
            #endregion

            #region OPL2 register usage statistics
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
            #endregion

            #region VGMWait usage statistics
            Console.WriteLine("VGMWait usage statistics");
            var waits = reader.VGMCommands.Where(x => x is VGMwait).Cast<VGMwait>().ToList();
            var e2 = waits.GroupBy(x => x.waitsamples).Select(group => new
            {
                Waitsamples = group.Key,
                Count = group.Count()
            }).OrderBy(x => x.Waitsamples).ToList(); ;

            foreach (var item in e2)
            {
                Console.WriteLine(item.Waitsamples + " " + item.Count);
            }
            #endregion
        }
    }
}
