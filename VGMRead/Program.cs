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

            Statistics.VGMWaitTotal(reader);
            Statistics.YM3812WaveformStatistics(reader);
            Statistics.YM3812Notes(reader);

        }

    }
}
