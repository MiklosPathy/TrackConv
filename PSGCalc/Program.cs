using System;
using System.IO;

namespace PSGCalc
{
    class Program
    {
        const double sample_rate = 25000000 / 512;
        const int halfnotedivider = 32; //Detune cents per halfnote
        static int[,] output = new int[128, halfnotedivider];

        static void Main(string[] args)
        {

            double notemultiplier = Math.Pow(2, ((double)1 / (double)12 / halfnotedivider));

            double output_frequency = 13.75;
            //calc C-0; centered at halfnotedivider/2 (detune cents) 
            for (int i = 0; i < halfnotedivider * 2.5; i++)
            {
                output_frequency = output_frequency * notemultiplier;
            }
            //for (int i = 0; i < (halfnotedivider) / 2; i++)
            //{
            //    output_frequency = output_frequency * notemultiplier;
            //}


            int count = 1;

            for (int octave = 0; octave < 11; octave++)
            {
                for (int note = 0; note < 12; note++)
                {
                    for (int subnote = 0; subnote < halfnotedivider; subnote++)
                    {
                        int frequency_word = (int)Math.Round(output_frequency / sample_rate * Math.Pow(2, 17));
                        if (frequency_word > UInt16.MaxValue) break;
                        //if (subnote == (halfnotedivider) / 2) Console.ForegroundColor = ConsoleColor.Red;
                        //else Console.ForegroundColor = ConsoleColor.White;
                        //Console.WriteLine(count + "\t" + octave + "\t" + note + "\t" + subnote + "\t" + output_frequency.ToString("F2") + "\t" + frequency_word);
                        output[octave * 12 + note, subnote] = frequency_word;
                        //Console.Write("$" + frequency_word.ToString("X4") + ",");
                        //Console.Write(frequency_word.ToString() + ",");
                        output_frequency = output_frequency * notemultiplier;
                        count++;
                    }
                    //Console.WriteLine();
                }
            }
            //Console.WriteLine();
            //Console.WriteLine(count);

            StreamWriter sw = new StreamWriter("out.txt");

            for (int i = 0; i < halfnotedivider; i++)
            {
                for (int j = 0; j < 128; j++)
                {
                    string op = "$" + output[j, i].ToString("X4") + ",";
                    Console.Write(op);
                    sw.Write(op);
                }
                Console.WriteLine();
                sw.WriteLine();
            }
            sw.Close();
        }
    }
}
