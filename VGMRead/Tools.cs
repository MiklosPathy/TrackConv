﻿using System;
using System.Collections.Generic;
using System.Text;

namespace VGMRead
{

    public class MusicalNote
    {
        private static readonly string[] notes = { "C-", "C#", "D-", "D#", "E-", "F-", "F#", "G-", "G#", "A-", "A#", "B-" };

        public double Freq;
        public bool OutOfRange;
        public int cent_index;
        public int cent_sign;
        public int cent;
        public int octave;
        public int note;
        public string GSnote;
        public override string ToString()
        {
            if (OutOfRange) return " -OOR- ";
            return notes[note] + octave + (cent_sign == 1 ? "+" : "-") + cent_index.ToString("D2") + "C";
        }

    }
    public static class Tools
    {
        private static readonly string[] notes =  {
            "C-0", "C#0", "D-0", "D#0", "E-0", "F-0", "F#0", "G-0", "G#0", "A-0", "A#0", "B-0",
            "C-1", "C#1", "D-1", "D#1", "E-1", "F-1", "F#1", "G-1", "G#1", "A-1", "A#1", "B-1",
            "C-2", "C#2", "D-2", "D#2", "E-2", "F-2", "F#2", "G-2", "G#2", "A-2", "A#2", "B-2",
            "C-3", "C#3", "D-3", "D#3", "E-3", "F-3", "F#3", "G-3", "G#3", "A-3", "A#3", "B-3",
            "C-4", "C#4", "D-4", "D#4", "E-4", "F-4", "F#4", "G-4", "G#4", "A-4", "A#4", "B-4",
            "C-5", "C#5", "D-5", "D#5", "E-5", "F-5", "F#5", "G-5", "G#5", "A-5", "A#5", "B-5",
            "C-6", "C#6", "D-6", "D#6", "E-6", "F-6", "F#6", "G-6", "G#6", "A-6", "A#6", "B-6",
            "C-7", "C#7", "D-7", "D#7", "E-7", "F-7", "F#7", "G-7", "G#7", "A-7", "A#7", "B-7",
            "C-8", "C#8", "D-8", "D#8", "E-8", "F-8", "F#8", "G-8", "G#8", "A-8", "A#8", "B-8",
            "C-9", "C#9", "D-9", "D#9", "E-9", "F-9", "F#9", "G-9", "G#9", "A-9", "A#9", "B-9"};

        private const double A4 = 440.0;
        private const int A4_INDEX = 57;
        private const int MINUS = 0;
        private const int PLUS = 1;

        public static MusicalNote FrequencyToNote(double input)
        {
            MusicalNote result = new MusicalNote();
            result.Freq = input;

            if ((input < 16) || (input > 14080))
            {
                result.OutOfRange = true;
                return result;
            }

            double frequency;
            var r = Math.Pow(2.0, 1.0 / 12.0);
            var cent = Math.Pow(2.0, 1.0 / 1200.0);
            var r_index = 0;
            var cent_index = 0;
            double side;

            frequency = A4;

            if (input >= frequency)
            {
                while (input >= r * frequency)
                {
                    frequency = r * frequency;
                    r_index++;
                }
                while (input > cent * frequency)
                {
                    frequency = cent * frequency;
                    cent_index++;
                }
                if ((cent * frequency - input) < (input - frequency))
                    cent_index++;
                if (cent_index > 50)
                {
                    r_index++;
                    cent_index = 100 - cent_index;
                    if (cent_index != 0)
                        side = MINUS;
                    else
                        side = PLUS;
                }
                else
                    side = PLUS;
            }

            else
            {
                while (input <= frequency / r)
                {
                    frequency = frequency / r;
                    r_index--;
                }
                while (input < frequency / cent)
                {
                    frequency = frequency / cent;
                    cent_index++;
                }
                if ((input - frequency / cent) < (frequency - input))
                    cent_index++;
                if (cent_index >= 50)
                {
                    r_index--;
                    cent_index = 100 - cent_index;
                    side = PLUS;
                }
                else
                {
                    if (cent_index != 0)
                        side = MINUS;
                    else
                        side = PLUS;
                }
            }

            result.octave = (A4_INDEX + r_index) / 12;
            result.note = (A4_INDEX + r_index) % 12;
            result.cent_index = cent_index;
            result.cent_sign = side == PLUS ? 1 : -1;
            result.cent = result.cent_index * result.cent_sign;



            result.GSnote = notes[A4_INDEX + r_index];
            if (side == PLUS)
                result.GSnote += "+";
            else
                result.GSnote += "-";
            result.GSnote += cent_index.ToString("D2") + "C";
            return result;

        }
    }
}
