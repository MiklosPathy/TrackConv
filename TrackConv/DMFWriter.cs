﻿using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.IO.Compression;
using ICSharpCode.SharpZipLib.Zip.Compression.Streams;
using ICSharpCode.SharpZipLib.Core;

namespace TrackConv
{
    public static class DMFWriter
    {
        public static void ToDMF(Conversion conv)
        {
            List<byte> outfile = new List<byte>();

            ////START OF DMF FORMAT
            ////FORMAT FLAGS
            //16 Bytes: Format String, must be ".DelekDefleMask."
            outfile.AddRange(Encoding.ASCII.GetBytes(".DelekDefleMask."));
            //1  Byte: File Version, must be 24(0x18) for DefleMask v0.12.0
            outfile.Add(0x18);

            ////SYSTEM SET
            //1  Byte:  System:
            //	SYSTEM_GENESIS 0x02(SYSTEM_TOTAL_CHANNELS 10)
            //	SYSTEM_GENESIS(EXT.CH3) 0x12(SYSTEM_TOTAL_CHANNELS 13)
            //	SYSTEM_SMS 0x03(SYSTEM_TOTAL_CHANNELS 4)
            //	SYSTEM_GAMEBOY 0x04(SYSTEM_TOTAL_CHANNELS 4)
            //	SYSTEM_PCENGINE 0x05(SYSTEM_TOTAL_CHANNELS 6)
            //	SYSTEM_NES 0x06(SYSTEM_TOTAL_CHANNELS 5)
            //	SYSTEM_C64(SID 8580) 0x07(SYSTEM_TOTAL_CHANNELS 3)
            //	SYSTEM_C64(SID 6581) 0x17(SYSTEM_TOTAL_CHANNELS 3)
            //	SYSTEM_YM2151 0x08(SYSTEM_TOTAL_CHANNELS 13)
            outfile.Add(0x08); //YM2151 for now.

            ////VISUAL INFORMATION
            //1 Byte:   Song Name Chars Count(0 - 255)
            outfile.Add((byte)conv.XM.Header.Modulename.Length);
            //N Bytes:  Song Name Chars
            outfile.AddRange(Encoding.ASCII.GetBytes(conv.XM.Header.Modulename));
            //1 Byte:	  Song Author Chars Count(0 - 255)
            outfile.Add(9);
            //N Bytes:  Song Author Chars
            outfile.AddRange(Encoding.ASCII.GetBytes("TrackConv"));
            //1 Byte:	  Highlight A in patterns
            outfile.Add(0x00);
            //1 Byte:   Highlight B in patterns
            outfile.Add(0x00);

            ////MODULE INFORMATION
            //1 Byte:	Time Base
            outfile.Add((byte)conv.CurrentBPM);
            //1 Byte:   Tick Time 1
            outfile.Add((byte)conv.CurrentRowPerBeat);
            //1 Byte:   Tick Time 2
            outfile.Add((byte)conv.CurrentTickPerRow);
            //1 Byte:   Frames Mode(0 = PAL, 1 = NTSC)
            outfile.Add(1); //Probably
            //1 Byte:   Using Custom HZ(If set to 1, NTSC or PAL is ignored)
            outfile.Add(1); //CX16 60 Hz
            //1 Byte:   Custom HZ value 1
            outfile.Add(60);
            //1 Byte:   Custom HZ value 2
            outfile.Add(0);
            //1 Byte:   Custom HZ value 3
            outfile.Add(0);
            //4 Bytes:  TOTAL_ROWS_PER_PATTERN
            int totalrowsperpattern = conv.XM.Patterns.Max(x => x.NumberOfRows);
            outfile.AddRange(BitConverter.GetBytes(totalrowsperpattern));
            //1 Byte:   TOTAL_ROWS_IN_PATTERN_MATRIX
            outfile.Add((byte)conv.XM.Header.SongLengthInPatterns);

            //(Arpeggio Tick speed was here in previous version(1 Byte), it was REMOVED since ver 11.1)

            ////PATTERN MATRIX VALUES (A matrix of SYSTEM_TOTAL_CHANNELS x TOTAL_ROWS_IN_PATTERN_MATRIX)
            //Repeat this SYSTEM_TOTAL_CHANNELS times
            for (int i = 0; i < 13; i++)
            {
                //  Repeat this TOTAL_ROWS_IN_PATTERN_MATRIX times
                for (int j = 0; j < conv.XM.Header.SongLengthInPatterns; j++)
                {
                    //	  1 Byte: Pattern Matrix Value: (Index from SYSTEM_TOTAL_CHANNELS loop, Index from TOTAL_ROWS_IN_PATTERN_MATRIX loop)
                    outfile.Add(conv.XM.Header.PatternOrderTable[j]);
                }
            }

            ////INSTRUMENTS DATA (.DMP format is similar to this part, but there are some discrepancies, please read DMP_Specs.txt for more details)
            //	1 Byte: TOTAL_INSTRUMENTS
            outfile.Add(0); //Not yet
            //Repeat this TOTAL_INSTRUMENTS times
            //	1 Byte: Instrument Name Chars Count(0 - 255)
            //	N Bytes:  Instrument Name Chars
            //	1 Byte: Instrument Mode(0 = STANDARD INS, 1 = FM INS)

            //	//PER INSTRUMENT MODE DATA

            //		//IF INSTRUMENT MODE IS FM ( = 1)
            //			1 Byte: ALG
            //			1 Byte: FB
            //			1 Byte: LFO(FMS on YM2612, PMS on YM2151)
            //			1 Byte: LFO2(AMS on YM2612, AMS on YM2151)
            //			Repeat this TOTAL_OPERATORS times
            //				1 Byte: AM
            //				1 Byte: AR
            //				1 Byte: DR
            //				1 Byte: MULT
            //				1 Byte: RR
            //				1 Byte: SL
            //				1 Byte: TL
            //				1 Byte: DT2
            //				1 Byte: RS
            //				1 Byte: DT
            //				1 Byte: D2R
            //				1 Byte: SSGMODE(BIT 4 = 0 Disabled, 1 Enabled, BITS 0, 1, 2 SSG_MODE)

            //		//IF INSTRUMENT MODE IS STANDARD ( = 0)
            //		//IF NOT SYSTEM_GAMEBOY (Game Boy uses STD instruments but has internal ADSR Volume, do not read VOLUME MACRO for it)
            //		//VOLUME MACRO
            //			1 Byte: ENVELOPE_SIZE(0 - 127)
            //				Repeat this ENVELOPE_SIZE times
            //					4 Bytes: ENVELOPE_VALUE
            //			//IF ENVELOPE_SIZE > 0
            //			1 Byte: LOOP_POSITION(-1 = NO LOOP)

            //			//ARPEGGIO MACRO
            //			1 Byte: ENVELOPE_SIZE(0 - 127)
            //			Repeat this ENVELOPE_SIZE times
            //				4 Bytes: ENVELOPE_VALUE(signed int, offset = 12)
            //			//IF ENVELOPE_SIZE > 0
            //			1 Byte: LOOP_POSITION(-1 = NO LOOP)
            //			1 Byte: ARPEGGIO MACRO MODE(0 = Normal, 1 = Fixed)

            //			//DUTY/NOISE MACRO
            //			1 Byte: ENVELOPE_SIZE(0 - 127)
            //			Repeat this ENVELOPE_SIZE times
            //				4 Bytes: ENVELOPE_VALUE
            //			//IF ENVELOPE_SIZE > 0
            //			1 Byte: LOOP_POSITION(-1 = NO LOOP)

            //			//WAVETABLE MACRO
            //			1 Byte: ENVELOPE_SIZE(0 - 127)
            //			Repeat this ENVELOPE_SIZE times
            //				4 Bytes: ENVELOPE_VALUE
            //			//IF ENVELOPE_SIZE > 0
            //			1 Byte: LOOP_POSITION(-1 = NO LOOP)

            //			//PER SYSTEM DATA
            //			//IF SYSTEM_C64
            //			1 Byte: Triangle Wave Enabled
            //					1 Byte: Saw Wave Enabled
            //					1 Byte: Pulse Wave Enabled
            //					1 Byte: Noise Wave Enabled
            //					1 Byte: Attack
            //					1 Byte: Decay
            //					1 Byte: Sustain
            //					1 Byte: Release
            //					1 Byte: Pulse Width
            //					1 Byte: Ring Modulation Enabled
            //					1 Byte: Sync Modulation Enabled
            //					1 Byte: To Filter
            //					1 Byte: Volume Macro To Filter Cutoff Enabled
            //					1 Byte: Use Filter Values From Instrument
            //					//FILTER GLOBALS
            //			1 Byte: Filter Resonance
            //					1 Byte: Filter Cutoff
            //					1 Byte: Filter High Pass
            //					1 Byte: Filter Low Pass
            //					1 Byte: Filter CH2 Off
            //				//IF SYSTEM_GAMEBOY
            //			1 Byte: Envelope Volume
            //					1 Byte: Envelope Direction
            //					1 Byte: Envelope Length
            //					1 Byte: Sound Length

            ////END OF INSTRUMENTS DATA
            ////WAVETABLES DATA
            //	1 Byte: TOTAL_WAVETABLES
            outfile.Add(0); //Nope
                            //Repeat this TOTAL_WAVETABLES times
                            //	4 Bytes: WAVETABLE_SIZE
                            //	Repeat this WAVETABLE_SIZE times
                            //		4 Bytes: Wavetable Data
                            ////PATTERNS DATA

            //	Repeat this SYSTEM_TOTAL_CHANNELS times
            for (int i = 0; i < 13; i++)
            {
                //	1 Byte: CHANNEL_EFFECTS_COLUMNS_COUNT
                outfile.Add(1);
                //	Repeat this TOTAL_ROWS_IN_PATTERN_MATRIX times
                for (int j = 0; j < conv.XM.Header.SongLengthInPatterns; j++)
                {
                    //		Repeat this TOTAL_ROWS_PER_PATTERN times
                    for (int k = 0; k < totalrowsperpattern; k++)
                    {
                        XMNote note;
                        if (i >= conv.XM.Header.NumberOfChannels) note = new XMNote();
                        else
                        {
                            if (k >= conv.XM.Patterns[conv.XM.Header.PatternOrderTable[j]].NumberOfRows) continue;
                            note = conv.XM.Patterns[conv.XM.Header.PatternOrderTable[j]].PatArr[k, i];
                        }
                        //			2 Bytes: Note for this index
                        outfile.AddRange(BitConverter.GetBytes((Int16)note.Note));
                        //			2 Bytes: Octave for this index
                        outfile.AddRange(BitConverter.GetBytes((Int16)note.octave));
                        //			//Note values:
                        //			//01 C#
                        //			//02 D-
                        //			//03 D#
                        //			//04 E-
                        //			//05 F-
                        //			//06 F#
                        //			//07 G-
                        //			//08 G#
                        //			//09 A-
                        //			//10 A#
                        //			//11 B-
                        //			//12 C-

                        //			//Special cases:
                        //			//Note = 0 and octave = 0 means empty.
                        //			//Note = 100 means NOTE OFF, no matter what is inside the octave value.

                        //			2 Bytes: Volume for this index(-1 = Empty)
                        outfile.AddRange(BitConverter.GetBytes((Int16)note.Volume));
                        //			Repeat this CHANNEL_EFFECTS_COLUMNS_COUNT times
                        //				2 Bytes: Effect Code for this index(-1 = Empty)
                        outfile.AddRange(BitConverter.GetBytes((Int16)note.Effect));
                        //				2 Bytes: Effect Value for this index(-1 = Empty)
                        outfile.AddRange(BitConverter.GetBytes((Int16)note.EffectParam));
                        //			2 Bytes: Instrument for this index(-1 = Empty)
                        outfile.AddRange(BitConverter.GetBytes((Int16)note.Instrument));
                    }
                }
            }
            ////PCM SAMPLES DATA
            //1 Byte: TOTAL_SAMPLES
            outfile.Add(0); //Nope
                            //Repeat this TOTAL_SAMPLES times
                            //	4 Bytes: SAMPLE_SIZE
                            //	1 Byte:   Sample Name Chars Count(0 - 255)
                            //	N Bytes:  Sample Name Chars
                            //	1 Byte: Sample Rate
                            //	1 Byte: Sample Pitch
                            //	1 Byte: Sample Amp
                            //	1 Byte: Sample Bits(8 or 16)
                            //	Repeat this SAMPLE_SIZE times
                            //		2 Bytes: Actual Sample Data

            ////END OF DMF FORMAT
            ///

            //MemoryStream stream = new MemoryStream(outfile.ToArray());
            //using (FileStream compressedFileStream = File.Create("music.dmf"))
            //{
            //    using (DeflateStream compressionStream = new DeflateStream(compressedFileStream, CompressionMode.Compress))
            //    {
            //        stream.CopyTo(compressionStream);
            //    }
            //}

            var output2 = CreateToMemoryStream(outfile.ToArray());
            var arr2 = output2.ToArray();
            File.WriteAllBytes("music.dmf", arr2);


        }

        public static MemoryStream CreateToMemoryStream(byte[] data)
        {
            MemoryStream memStreamIn = new MemoryStream(data);


            var outputMemStream = new MemoryStream();
            using (var zipStream = new DeflaterOutputStream(outputMemStream))
            {
                StreamUtils.Copy(memStreamIn, zipStream, new byte[4096]);

                // Stop ZipStream.Dispose() from also Closing the underlying stream.
                zipStream.IsStreamOwner = false;
            }

            outputMemStream.Position = 0;
            return outputMemStream;
        }

    }
}

