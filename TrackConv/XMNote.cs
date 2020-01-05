using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public static class XMNote
    {
        public static byte Note;
        public static byte Instrument;
        public static byte Volume;
        public static byte Effect;
        public static byte EffectParam;

        public static void Reset()
        {
            Note = 0;
            Instrument = 0;
            Volume = 0;
            Effect = 0;
            EffectParam = 0;
        }
        public static new string ToString()
        {
            string FormatByte(byte b, string format)
            {
                if (b == 0) return "--";
                return b.ToString(format);
            }
            return ToNote() + " " + FormatByte(Instrument, "D2") + " " + FormatByte(Volume, "X2") + " " + FormatByte(Effect, "X2") + FormatByte(EffectParam, "X2") + "|";
        }

        private static string ToNote()
        {
            if (Note == 0) return "---";
            int octave = (Note - 1) / 12;
            int note = (Note - 1) % 12;
            string ns = "--";
            switch (note)
            {
                case 0: ns = "C-"; break;
                case 1: ns = "C#"; break;
                case 2: ns = "D-"; break;
                case 3: ns = "D#"; break;
                case 4: ns = "E-"; break;
                case 5: ns = "F-"; break;
                case 6: ns = "F#"; break;
                case 7: ns = "G-"; break;
                case 8: ns = "G#"; break;
                case 9: ns = "A-"; break;
                case 10: ns = "A#"; break;
                case 11: ns = "B-"; break;

                default:
                    break;
            }
            return ns + octave;
        }

        public static void TryParseNextNoteFrom(ref int offset, byte[] data)
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
                if (IsBitSet(b, 0)) XMNote.Note = GetByte(ref offset);
                if (IsBitSet(b, 1)) XMNote.Instrument = GetByte(ref offset);
                if (IsBitSet(b, 2)) XMNote.Volume = GetByte(ref offset);
                if (IsBitSet(b, 3)) XMNote.Effect = GetByte(ref offset);
                if (IsBitSet(b, 4)) XMNote.EffectParam = GetByte(ref offset);
            }
            else
            {
                XMNote.Note = b;
                XMNote.Instrument = GetByte(ref offset);
                XMNote.Volume = GetByte(ref offset);
                XMNote.Effect = GetByte(ref offset);
                XMNote.EffectParam = GetByte(ref offset);
            }
        }
    }

}
