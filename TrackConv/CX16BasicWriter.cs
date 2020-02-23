using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace TrackConv
{
    public static class CX16BasicWriter
    {
        public static void ToFile(List<byte> bytes)
        {
            int linenumber = 10000;
            const int maxiteminline = 16;

            string cx16basicplayer = @"100 GOSUB 500
110 TT=TI
120 READ R,D
130 POKE $9FE0,R:POKE $9FE1,D
140 IF(R>0)THEN GOTO 120
150 IF(D=0)THEN GOTO 200
160 TT=TT+D
170 FOR I=0 TO 1 STEP 0
180 IF(TI>=TT)THEN GOTO 110
190 NEXT I
200 GOSUB 500
210 END
500 REM RESET SOUND CHIP
510 FOR I = 0 TO 255 : POKE $9FE0, I : POKE $9FE1, 0 : NEXT
520 RETURN";


            List<string> lines = new List<string>();
            lines.Add(cx16basicplayer);

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
            lines.Add(linenumber + " DATA 0,0");

            File.WriteAllLines(@"notes.txt", lines.ToArray());
        }
    }
}
