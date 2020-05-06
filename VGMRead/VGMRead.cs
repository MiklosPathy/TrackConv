using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrackConv;

namespace VGMRead
{
    public class VGMRead
    {
        //https://www.smspower.org/uploads/Music/vgmspec170.txt

        public readonly string FileName;
        private byte[] filedata;

        public VGMHeader Header { get; private set; }
        public GD3 Gd3 { get; private set; }

        public VGMRead(string filename)
        {
            FileName = filename;
        }

        public List<VGMCommand> VGMCommands { get; private set; } = new List<VGMCommand>();

        public void Open()
        {
            filedata = File.ReadAllBytes(FileName);
            Header = new VGMHeader(filedata);
            if (Header.GD3offset != 0)
                Gd3 = new GD3(filedata, Header.GD3offset);

            int offset = Header.VGMdataoffset;

            while (Header.EoFoffset > offset)
            {
                VGMCommand cmd = CommandRead(ref offset);
                VGMCommands.Add(cmd);
                if (cmd is VGMendofsounddata) break;
            }
        }

        public VGMCommand CommandRead(ref int offset)
        {
            byte command = filedata[offset];
            offset++;
            int size;
            int origofs;

            switch (command)
            {
                //  0x4F dd: Game Gear PSG stereo, write dd to port 0x06
                case 0x4F:
                //  0x50 dd: PSG(SN76489 / SN76496) write value dd
                case 0x50:
                    return new VGMCommand(filedata, ref offset, command, 1);
                //  0x51 aa dd : YM2413, write value dd to register aa
                case 0x51:
                //  0x52 aa dd : YM2612 port 0, write value dd to register aa
                case 0x52:
                //  0x53 aa dd : YM2612 port 1, write value dd to register aa
                case 0x53:
                //  0x54 aa dd : YM2151, write value dd to register aa
                case 0x54:
                //  0x55 aa dd : YM2203, write value dd to register aa
                case 0x55:
                //  0x56 aa dd : YM2608 port 0, write value dd to register aa
                case 0x56:
                //  0x57 aa dd : YM2608 port 1, write value dd to register aa
                case 0x57:
                //  0x58 aa dd : YM2610 port 0, write value dd to register aa
                case 0x58:
                //  0x59 aa dd : YM2610 port 1, write value dd to register aa
                case 0x59:
                    return new VGMCommand(filedata, ref offset, command, 2);
                //  0x5A aa dd : YM3812, write value dd to register aa
                case YM3812Command.Byte_0x5A:
                    return new YM3812Command(filedata, ref offset);
                //  0x5B aa dd : YM3526, write value dd to register aa
                case 0x5B:
                //  0x5C aa dd : Y8950, write value dd to register aa
                case 0x5C:
                //  0x5D aa dd : YMZ280B, write value dd to register aa
                case 0x5D:
                //  0x5E aa dd : YMF262 port 0, write value dd to register aa
                case 0x5E:
                //  0x5F aa dd : YMF262 port 1, write value dd to register aa
                case 0x5F:
                    return new VGMCommand(filedata, ref offset, command, 2);

                //  0x61 nn nn : Wait n samples, n can range from 0 to 65535(approx 1.49
                //               seconds).Longer pauses than this are represented by multiple
                //               wait commands.
                case VGMwaitNsamples.Byte_0x61:
                    return new VGMwaitNsamples(filedata, ref offset);
                //  0x62       : wait 735 samples(60th of a second), a shortcut for
                //              0x61 0xdf 0x02
                case VGMwait735samples.Byte_0x62:
                    return new VGMwait735samples();
                // 0x63       : wait 882 samples(50th of a second), a shortcut for
                //             0x61 0x72 0x03
                case VGMwait882samples.Byte_0x63:
                    return new VGMwait882samples();

                //0x64 cc nn nn : override length of 0x62/0x63
                //                  cc - command(0x62/0x63)
                //                  nn - delay in samples
                //                  [Note: Not yet implemented.Am I really sure about this ?]
                case 0x64:
                    return new VGMCommand(filedata, ref offset, command, 3);
                //  0x66       : end of sound data
                case VGMendofsounddata.Byte_0x66:
                    return new VGMendofsounddata();
                //  0x67 ...   : data block: see below
                case 0x67:
                    //    0x67 0x66 tt ss ss ss ss(data)
                    //    where:
                    //    0x67 = VGM command
                    //    0x66 = compatibility command to make older players stop parsing the stream
                    origofs = offset;
                    offset++;
                    //    tt = data type
                    offset++;
                    //    ss ss ss ss(32 bits) = size of data, in bytes
                    //(data) = data, of size previously specified
                    size = filedata.ReadAsLittleendianDWord(offset);
                    offset += 4;
                    offset += size;
                    return new VGMCommand(filedata, ref origofs, command, 6 + size);
                //  0x68 ...   : PCM RAM write: see below
                case 0x68:
                    //  0x68 0x66 cc oo oo oo dd dd dd ss ss ss
                    //where:
                    //  x68 = VGM command
                    //  0x66 = compatibility command to make older players stop parsing the stream
                    origofs = offset;
                    offset++;
                    //  cc = chip type(see data block types 00..3F)
                    offset++;
                    //  oo oo oo(24 bits) = read offset in data block
                    offset += 3;
                    //  dd dd dd(24 bits) = write offset in chip's ram (affected by chip's
                    //                       registers)
                    offset += 3;
                    //  ss ss ss(24 bits) = size of data, in bytes
                    //   Since size can't be zero, a size of 0 bytes means 0x0100 0000 bytes.
                    size = filedata.ReadAsLittleendian3Bytes(offset);
                    offset += size;
                    //All unknown types must be skipped by the player.
                    return new VGMCommand(filedata, ref origofs, command, 11 + size);

                //  0x90-0x95  : DAC Stream Control Write: see below

                //Setup Stream Control:
                //                    0x90 ss tt pp cc
                case 0x90:
                    //      ss = Stream ID
                    //      tt = Chip Type(see clock - order in header, e.g.YM2612 = 0x02)
                    //            bit 7 is used to select the 2nd chip
                    //      pp cc = write command / register cc at port pp
                    //      Note: For chips that use Channel Select Registers(like the RF5C - family
                    //            and the HuC6280), the format is pp cd where pp is the channel
                    //            number, c is the channel register and d is the data register.
                    //            If you set pp to FF, the channel select write is skipped.
                    return new VGMCommand(filedata, ref offset, command, 4);
                //Set Stream Data:
                case 0x91:
                    //                    0x91 ss dd ll bb
                    //      ss = Stream ID
                    //      dd = Data Bank ID(see data block types 0x00..0x3f)
                    //      ll = Step Size(how many data is skipped after every write, usually 1)
                    //            Set to 2, if you're using an interleaved stream (e.g. for
                    //             left / right channel).
                    //      bb = Step Base(data offset added to the Start Offset when starting
                    //            stream playback, usually 0)
                    //            If you're using an interleaved stream, set it to 0 in one stream
                    //            and to 1 in the other one.
                    //      Note: Step Size/ Step Step are given in command - data - size
                    //              (i.e. 1 for YM2612, 2 for PWM), not bytes
                    return new VGMCommand(filedata, ref offset, command, 4);
                //Set Stream Frequency:
                case 0x92:
                    //                    0x92 ss ff ff ff ff
                    //                        ss = Stream ID
                    //                        ff = Frequency(or Sample Rate, in Hz) at which the writes are done
                    return new VGMCommand(filedata, ref offset, command, 4);
                //Start Stream:
                case 0x93:
                    //  0x93 ss aa aa aa aa mm ll ll ll ll
                    //      ss = Stream ID
                    origofs = offset;
                    offset++;
                    //      aa = Data Start offset in data bank(byte offset in data bank)
                    //            Note: if set to - 1, the Data Start offset is ignored
                    offset += 4;
                    //       mm = Length Mode(how the Data Length is calculated)
                    //            00 - ignore(just change current data position)
                    //            01 - length = number of commands
                    //            02 - length in msec
                    //            03 - play until end of data
                    //            1 ? -(bit 4) Reverse Mode
                    //            8 ? -(bit 7) Loop(automatically restarts when finished)
                    offset++;
                    //      ll = Data Length
                    size = filedata.ReadAsLittleendianDWord(offset);
                    offset += 4;
                    offset += size;
                    return new VGMCommand(filedata, ref origofs, command, 10 + size);
                //Stop Stream:
                case 0x94:
                    //                    0x94 ss
                    //                        ss = Stream ID
                    //                              Note: 0xFF stops all streams
                    return new VGMCommand(filedata, ref offset, command, 1);
                //Start Stream(fast call):
                case 0x95:
                    //  0x95 ss bb bb ff
                    //      ss = Stream ID
                    //      bb = Block ID(number of the data block that is part of the data bank set
                    //            with command 0x91)
                    //      ff = Flags
                    //            bit 0 - Loop(see command 0x93, mm bit 7)
                    //            bit 4 - Reverse Mode(see command 0x93)
                    return new VGMCommand(filedata, ref offset, command, 4);
                //  0xA0 aa dd : AY8910, write value dd to register aa
                case 0xA0:
                //  0xB0 aa dd : RF5C68, write value dd to register aa
                case 0xB0:
                //  0xB1 aa dd : RF5C164, write value dd to register aa
                case 0xB1:
                //  0xB2 ad dd : PWM, write value ddd to register a(d is MSB, dd is LSB)
                case 0xB2:
                //  0xB3 aa dd : GameBoy DMG, write value dd to register aa
                case 0xB3:
                //  0xB4 aa dd : NES APU, write value dd to register aa
                case 0xB4:
                //  0xB5 aa dd : MultiPCM, write value dd to register aa
                case 0xB5:
                //  0xB6 aa dd : uPD7759, write value dd to register aa
                case 0xB6:
                //  0xB7 aa dd : OKIM6258, write value dd to register aa
                case 0xB7:
                //  0xB8 aa dd : OKIM6295, write value dd to register aa
                case 0xB8:
                //  0xB9 aa dd : HuC6280, write value dd to register aa
                case 0xB9:
                //  0xBA aa dd : K053260, write value dd to register aa
                case 0xBA:
                //  0xBB aa dd : Pokey, write value dd to register aa
                case 0xBB:
                    return new VGMCommand(filedata, ref offset, command, 2);
                //  0xC0 aaaa dd : Sega PCM, write value dd to memory offset aaaa
                case 0xC0:
                //  0xC1 aaaa dd : RF5C68, write value dd to memory offset aaaa
                case 0xC1:
                //  0xC2 aaaa dd : RF5C164, write value dd to memory offset aaaa
                case 0xC2:
                //  0xC3 cc aaaa : MultiPCM, write set bank offset aaaa to channel cc
                case 0xC3:
                //  0xC4 mmll rr : QSound, write value mmll to register rr
                //                 (mm - data MSB, ll - data LSB)
                case 0xC4:
                //  0xD0 pp aa dd : YMF278B port pp, write value dd to register aa
                case 0xD0:
                //  0xD1 pp aa dd : YMF271 port pp, write value dd to register aa
                case 0xD1:
                //  0xD2 pp aa dd : SCC1 port pp, write value dd to register aa
                case 0xD2:
                //  0xD3 pp aa dd : K054539 write value dd to register ppaa
                case 0xD3:
                //  0xD4 pp aa dd : C140 write value dd to register ppaa
                case 0xD4:
                    return new VGMCommand(filedata, ref offset, command, 3);
                //  0xE0 dddddddd : seek to offset dddddddd(Intel byte order) in PCM data bank
                case 0xE0:
                    return new VGMCommand(filedata, ref offset, command, 4);
                default:
                    break;
            }

            //  0x7n       : wait n+1 samples, n can range from 0 to 15.
            if (command >= 0x70 && command <= 0x7F)
            {
                return new VGMwait(command);
            }
            //  0x8n       : YM2612 port 0 address 2A write from the data bank, then wait
            //               n samples; n can range from 0 to 15. Note that the wait is n,
            //               NOT n+1. (Note: Written to first chip instance only.)
            if (command >= 0x80 && command <= 0x8F)
            {
                return new VGMCommand(command);
            }


            //Some ranges are reserved for future use, with different numbers of operands:

            //  0x30..0x3F dd          : one operand, reserved for future use
            //                           Note: used for dual-chip support(see below)
            if (command >= 0x30 && command <= 0x3F)
            {
                new VGMCommand(filedata, ref offset, command, 1);
            }
            //  0x40..0x4E dd dd       : two operands, reserved for future use
            //                           Note: was one operand only til v1.60
            if (command >= 0x40 && command <= 0x4E)
            {
                new VGMCommand(filedata, ref offset, command, 2);
            }
            //  0xA1..0xAF dd dd       : two operands, reserved for future use
            //                           Note: used for dual-chip support(see below)
            if (command >= 0xA1 && command <= 0xAF)
            {
                new VGMCommand(filedata, ref offset, command, 2);
            }
            //  0xBC..0xBF dd dd       : two operands, reserved for future use
            if (command >= 0xBC && command <= 0xBF)
            {
                new VGMCommand(filedata, ref offset, command, 2);
            }
            //  0xC5..0xCF dd dd dd    : three operands, reserved for future use
            if (command >= 0xC5 && command <= 0xCF)
            {
                new VGMCommand(filedata, ref offset, command, 3);
            }
            //  0xD5..0xDF dd dd dd    : three operands, reserved for future use
            if (command >= 0xD5 && command <= 0xDF)
            {
                new VGMCommand(filedata, ref offset, command, 3);
            }
            //  0xE1..0xFF dd dd dd dd : four operands, reserved for future use
            if (command >= 0xE1 && command <= 0xFF)
            {
                new VGMCommand(filedata, ref offset, command, 4);
            }

            throw new Exception("Non handled command:" + command.ToString("X"));

        }


    }

    public class VGMHeader
    {
        /*
             00  01  02  03   04  05  06  07   08  09  0A  0B   0C  0D  0E  0F
        0x00 ["Vgm " ident]   [EoF offset]     [Version]        [SN76489 clock]
        0x10 [YM2413 clock]   [GD3 offset]     [Total # samples][Loop offset  ]
        0x20 [Loop # samples] [Rate           ][SN FB][SNW][SF] [YM2612 clock ]
        0x30 [YM2151 clock]   [VGM data offset][Sega PCM clock] [SPCM Interface]
        0x40 [RF5C68 clock]   [YM2203 clock]   [YM2608 clock]   [YM2610/B clock]
        0x50 [YM3812 clock]   [YM3526 clock]   [Y8950 clock]    [YMF262 clock]
        0x60 [YMF278B clock]  [YMF271 clock]   [YMZ280B clock]  [RF5C164 clock]
        0x70 [PWM clock]      [AY8910 clock]   [AYT] [AY Flags] [VM]***[LB][LM]
        0x80 [GB DMG clock]   [NES APU clock]  [MultiPCM clock] [uPD7759 clock]
        0x90 [OKIM6258 clock] [OF][KF][CF]***  [OKIM6295 clock] [K051649 clock]
        0xA0 [K054539 clock]  [HuC6280 clock]  [C140 clock]     [K053260 clock]
        0xB0 [Pokey clock]    [QSound clock]   ************     [Extra Hdr ofs]
        0xC0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xD0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xE0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        0xF0 *** *** *** ***  *** *** *** ***  *** *** *** ***  *** *** *** ***
        */

        public static class Consts
        {
            public const int Vgmident = 0x0000;              // ["Vgm " ident]
            public const int EoFoffset = 0x0004;             // [EoF offset]
            public const int Version = 0x0008;               // [Version]
            public const int SN76489clock = 0x000C;          // [SN76489 clock]
            public const int YM2413clock = 0x0010;           // [YM2413 clock]
            public const int GD3offset = 0x0014;             // [GD3 offset]
            public const int Totalsamples = 0x0018;          // [Total # samples]
            public const int Loopoffset = 0x001C;            // [Loop offset    ]
            public const int Loopsamples = 0x0020;           // [Loop # samples ]
            public const int Rate = 0x0024;                  // [Rate           ]
            public const int SNFB = 0x0028;                  // [SN FB]
            public const int SNW = 0x002A;                   // [SNW]
            public const int SF = 0x002B;                    // [SF]
            public const int YM2612clock = 0x002C;           // [YM2612 clock   ]
            public const int YM2151clock = 0x0030;           // [YM2151 clock]
            public const int VGMdataoffset = 0x0034;         // [VGM data offset]
            public const int SegaPCMclock = 0x0038;          // [Sega PCM clock]
            public const int SPCMInterface = 0x003C;         // [SPCM Interface]
            public const int RF5C68clock = 0x0040;           // [RF5C68 clock]
            public const int YM2203clock = 0x0044;           // [YM2203 clock]
            public const int YM2608clock = 0x0048;           // [YM2608 clock]
            public const int YM2610Bclock = 0x004C;          // [YM2610/B clock]
            public const int YM3812clock = 0x0050;           // [YM3812 clock]
            public const int YM3526clock = 0x0054;           // [YM3526 clock]
            public const int Y8950clock = 0x0058;            // [Y8950 clock]
            public const int YMF262clock = 0x005C;           // [YMF262 clock]
        }

        private byte[] filedata;
        public VGMHeader(byte[] filedata)
        {
            this.filedata = filedata;
            if (Vgmident != "Vgm ") throw new Exception("Non Vgm file, exitus.");

        }

        public string Vgmident { get { return filedata.ReadAsString(Consts.Vgmident, 4); } }
        public int EoFoffset { get { return filedata.ReadAsLittleendianDWord(Consts.EoFoffset) + Consts.EoFoffset; } }

        public int VersionNum { get { return int.Parse(filedata[Consts.Version + 1].ToString("X")); } }
        public int VersionSubNum { get { return int.Parse(filedata[Consts.Version].ToString("X")); } }
        public int VersionCombined { get { return VersionNum * 100 + VersionSubNum; } }
        public string VersionString { get { return string.Format("{0}.{1}", VersionNum, VersionSubNum); } }
        public int GD3offset { get { return filedata.ReadAsLittleendianDWord(Consts.GD3offset) + Consts.GD3offset; } }
        public int Totalsamples { get { return filedata.ReadAsLittleendianDWord(Consts.Totalsamples); } }
        public int Loopoffset { get { return filedata.ReadAsLittleendianDWord(Consts.Loopoffset); } }
        public int Loopsamples { get { return filedata.ReadAsLittleendianDWord(Consts.Loopsamples); } }
        public int Rate { get { return filedata.ReadAsLittleendianDWord(Consts.Rate); } }
        public int VGMdataoffset
        {
            get
            {
                if (VersionCombined < 150) return 0x40;
                return filedata.ReadAsLittleendianDWord(Consts.VGMdataoffset) + Consts.VGMdataoffset;
            }
        }
    }

    public class VGMCommand
    {
        public VGMCommand(byte CommandByte, int DataSize, byte[] Data)
        {
            this.CommandByte = CommandByte;
            this.DataSize = DataSize;
            this.Data = Data;
        }
        public VGMCommand(byte[] filedata, ref int offset, byte CommandByte, int DataSize)
        {
            this.CommandByte = CommandByte;
            this.DataSize = DataSize;
            this.Data = filedata.CopyOutByteArray(offset, DataSize);
            offset += DataSize;
        }
        public VGMCommand(byte CommandByte)
        {
            this.CommandByte = CommandByte;
            this.DataSize = 0;
            this.Data = new byte[0];
        }
        public byte CommandByte { get; protected set; }
        public int DataSize { get; protected set; }
        public byte[] Data { get; protected set; }
    }

    public class YM3812Command : VGMCommand
    {
        public const byte Byte_0x5A = 0x5A;
        public YM3812Command(byte[] filedata, ref int offset) : base(filedata, ref offset, Byte_0x5A, 2) { }
        public byte Register { get { return Data[0]; } }
        public byte Value { get { return Data[1]; } }
    }

    public class VGMwait : VGMCommand
    {
        public VGMwait(byte[] filedata, ref int offset, byte CommandByte, int DataSize) : base(filedata, ref offset, CommandByte, DataSize) { }
        public VGMwait(byte CommandByte) : base(CommandByte)
        {
            if (CommandByte >= 0x70 && CommandByte <= 0x7F)
                waitsamples = CommandByte - 0x70 + 1;
        }
        public int waitsamples { get; protected set; }
    }

    public class VGMwaitNsamples : VGMwait
    {
        public const byte Byte_0x61 = 0x61;
        public VGMwaitNsamples(byte[] filedata, ref int offset) : base(filedata, ref offset, Byte_0x61, 2)
        {
            waitsamples = Data.ReadAsLittleendianWord(0);
        }
    }

    public class VGMwait735samples : VGMwait
    {
        public const byte Byte_0x62 = 0x62;
        public VGMwait735samples() : base(Byte_0x62) { waitsamples = 735; }
    }

    public class VGMwait882samples : VGMwait
    {
        public const byte Byte_0x63 = 0x63;
        public VGMwait882samples() : base(Byte_0x63) { waitsamples = 882; }
    }

    public class VGMendofsounddata : VGMCommand
    {
        public const byte Byte_0x66 = 0x66;
        public VGMendofsounddata() : base(Byte_0x66) { }
    }

    public class GD3
    {
        private readonly byte[] filedata;
        private readonly int startoffset;
        public GD3(byte[] filedata, int startoffset)
        {
            this.filedata = filedata;
            this.startoffset = startoffset;
            if (Gd3tag != "Gd3 ") throw new Exception("Bad Gd3 tag");

            int offset = startoffset + 12;

            //"Track name (in English characters)\0"
            TracknameENG = ReadGd3String(ref offset);
            //"Track name (in Japanese characters)\0"
            TracknameJAP = ReadGd3String(ref offset);
            //"Game name (in English characters)\0"
            GamenameENG = ReadGd3String(ref offset);
            //"Game name (in Japanese characters)\0"
            GamenameJAP = ReadGd3String(ref offset);
            //"System name (in English characters)\0"
            SystemnameENG = ReadGd3String(ref offset);
            //"System name (in Japanese characters)\0"
            SystemnameJAP = ReadGd3String(ref offset);
            //"Name of Original Track Author (in English characters)\0"
            AuthorENG = ReadGd3String(ref offset);
            //"Name of Original Track Author (in Japanese characters)\0"
            AuthorJAP = ReadGd3String(ref offset);
            //"Date of game's release written in the form yyyy/mm/dd, or just yyyy/mm or yyyy if month and day is not known\0"
            Date = ReadGd3String(ref offset);
            //"Name of person who converted it to a VGM file.\0"
            ConvertedBy = ReadGd3String(ref offset);
            //"Notes\0"
            Notes = ReadGd3String(ref offset);

        }

        private string ReadGd3String(ref int offset)
        {
            int s = 0;
            string result = "";
            do
            {
                s = filedata.ReadAsLittleendianWord(offset);
                offset += 2;
                if (s != 0) result += Convert.ToChar(s);
            } while (s != 0);
            return result;
        }

        public string Gd3tag { get { return filedata.ReadAsString(startoffset, startoffset + 4); } }
        public int EoFoffset { get { return filedata.ReadAsLittleendianDWord(startoffset + 8) + 8; } }
        public string TracknameENG { get; private set; }

        public string TracknameJAP { get; private set; }
        public string GamenameENG { get; private set; }
        public string GamenameJAP { get; private set; }
        public string SystemnameENG { get; private set; }
        public string SystemnameJAP { get; private set; }
        public string AuthorENG { get; private set; }
        public string AuthorJAP { get; private set; }
        public string Date { get; private set; }
        public string ConvertedBy { get; private set; }
        public string Notes { get; private set; }
    }
}
