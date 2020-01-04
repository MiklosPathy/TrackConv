using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    public class XMInstrument
    {
        private static class Consts
        {
            public const int InstrumentHeaderSize = 0x0000;// h                   1 dword Instrument block/header size
            public const int InstrumentName = 0x0004;// h                  22 char ASCII Instrument name, 0 padded?
            public const int InstrumentType = 0x001A; // h                   1 byte Instrument type(always 0)
            public const int NumberOfSamples = 0x001B;// h                   1 word Number of samples in instrument
            public const int SampleHeaderSize = 0x001D; // h                   1 dword Sample header size
            public const int SampleNumbersForAllNotes = 0x0021;// h                  96 byte Sample numbers for all notes
            public const int PointsOfVolumeEnvelope = 0x0081;// h                  48 byte Points of volume envelope
            public const int PointsOfPanningEnvelope = 0x00C1;// h                  48 byte Points of panning envelope
            public const int NumberOfVolumePoints = 0x0101; // h                   1 byte Number of volume points
            public const int NumberOfPanningPoints = 0x0102;// h                   1 byte Number of panning points
            public const int VolumeSustainPoint = 0x0103; // h                   1 byte Volume sustain point
            public const int VolumeLoopStartPoint = 0x0104; // h                   1 byte Volume loop start point
            public const int VolumeLoopEndPoint = 0x0105;// h                   1 byte Volume loop end point
            public const int PanningSustainPoint = 0x0106; // h                   1 byte Panning sustain point
            public const int PanningLoopStartPoint = 0x0107;// h                   1 byte Panning loop start point
            public const int PanningLoopEndPoint = 0x0108;// h                   1 byte Panning loop end point
            public const int VolumeType = 0x0109;// h                   1 byte Volume type, bitmapped
                                                 //0 - Volume on
                                                 //1 - Sustain on
                                                 //2 - Loop on
            public const int PanningType = 0x010A;// h                   1 byte Panning type, bitmapped
                                                  //0 - Panning on
                                                  //1 - Sustain on
                                                  //2 - Loop on
            public const int VibratoType = 0x010B;// h                   1 byte Vibrato type
            public const int VibratoSweep = 0x010C;//                   1 byte Vibrato sweep
            public const int VibratoDepth = 0x010D;// h                   1 byte Vibrato depth
            public const int VibratoRate = 0x010E; // h                   1 byte Vibrato rate
            public const int VolumeFadeout = 0x010F; // h                   1 word Volume fadeout
            public const int Reserved = 0x0111;// h                   1 word Reserved
        }



        private byte[] filedata;
        private int offset;
        public int nextinstrumentofset;

        private XMSample[] samples;
        public XMSample[] Samples { get { return samples; } }

        public XMInstrument(byte[] filedata, int offset)
        {
            this.filedata = filedata;
            this.offset = offset;

            samples = new XMSample[NumberOfSamples];

            nextinstrumentofset = offset + InstrumentHeaderSize;
            for (int i = 0; i < NumberOfSamples; i++)
            {
                XMSample sample = new XMSample(filedata, nextinstrumentofset);
                samples[i] = sample;
                nextinstrumentofset += (SampleHeaderSize + sample.SampleLength);
            }
        }

        public int InstrumentHeaderSize { get { return filedata.ReadAsDWord(offset + Consts.InstrumentHeaderSize); } }
        public string InstrumentName { get { return filedata.ReadAsString(offset + Consts.InstrumentName, offset + Consts.InstrumentType); } }
        public byte InstrumentType { get { return filedata[offset + Consts.InstrumentType]; } }
        public int NumberOfSamples { get { return filedata.ReadAsWord(offset + Consts.NumberOfSamples); } }
        public int SampleHeaderSize { get { return filedata.ReadAsDWord(offset + Consts.SampleHeaderSize); } }
        public byte[] SampleNumbersForAllNotes { get { return filedata.CopyOutByteArray(offset + Consts.SampleNumbersForAllNotes, 96); } }
        public byte[] PointsOfVolumeEnvelope { get { return filedata.CopyOutByteArray(offset + Consts.PointsOfVolumeEnvelope, 48); } }
        public byte[] PointsOfPanningEnvelope { get { return filedata.CopyOutByteArray(offset + Consts.PointsOfPanningEnvelope, 48); } }
        public byte NumberOfVolumePoints { get { return filedata[offset + Consts.NumberOfVolumePoints]; } }
        public byte NumberOfPanningPoints { get { return filedata[offset + Consts.NumberOfPanningPoints]; } }
        public byte VolumeSustainPoint { get { return filedata[offset + Consts.VolumeSustainPoint]; } }
        public byte VolumeLoopStartPoint { get { return filedata[offset + Consts.VolumeLoopStartPoint]; } }
        public byte VolumeLoopEndPoint { get { return filedata[offset + Consts.VolumeLoopEndPoint]; } }
        public byte PanningSustainPoint { get { return filedata[offset + Consts.PanningSustainPoint]; } }
        public byte PanningLoopStartPoint { get { return filedata[offset + Consts.PanningLoopStartPoint]; } }
        public byte PanningLoopEndPoint { get { return filedata[offset + Consts.PanningLoopEndPoint]; } }
        public byte VolumeType { get { return filedata[offset + Consts.VolumeType]; } }
        public byte PanningType { get { return filedata[offset + Consts.PanningType]; } }
        public byte VibratoType { get { return filedata[offset + Consts.VibratoType]; } }
        public byte VibratoSweep { get { return filedata[offset + Consts.VibratoSweep]; } }
        public byte VibratoDepth { get { return filedata[offset + Consts.VibratoDepth]; } }
        public byte VibratoRate { get { return filedata[offset + Consts.VibratoRate]; } }
        public byte VolumeFadeout { get { return filedata[offset + Consts.VolumeFadeout]; } }
    }
}
