using System;
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

            Console.WriteLine("File version (11):" + instr.FILE_VERSION + "\t System (8):" + instr.SYSTEM_YM2151 + "\t Instrument Mode (1):" + instr.INSTRUMENT_MODE);
            Console.WriteLine("PMS:" + instr.PMS + "\t FB:" + instr.FB + "\t CON:" + instr.CON + "\t AMS:" + instr.AMS);
            Console.WriteLine("--------------------------------------------");
            Console.Write("OPS:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + i); }; Console.WriteLine();
            Console.WriteLine("--------------------------------------------");
            Console.Write("MULT:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].MULT); }; Console.WriteLine();
            Console.Write("TL:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].TL); }; Console.WriteLine();
            Console.Write("AR:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].AR); }; Console.WriteLine();
            Console.Write("D1R:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].D1R); }; Console.WriteLine();
            Console.Write("D2R:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].D2R); }; Console.WriteLine();
            Console.Write("RR:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].RR); }; Console.WriteLine();
            Console.Write("D1L:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].D1L); }; Console.WriteLine();
            Console.Write("AM:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].AM); }; Console.WriteLine();
            Console.Write("RS:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].RS); }; Console.WriteLine();
            Console.Write("DT:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].DT); }; Console.WriteLine();
            Console.Write("SS:"); for (int i = 0; i < 4; i++) { Console.Write("\t" + instr.OPS[i].SSGEG_Enabled); }; Console.WriteLine();
        }
    }
}
