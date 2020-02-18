using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class XMNote
    {
        public byte Note = 0;
        public byte Instrument = 0;
        public byte Volume = 0;
        public byte Effect = 0;
        public byte EffectParam = 0;

        public void Reset()
        {
            Note = 0;
            Instrument = 0;
            Volume = 0;
            Effect = 0;
            EffectParam = 0;
        }

        private string FormatByte(byte b, string format)
        {
            if (b == 0) return "--";
            return b.ToString(format);
        }

        public new string ToString()
        {
            return ToNote() + " " + FormatByte(Instrument, "D2") + " " + FormatByte(Volume, "X2") + " " + FormatByte(Effect, "X2") + FormatByte(EffectParam, "X2") + "|";
        }

        public void ToConsole()
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.Write(ToNote() + " ");
            Console.ForegroundColor = ConsoleColor.White;
            Console.Write(FormatByte(Instrument, "D2") + " ");
            Console.ForegroundColor = ConsoleColor.DarkBlue;
            Console.Write(FormatByte(Volume, "X2") + " ");
            Console.ForegroundColor = ConsoleColor.DarkRed;
            Console.Write(FormatByte(Effect, "X2"));
            Console.ForegroundColor = ConsoleColor.DarkGreen;
            Console.Write(FormatByte(EffectParam, "X2"));
            Console.ResetColor();
            Console.Write("|");
        }

        private static readonly string[] notes = { "C-", "C#", "D-", "D#", "E-", "F-", "F#", "G-", "G#", "A-", "A#", "B-" };

        private string ToNote()
        {
            if (Note == 0) return "---";
            int octave = (Note - 1) / 12;
            int note = (Note - 1) % 12;
            return notes[note] + octave;
        }

        public void TryParseNextNoteFrom(ref int offset, byte[] data)
        {
            bool IsBitSet(byte b, int pos)
            {
                return (b & (1 << pos)) != 0;
            }

            byte GetByte(ref int offset)
            {
                if (offset == data.Length) return 0;
                byte result = data[offset];
                if (offset < data.Length) offset++;
                return result;
            }

            Reset();
            byte b = GetByte(ref offset);
            if (IsBitSet(b, 7))
            {
                if (IsBitSet(b, 0)) Note = GetByte(ref offset);
                if (IsBitSet(b, 1)) Instrument = GetByte(ref offset);
                if (IsBitSet(b, 2)) Volume = GetByte(ref offset);
                if (IsBitSet(b, 3)) Effect = GetByte(ref offset);
                if (IsBitSet(b, 4)) EffectParam = GetByte(ref offset);
            }
            else
            {
                Note = b;
                Instrument = GetByte(ref offset);
                Volume = GetByte(ref offset);
                Effect = GetByte(ref offset);
                EffectParam = GetByte(ref offset);
            }
        }
    }

}
