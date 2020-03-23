using System;
using System.Collections.Generic;
using System.Text;

namespace TrackConv
{
    static class XMEffects
    {
        public static Dictionary<string, string> xmEffects = new Dictionary<string, string>()
        {
            ["0xy"] = "Arpeggio",
            ["1xx"] = "Portamento Up",
            ["2xx"] = "Portamento Down",
            ["3xx"] = "Tone Portamento",
            ["4xy"] = "Vibrato",
            ["5xy"] = "Volume Slide + Tone Portamento",
            ["6xy"] = "Volume Slide + Vibrato",
            ["7xy"] = "Tremolo",
            ["8xx"] = "Set Panning",
            ["9xx"] = "Sample Offset",
            ["Axy"] = "Volume Slide",
            ["Bxx"] = "Position Jump",
            ["Cxx"] = "Set Volume",
            ["Dxx"] = "Pattern Break",
            ["E1x"] = "Fine Portamento Up",
            ["E2x"] = "Fine Portamento Down",
            ["E3x"] = "Glissando Control",
            ["E4x"] = "Set Vibrato Waveform",
            ["E5x"] = "Set Finetune",
            ["E60"] = "Pattern Loop Start",
            ["E6x"] = "Pattern Loop",
            ["E7x"] = "Set Tremolo Waveform",
            ["E8x"] = "Set Panning",
            ["E9x"] = "Retrigger",
            ["EAx"] = "Fine Volume Slide Up",
            ["EBx"] = "Fine Volume Slide Down",
            ["ECx"] = "Note Cut",
            ["EDx"] = "Note Delay",
            ["EEx"] = "Pattern Delay",
            ["EFx"] = "Set Active Macro",
            ["Fxx"] = "Set Speed / Tempo",
            ["Gxx"] = "Set Global Volume",
            ["Hxy"] = "Global Volume Slide",
            ["Kxx"] = "Key Off",
            ["Lxx"] = "Set Envelope Position",
            ["Pxy"] = "Panning Slide",
            ["Rxy"] = "Retrigger",
            ["Txy"] = "Tremor",
            ["X1x"] = "Extra Fine Portamento Up",
            ["X2x"] = "Extra Fine Portamento Down",
            ["X5x"] = "Set Panbrello Waveform",
            ["X6x"] = "Fine Pattern Delay",
            ["X9x"] = "Sound Control",
            ["XAx"] = "High Offset",
            ["Yxy"] = "Panbrello",
            ["Zxx"] = "MIDI Macro",
            ["\\xx"] = "Smooth MIDI Macro",
        };
    }


}
