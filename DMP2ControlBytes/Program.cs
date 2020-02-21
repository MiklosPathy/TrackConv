using System;
using System.Collections.Generic;
using System.IO;

namespace DMP2ControlBytes
{
    class Program
    {
        static void Main(string[] args)
        {
            byte[] filedata;
            filedata = File.ReadAllBytes("Organ_Additive.dmp");
            //Console.WriteLine(filedata.Length);
            YM215Instrument instr = new YM215Instrument();
            instr.ReadFromDMP(filedata);

            instr.ToConsole();

            List<byte> bytes = new List<byte>();

            for (int i = 0; i < 8; i++)
            //int i = 0;
            {
                var e = instr.ToControlBytes(i);
                foreach (var item in e)
                {
                    bytes.Add(item.Key);
                    bytes.Add(item.Value);
                }
            }


            int linenumber = 1000;
            const int maxiteminline = 16;
            List<string> lines = new List<string>();

            string currentline = "";
            int curritem = 1;

            int remainingitems = bytes.Count;

            foreach (var item in bytes)
            {
                if (curritem == 1)
                    currentline = linenumber + " DATA ";
                if (curritem <= maxiteminline)
                    currentline += "$" + item.ToString("X2");
                if (curritem < maxiteminline && remainingitems != 1) currentline += ",";
                if (curritem == maxiteminline || remainingitems == 1)
                {
                    curritem = 1;
                    lines.Add(currentline);
                    linenumber += 10;
                }
                else curritem++;
                remainingitems--;
            }
            //lines.Add(linenumber + " DATA 0,0");

            File.WriteAllLines(@"instruments.txt", lines.ToArray());



        }
    }
}
