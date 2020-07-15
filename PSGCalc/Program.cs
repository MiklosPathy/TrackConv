using System;

namespace PSGCalc
{
    class Program
    {
        const double sample_rate = 25000000 / 512;
        const double halfnotedivider = 16;

        static void Main(string[] args)
        {

            double notemultiplier = Math.Pow(2, ((double)1 / (double)12 / halfnotedivider));

            double output_frequency = 13.75;
            //calc C-0;
            output_frequency = output_frequency * notemultiplier;
            output_frequency = output_frequency * notemultiplier;


            int count = 1;

            for (int octave = 0; octave < 11; octave++)
            {
                for (int note = 0; note < 12; note++)
                {
                    for (int subnote = 0; subnote < halfnotedivider; subnote++)
                    {
                        int frequency_word = (int)Math.Round(output_frequency / sample_rate * Math.Pow(2, 17));
                        if (frequency_word > UInt16.MaxValue) break;
                        //Console.WriteLine(count + "\t" + octave + "\t" + note + "\t" + subnote + "\t" + output_frequency.ToString("F2") + "\t" + frequency_word);
                        Console.Write(frequency_word + ",");
                        output_frequency = output_frequency * notemultiplier;
                        count++;
                    }

                }
            }
        }
    }
}
