using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public static class XMExtensionMethods
    {
        public static string ReadAsString(this byte[] data, int from, int until)
        {
            string result = "";
            for (int i = from; i < until; i++)
            {
                result += Convert.ToChar(data[i]);
            }
            return result;
        }

        public static int ReadAsWord(this byte[] data, int from)
        {
            int result = data[from + 1] * 256;
            result += data[from];
            return result;
        }

        public static int ReadAsDWord(this byte[] data, int from)
        {
            int result = (int)data[from + 3] * 16777216;
            result += (int)data[from + 2] * 65536;
            result += (int)data[from + 1] * 256;
            result += (int)data[from];
            return result;
        }

        public static byte[] CopyOutByteArray(this byte[] data, int From, int Lenght)
        {
            byte[] result = new byte[Lenght];
            for (int i = 0; i < Lenght; i++)
            {
                result[i] = data[From + i];
            }
            return result;
        }
    }
}
