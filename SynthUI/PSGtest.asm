 processor 6502
	org $1000
	; Starting new memory block at $1000
MyProgram
	jmp block1
SCF_hex		dc.b	48
	dc.b	49
	dc.b	50
	dc.b	51
	dc.b	52
	dc.b	53
	dc.b	54
	dc.b	55
	dc.b	56
	dc.b	57
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	0
PSG_PSGLastState	dc.b	 
	org PSG_PSGLastState+64
PSG_PSGNoteTable	dc.w $02b, $02d, $030, $033, $036, $039, $03c, $040
	dc.w $044, $048, $04c, $051, $055, $05a, $060, $065
	dc.w $06b, $072, $079, $080, $087, $08f, $098, $0a1
	dc.w $0ab, $0b5, $0bf, $0cb, $0d7, $0e4, $0f1, $0100
	dc.w $010f, $011f, $0130, $0142, $0155, $0169, $017f, $0196
	dc.w $01ae, $01c7, $01e2, $01ff, $021e, $023e, $0260, $0284
	dc.w $02aa, $02d3, $02fe, $032b, $035c, $038f, $03c5, $03fe
	dc.w $043b, $047b, $04c0, $0508, $0555, $05a6, $05fc, $0657
	dc.w $06b7, $071e, $078a, $07fd, $0876, $08f7, $097f, $0a10
	dc.w $0aa9, $0b4c, $0bf7, $0cae, $0d6f, $0e3b, $0f14, $0ff9
	dc.w $010ec, $011ee, $012ff, $01420, $01552, $01697, $017ef, $0195b
	dc.w $01add, $01c76, $01e27, $01ff2, $021d9, $023dc, $025fe, $02840
	dc.w $02aa5, $02d2e, $02fde, $032b6, $035ba, $038ec, $03c4f, $03fe5
	dc.w $043b1, $047b8, $04bfc, $05080, $0554a, $05a5c, $05fbc, $0656d
	dc.w $06b75, $071d9, $0789e, $07fca, $08763, $08f70, $097f7, $0a101
	dc.w $0aa93, $0b4b8, $0bf77, $0cada, $0d6ea, $0e3b1, $0f13b, $0ff93
	dc.w $02b, $02d, $030, $033, $036, $039, $03c, $040
	dc.w $044, $048, $04c, $051, $055, $05b, $060, $066
	dc.w $06c, $072, $079, $080, $088, $090, $098, $0a1
	dc.w $0ab, $0b5, $0c0, $0cb, $0d7, $0e4, $0f2, $0100
	dc.w $010f, $011f, $0130, $0143, $0156, $016a, $0180, $0196
	dc.w $01af, $01c8, $01e3, $0200, $021f, $023f, $0261, $0285
	dc.w $02ac, $02d4, $02ff, $032d, $035d, $0390, $03c7, $0400
	dc.w $043d, $047e, $04c2, $050a, $0557, $05a8, $05fe, $065a
	dc.w $06ba, $0721, $078d, $0800, $087a, $08fb, $0984, $0a15
	dc.w $0aae, $0b51, $0bfd, $0cb3, $0d75, $0e42, $0f1b, $01001
	dc.w $010f4, $011f6, $01308, $01429, $0155c, $016a1, $017fa, $01967
	dc.w $01aea, $01c83, $01e35, $02001, $021e8, $023ed, $0260f, $02853
	dc.w $02ab9, $02d43, $02ff4, $032ce, $035d3, $03907, $03c6b, $04002
	dc.w $043d1, $047d9, $04c1f, $050a6, $05571, $05a86, $05fe8, $0659c
	dc.w $06ba6, $0720d, $078d5, $08005, $087a2, $08fb2, $0983e, $0a14b
	dc.w $0aae2, $0b50c, $0bfd0, $0cb38, $0d74d, $0e41a, $0f1ab, $00
	dc.w $02b, $02d, $030, $033, $036, $039, $03d, $040
	dc.w $044, $048, $04c, $051, $056, $05b, $060, $066
	dc.w $06c, $072, $079, $080, $088, $090, $099, $0a2
	dc.w $0ab, $0b5, $0c0, $0cc, $0d8, $0e5, $0f2, $0100
	dc.w $0110, $0120, $0131, $0143, $0156, $016b, $0180, $0197
	dc.w $01af, $01c9, $01e4, $0201, $0220, $0240, $0262, $0286
	dc.w $02ad, $02d5, $0301, $032e, $035f, $0392, $03c8, $0402
	dc.w $043f, $0480, $04c4, $050d, $055a, $05ab, $0601, $065d
	dc.w $06be, $0724, $0791, $0804, $087e, $08ff, $0988, $0a19
	dc.w $0ab3, $0b56, $0c03, $0cb9, $0d7b, $0e48, $0f22, $01008
	dc.w $010fc, $011ff, $01311, $01433, $01566, $016ac, $01805, $01973
	dc.w $01af6, $01c90, $01e43, $02010, $021f8, $023fd, $02621, $02865
	dc.w $02acc, $02d58, $0300a, $032e5, $035ec, $03921, $03c87, $04020
	dc.w $043f0, $047fa, $04c42, $050cb, $05599, $05ab0, $06014, $065cb
	dc.w $06bd8, $07242, $0790d, $08040, $087e0, $08ff5, $09884, $0a196
	dc.w $0ab31, $0b55f, $0c028, $0cb96, $0d7b1, $0e484, $0f21b, $00
	dc.w $02b, $02d, $030, $033, $036, $039, $03d, $040
	dc.w $044, $048, $04c, $051, $056, $05b, $060, $066
	dc.w $06c, $072, $079, $080, $088, $090, $099, $0a2
	dc.w $0ac, $0b6, $0c1, $0cc, $0d8, $0e5, $0f3, $0101
	dc.w $0110, $0120, $0132, $0144, $0157, $016b, $0181, $0198
	dc.w $01b0, $01ca, $01e5, $0202, $0220, $0241, $0263, $0288
	dc.w $02ae, $02d7, $0302, $0330, $0360, $0394, $03ca, $0404
	dc.w $0441, $0482, $04c6, $050f, $055c, $05ae, $0604, $0660
	dc.w $06c1, $0727, $0794, $0808, $0882, $0903, $098d, $0a1e
	dc.w $0ab8, $0b5b, $0c08, $0cbf, $0d81, $0e4f, $0f29, $0100f
	dc.w $01104, $01207, $01319, $0143c, $01570, $016b6, $01810, $0197e
	dc.w $01b03, $01c9e, $01e51, $0201f, $02208, $0240e, $02633, $02878
	dc.w $02ae0, $02d6d, $03020, $032fd, $03605, $0393b, $03ca3, $0403e
	dc.w $04410, $0481c, $04c65, $050f0, $055c0, $05ada, $06041, $065fa
	dc.w $06c0a, $07277, $07945, $0807b, $0881f, $09037, $098cb, $0a1e0
	dc.w $0ab81, $0b5b3, $0c081, $0cbf4, $0d814, $0e4ee, $0f28a, $00
	dc.w $02b, $02e, $030, $033, $036, $039, $03d, $040
	dc.w $044, $048, $04d, $051, $056, $05b, $060, $066
	dc.w $06c, $073, $079, $081, $088, $090, $099, $0a2
	dc.w $0ac, $0b6, $0c1, $0cc, $0d8, $0e5, $0f3, $0101
	dc.w $0111, $0121, $0132, $0144, $0158, $016c, $0182, $0199
	dc.w $01b1, $01cb, $01e6, $0203, $0221, $0242, $0264, $0289
	dc.w $02af, $02d8, $0303, $0331, $0362, $0395, $03cc, $0406
	dc.w $0443, $0484, $04c9, $0511, $055e, $05b0, $0607, $0663
	dc.w $06c4, $072b, $0798, $080b, $0886, $0908, $0991, $0a23
	dc.w $0abd, $0b60, $0c0e, $0cc5, $0d88, $0e55, $0f30, $01017
	dc.w $0110c, $0120f, $01322, $01445, $0157a, $016c1, $0181b, $0198a
	dc.w $01b0f, $01cab, $01e5f, $0202e, $02218, $0241e, $02644, $0288b
	dc.w $02af4, $02d82, $03037, $03314, $0361e, $03956, $03cbf, $0405b
	dc.w $0442f, $0483d, $04c89, $05116, $055e8, $05b04, $0606d, $06629
	dc.w $06c3c, $072ac, $0797d, $080b7, $0885e, $0907a, $09911, $0a22b
	dc.w $0abd0, $0b607, $0c0da, $0cc52, $0d878, $0e557, $0f2fb, $00
	dc.w $02b, $02e, $030, $033, $036, $039, $03d, $040
	dc.w $044, $048, $04d, $051, $056, $05b, $061, $066
	dc.w $06c, $073, $07a, $081, $089, $091, $099, $0a2
	dc.w $0ac, $0b6, $0c1, $0cd, $0d9, $0e6, $0f3, $0102
	dc.w $0111, $0121, $0133, $0145, $0158, $016d, $0182, $0199
	dc.w $01b2, $01cc, $01e7, $0204, $0222, $0243, $0265, $028a
	dc.w $02b0, $02d9, $0305, $0333, $0363, $0397, $03ce, $0408
	dc.w $0445, $0486, $04cb, $0514, $0561, $05b3, $060a, $0666
	dc.w $06c7, $072e, $079b, $080f, $088a, $090c, $0996, $0a27
	dc.w $0ac2, $0b66, $0c13, $0ccb, $0d8e, $0e5c, $0f37, $0101e
	dc.w $01114, $01218, $0132b, $0144f, $01584, $016cb, $01826, $01996
	dc.w $01b1c, $01cb8, $01e6d, $0203d, $02227, $0242f, $02656, $0289e
	dc.w $02b08, $02d97, $0304d, $0332c, $03637, $03970, $03cdb, $04079
	dc.w $0444f, $0485e, $04cac, $0513b, $05610, $05b2e, $0609a, $06658
	dc.w $06c6e, $072e1, $079b6, $080f2, $0889d, $090bd, $09958, $0a276
	dc.w $0ac1f, $0b65c, $0c133, $0ccb0, $0d8dc, $0e5c2, $0f36b, $00
	dc.w $02b, $02e, $030, $033, $036, $03a, $03d, $041
	dc.w $044, $048, $04d, $051, $056, $05b, $061, $067
	dc.w $06d, $073, $07a, $081, $089, $091, $09a, $0a3
	dc.w $0ac, $0b7, $0c2, $0cd, $0d9, $0e6, $0f4, $0102
	dc.w $0112, $0122, $0133, $0146, $0159, $016d, $0183, $019a
	dc.w $01b3, $01cc, $01e8, $0205, $0223, $0244, $0266, $028b
	dc.w $02b2, $02db, $0306, $0334, $0365, $0399, $03cf, $0409
	dc.w $0447, $0488, $04cd, $0516, $0563, $05b5, $060c, $0668
	dc.w $06ca, $0731, $079f, $0813, $088e, $0910, $099a, $0a2c
	dc.w $0ac7, $0b6b, $0c19, $0cd1, $0d94, $0e63, $0f3e, $01026
	dc.w $0111c, $01220, $01334, $01458, $0158e, $016d6, $01832, $019a2
	dc.w $01b28, $01cc5, $01e7b, $0204b, $02237, $02440, $02668, $028b0
	dc.w $02b1c, $02dac, $03063, $03344, $03650, $0398b, $03cf7, $04097
	dc.w $0446e, $04880, $04ccf, $05161, $05637, $05b58, $060c6, $06688
	dc.w $06ca0, $07316, $079ee, $0812e, $088dc, $09100, $0999f, $0a2c1
	dc.w $0ac6f, $0b6b0, $0c18d, $0cd0f, $0d941, $0e62c, $0f3dc, $00
	dc.w $02b, $02e, $030, $033, $036, $03a, $03d, $041
	dc.w $045, $049, $04d, $052, $056, $05c, $061, $067
	dc.w $06d, $073, $07a, $081, $089, $091, $09a, $0a3
	dc.w $0ad, $0b7, $0c2, $0cd, $0da, $0e7, $0f4, $0103
	dc.w $0112, $0123, $0134, $0146, $0159, $016e, $0184, $019b
	dc.w $01b3, $01cd, $01e9, $0206, $0224, $0245, $0268, $028c
	dc.w $02b3, $02dc, $0308, $0336, $0367, $039a, $03d1, $040b
	dc.w $0449, $048a, $04cf, $0518, $0566, $05b8, $060f, $066b
	dc.w $06cd, $0735, $07a2, $0817, $0892, $0914, $099e, $0a31
	dc.w $0acc, $0b70, $0c1e, $0cd7, $0d9a, $0e69, $0f45, $0102d
	dc.w $01123, $01228, $0133d, $01462, $01598, $016e1, $0183d, $019ae
	dc.w $01b35, $01cd3, $01e8a, $0205a, $02247, $02451, $02679, $028c3
	dc.w $02b30, $02dc1, $0307a, $0335c, $03669, $039a6, $03d13, $040b5
	dc.w $0448e, $048a1, $04cf3, $05186, $0565f, $05b82, $060f3, $066b7
	dc.w $06cd3, $0734b, $07a26, $0816a, $0891c, $09143, $099e6, $0a30d
	dc.w $0acbf, $0b704, $0c1e6, $0cd6e, $0d9a5, $0e696, $0f44c, $00
	dc.w $02b, $02e, $031, $033, $037, $03a, $03d, $041
	dc.w $045, $049, $04d, $052, $057, $05c, $061, $067
	dc.w $06d, $074, $07a, $082, $089, $092, $09a, $0a3
	dc.w $0ad, $0b7, $0c2, $0ce, $0da, $0e7, $0f5, $0103
	dc.w $0113, $0123, $0134, $0147, $015a, $016f, $0185, $019c
	dc.w $01b4, $01ce, $01e9, $0207, $0225, $0246, $0269, $028d
	dc.w $02b4, $02dd, $0309, $0337, $0368, $039c, $03d3, $040d
	dc.w $044b, $048c, $04d1, $051b, $0568, $05bb, $0612, $066e
	dc.w $06d0, $0738, $07a6, $081a, $0896, $0918, $09a3, $0a36
	dc.w $0ad1, $0b76, $0c24, $0cdd, $0da1, $0e70, $0f4c, $01035
	dc.w $0112b, $01231, $01346, $0146b, $015a2, $016eb, $01848, $019ba
	dc.w $01b41, $01ce0, $01e98, $02069, $02257, $02461, $0268b, $028d6
	dc.w $02b44, $02dd6, $03090, $03373, $03682, $039c0, $03d2f, $040d3
	dc.w $044ae, $048c3, $04d17, $051ac, $05687, $05bad, $06120, $066e7
	dc.w $06d05, $07380, $07a5f, $081a5, $0895b, $09186, $09a2d, $0a358
	dc.w $0ad0f, $0b759, $0c240, $0cdcd, $0da0a, $0e701, $0f4bd, $00
	dc.w $02b, $02e, $031, $034, $037, $03a, $03d, $041
	dc.w $045, $049, $04d, $052, $057, $05c, $061, $067
	dc.w $06d, $074, $07b, $082, $08a, $092, $09a, $0a4
	dc.w $0ad, $0b8, $0c3, $0ce, $0da, $0e7, $0f5, $0104
	dc.w $0113, $0124, $0135, $0147, $015b, $016f, $0185, $019c
	dc.w $01b5, $01cf, $01ea, $0208, $0226, $0247, $026a, $028f
	dc.w $02b5, $02df, $030a, $0339, $036a, $039e, $03d5, $040f
	dc.w $044d, $048e, $04d4, $051d, $056b, $05bd, $0615, $0671
	dc.w $06d3, $073b, $07a9, $081e, $089a, $091d, $09a7, $0a3a
	dc.w $0ad6, $0b7b, $0c2a, $0ce3, $0da7, $0e77, $0f53, $0103c
	dc.w $01133, $01239, $0134f, $01474, $015ac, $016f6, $01853, $019c6
	dc.w $01b4e, $01ced, $01ea6, $02078, $02267, $02472, $0269d, $028e9
	dc.w $02b58, $02deb, $030a6, $0338b, $0369c, $039db, $03d4c, $040f1
	dc.w $044cd, $048e5, $04d3a, $051d2, $056af, $05bd7, $0614d, $06716
	dc.w $06d37, $073b6, $07a97, $081e1, $0899b, $091c9, $09a74, $0a3a4
	dc.w $0ad5f, $0b7ae, $0c29a, $0ce2c, $0da6f, $0e76c, $0f52f, $00
	dc.w $02b, $02e, $031, $034, $037, $03a, $03d, $041
	dc.w $045, $049, $04d, $052, $057, $05c, $061, $067
	dc.w $06d, $074, $07b, $082, $08a, $092, $09b, $0a4
	dc.w $0ae, $0b8, $0c3, $0cf, $0db, $0e8, $0f6, $0104
	dc.w $0114, $0124, $0135, $0148, $015b, $0170, $0186, $019d
	dc.w $01b6, $01d0, $01eb, $0208, $0227, $0248, $026b, $0290
	dc.w $02b7, $02e0, $030c, $033a, $036b, $039f, $03d7, $0411
	dc.w $044f, $0490, $04d6, $051f, $056d, $05c0, $0618, $0674
	dc.w $06d7, $073f, $07ad, $0822, $089e, $0921, $09ac, $0a3f
	dc.w $0adb, $0b80, $0c2f, $0ce9, $0dad, $0e7d, $0f5a, $01044
	dc.w $0113b, $01242, $01357, $0147e, $015b6, $01700, $0185e, $019d1
	dc.w $01b5a, $01cfb, $01eb4, $02087, $02277, $02483, $026af, $028fc
	dc.w $02b6c, $02e01, $030bd, $033a3, $036b5, $039f6, $03d68, $0410f
	dc.w $044ed, $04906, $04d5e, $051f8, $056d7, $05c01, $0617a, $06746
	dc.w $06d6a, $073eb, $07ad0, $0821e, $089da, $0920d, $09abc, $0a3ef
	dc.w $0adaf, $0b803, $0c2f4, $0ce8c, $0dad4, $0e7d7, $0f5a0, $00
	dc.w $02b, $02e, $031, $034, $037, $03a, $03e, $041
	dc.w $045, $049, $04e, $052, $057, $05c, $062, $067
	dc.w $06e, $074, $07b, $082, $08a, $092, $09b, $0a4
	dc.w $0ae, $0b8, $0c3, $0cf, $0db, $0e8, $0f6, $0105
	dc.w $0114, $0125, $0136, $0148, $015c, $0171, $0187, $019e
	dc.w $01b6, $01d1, $01ec, $0209, $0228, $0249, $026c, $0291
	dc.w $02b8, $02e1, $030d, $033c, $036d, $03a1, $03d8, $0413
	dc.w $0451, $0493, $04d8, $0522, $0570, $05c3, $061a, $0677
	dc.w $06da, $0742, $07b1, $0826, $08a2, $0925, $09b0, $0a44
	dc.w $0ae0, $0b85, $0c35, $0cef, $0db4, $0e84, $0f61, $0104b
	dc.w $01143, $0124a, $01360, $01487, $015c0, $0170b, $0186a, $019dd
	dc.w $01b67, $01d08, $01ec2, $02096, $02286, $02494, $026c1, $0290f
	dc.w $02b80, $02e16, $030d4, $033bb, $036ce, $03a11, $03d84, $0412d
	dc.w $0450d, $04928, $04d82, $0521e, $05700, $05c2c, $061a7, $06776
	dc.w $06d9c, $07421, $07b09, $0825a, $08a1a, $09250, $09b03, $0a43b
	dc.w $0adff, $0b858, $0c34e, $0ceeb, $0db39, $0e842, $0f612, $00
	dc.w $02c, $02e, $031, $034, $037, $03a, $03e, $041
	dc.w $045, $049, $04e, $052, $057, $05c, $062, $068
	dc.w $06e, $074, $07b, $083, $08a, $093, $09b, $0a5
	dc.w $0ae, $0b9, $0c4, $0cf, $0dc, $0e9, $0f7, $0105
	dc.w $0115, $0125, $0137, $0149, $015d, $0171, $0187, $019f
	dc.w $01b7, $01d1, $01ed, $020a, $0229, $024a, $026d, $0292
	dc.w $02b9, $02e3, $030f, $033d, $036e, $03a3, $03da, $0415
	dc.w $0453, $0495, $04da, $0524, $0572, $05c5, $061d, $067a
	dc.w $06dd, $0745, $07b4, $0829, $08a6, $0929, $09b5, $0a48
	dc.w $0ae5, $0b8b, $0c3b, $0cf5, $0dba, $0e8b, $0f68, $01053
	dc.w $0114b, $01252, $01369, $01491, $015ca, $01716, $01875, $019e9
	dc.w $01b74, $01d16, $01ed0, $020a5, $02296, $024a5, $026d3, $02922
	dc.w $02b94, $02e2b, $030ea, $033d3, $036e8, $03a2b, $03da1, $0414b
	dc.w $0452d, $0494a, $04da6, $05244, $05728, $05c57, $061d4, $067a5
	dc.w $06dcf, $07457, $07b42, $08296, $08a5a, $09294, $09b4b, $0a487
	dc.w $0ae50, $0b8ad, $0c3a8, $0cf4b, $0db9e, $0e8ad, $0f683, $00
	dc.w $02c, $02e, $031, $034, $037, $03a, $03e, $041
	dc.w $045, $049, $04e, $052, $057, $05d, $062, $068
	dc.w $06e, $075, $07b, $083, $08b, $093, $09c, $0a5
	dc.w $0af, $0b9, $0c4, $0d0, $0dc, $0e9, $0f7, $0106
	dc.w $0115, $0126, $0137, $014a, $015d, $0172, $0188, $019f
	dc.w $01b8, $01d2, $01ee, $020b, $022a, $024b, $026e, $0293
	dc.w $02bb, $02e4, $0310, $033f, $0370, $03a4, $03dc, $0417
	dc.w $0455, $0497, $04dd, $0527, $0575, $05c8, $0620, $067d
	dc.w $06e0, $0749, $07b8, $082d, $08aa, $092d, $09b9, $0a4d
	dc.w $0aea, $0b90, $0c40, $0cfb, $0dc0, $0e92, $0f6f, $0105a
	dc.w $01153, $0125b, $01372, $0149a, $015d4, $01720, $01880, $019f5
	dc.w $01b80, $01d23, $01edf, $020b5, $022a6, $024b6, $026e5, $02935
	dc.w $02ba8, $02e41, $03101, $033eb, $03701, $03a46, $03dbd, $04169
	dc.w $0454d, $0496c, $04dca, $0526a, $05750, $05c81, $06201, $067d5
	dc.w $06e02, $0748d, $07b7b, $082d2, $08a9a, $092d8, $09b93, $0a4d3
	dc.w $0aea0, $0b903, $0c403, $0cfab, $0dc04, $0e919, $0f6f5, $00
	dc.w $02c, $02e, $031, $034, $037, $03a, $03e, $042
	dc.w $045, $04a, $04e, $053, $057, $05d, $062, $068
	dc.w $06e, $075, $07c, $083, $08b, $093, $09c, $0a5
	dc.w $0af, $0b9, $0c4, $0d0, $0dc, $0ea, $0f7, $0106
	dc.w $0116, $0126, $0138, $014a, $015e, $0173, $0189, $01a0
	dc.w $01b9, $01d3, $01ef, $020c, $022b, $024c, $026f, $0294
	dc.w $02bc, $02e5, $0311, $0340, $0372, $03a6, $03de, $0418
	dc.w $0457, $0499, $04df, $0529, $0578, $05cb, $0623, $0680
	dc.w $06e3, $074c, $07bb, $0831, $08ae, $0932, $09be, $0a52
	dc.w $0aef, $0b96, $0c46, $0d01, $0dc7, $0e98, $0f76, $01062
	dc.w $0115b, $01263, $0137b, $014a4, $015de, $0172b, $0188c, $01a01
	dc.w $01b8d, $01d31, $01eed, $020c4, $022b6, $024c7, $026f7, $02948
	dc.w $02bbc, $02e56, $03117, $03403, $0371a, $03a61, $03dda, $04187
	dc.w $0456d, $0498e, $04ded, $05290, $05779, $05cac, $0622f, $06805
	dc.w $06e35, $074c2, $07bb4, $0830f, $08ada, $0931c, $09bdb, $0a51f
	dc.w $0aef1, $0b958, $0c45e, $0d00b, $0dc6a, $0e985, $0f768, $00
	dc.w $02c, $02e, $031, $034, $037, $03a, $03e, $042
	dc.w $046, $04a, $04e, $053, $058, $05d, $062, $068
	dc.w $06e, $075, $07c, $083, $08b, $093, $09c, $0a5
	dc.w $0af, $0ba, $0c5, $0d0, $0dd, $0ea, $0f8, $0107
	dc.w $0116, $0127, $0138, $014b, $015f, $0173, $0189, $01a1
	dc.w $01ba, $01d4, $01f0, $020d, $022c, $024d, $0271, $0296
	dc.w $02bd, $02e7, $0313, $0342, $0373, $03a8, $03df, $041a
	dc.w $0459, $049b, $04e1, $052b, $057a, $05cd, $0626, $0683
	dc.w $06e6, $0750, $07bf, $0835, $08b2, $0936, $09c2, $0a57
	dc.w $0af4, $0b9b, $0c4c, $0d07, $0dcd, $0e9f, $0f7e, $01069
	dc.w $01163, $0126c, $01384, $014ad, $015e8, $01736, $01897, $01a0d
	dc.w $01b9a, $01d3e, $01efb, $020d3, $022c7, $024d8, $02709, $0295b
	dc.w $02bd0, $02e6b, $0312e, $0341b, $03734, $03a7c, $03df7, $041a6
	dc.w $0458d, $049b0, $04e12, $052b6, $057a1, $05cd7, $0625c, $06835
	dc.w $06e68, $074f8, $07bed, $0834c, $08b1a, $09360, $09c23, $0a56c
	dc.w $0af42, $0b9ae, $0c4b8, $0d06b, $0dcd0, $0e9f1, $0f7da, $00
	dc.w $02c, $02f, $031, $034, $037, $03b, $03e, $042
	dc.w $046, $04a, $04e, $053, $058, $05d, $063, $068
	dc.w $06f, $075, $07c, $084, $08b, $094, $09c, $0a6
	dc.w $0b0, $0ba, $0c5, $0d1, $0dd, $0ea, $0f8, $0107
	dc.w $0117, $0127, $0139, $014b, $015f, $0174, $018a, $01a2
	dc.w $01ba, $01d5, $01f1, $020e, $022d, $024f, $0272, $0297
	dc.w $02be, $02e8, $0314, $0343, $0375, $03a9, $03e1, $041c
	dc.w $045b, $049d, $04e3, $052e, $057d, $05d0, $0629, $0686
	dc.w $06ea, $0753, $07c2, $0839, $08b6, $093a, $09c7, $0a5c
	dc.w $0af9, $0ba0, $0c51, $0d0d, $0dd3, $0ea6, $0f85, $01071
	dc.w $0116b, $01274, $0138d, $014b7, $015f2, $01740, $018a2, $01a19
	dc.w $01ba7, $01d4c, $01f0a, $020e2, $022d7, $024e9, $0271b, $0296e
	dc.w $02be5, $02e81, $03145, $03433, $0374d, $03a97, $03e13, $041c4
	dc.w $045ad, $049d2, $04e36, $052dc, $057ca, $05d02, $0628a, $06866
	dc.w $06e9b, $0752f, $07c26, $08388, $08b5a, $093a4, $09c6b, $0a5b8
	dc.w $0af93, $0ba04, $0c513, $0d0cb, $0dd36, $0ea5d, $0f84d, $00
	dc.w $02c, $02f, $031, $034, $037, $03b, $03e, $042
	dc.w $046, $04a, $04e, $053, $058, $05d, $063, $069
	dc.w $06f, $075, $07c, $084, $08c, $094, $09d, $0a6
	dc.w $0b0, $0ba, $0c5, $0d1, $0de, $0eb, $0f9, $0108
	dc.w $0117, $0128, $0139, $014c, $0160, $0175, $018b, $01a2
	dc.w $01bb, $01d6, $01f1, $020f, $022e, $0250, $0273, $0298
	dc.w $02c0, $02e9, $0316, $0345, $0376, $03ab, $03e3, $041e
	dc.w $045d, $049f, $04e6, $0530, $057f, $05d3, $062b, $0689
	dc.w $06ed, $0756, $07c6, $083c, $08ba, $093f, $09cb, $0a60
	dc.w $0afe, $0ba6, $0c57, $0d13, $0dda, $0ead, $0f8c, $01079
	dc.w $01173, $0127d, $01396, $014c1, $015fd, $0174b, $018ae, $01a25
	dc.w $01bb4, $01d59, $01f18, $020f1, $022e7, $024fa, $0272d, $02981
	dc.w $02bf9, $02e96, $0315c, $0344b, $03767, $03ab2, $03e30, $041e3
	dc.w $045cd, $049f4, $04e5a, $05303, $057f2, $05d2d, $062b7, $06896
	dc.w $06ece, $07565, $07c60, $083c5, $08b9b, $093e8, $09cb4, $0a605
	dc.w $0afe4, $0ba5a, $0c56f, $0d12c, $0dd9c, $0eaca, $0f8c0, $00
	dc.w $02c, $02f, $031, $034, $038, $03b, $03e, $042
	dc.w $046, $04a, $04e, $053, $058, $05d, $063, $069
	dc.w $06f, $076, $07d, $084, $08c, $094, $09d, $0a6
	dc.w $0b0, $0bb, $0c6, $0d2, $0de, $0eb, $0f9, $0108
	dc.w $0118, $0128, $013a, $014d, $0160, $0175, $018c, $01a3
	dc.w $01bc, $01d6, $01f2, $0210, $022f, $0251, $0274, $0299
	dc.w $02c1, $02eb, $0317, $0346, $0378, $03ad, $03e5, $0420
	dc.w $045f, $04a1, $04e8, $0533, $0582, $05d5, $062e, $068c
	dc.w $06f0, $075a, $07ca, $0840, $08be, $0943, $09d0, $0a65
	dc.w $0b03, $0bab, $0c5d, $0d19, $0de0, $0eb3, $0f93, $01080
	dc.w $0117b, $01286, $013a0, $014ca, $01607, $01756, $018b9, $01a32
	dc.w $01bc0, $01d67, $01f26, $02101, $022f7, $0250b, $0273f, $02994
	dc.w $02c0d, $02eac, $03172, $03463, $03781, $03ace, $03e4d, $04201
	dc.w $045ee, $04a16, $04e7e, $05329, $0581b, $05d58, $062e5, $068c6
	dc.w $06f01, $0759b, $07c99, $08402, $08bdc, $0942d, $09cfc, $0a652
	dc.w $0b036, $0bab0, $0c5ca, $0d18d, $0de03, $0eb36, $0f933, $00
	dc.w $02c, $02f, $032, $034, $038, $03b, $03e, $042
	dc.w $046, $04a, $04f, $053, $058, $05e, $063, $069
	dc.w $06f, $076, $07d, $084, $08c, $094, $09d, $0a7
	dc.w $0b1, $0bb, $0c6, $0d2, $0de, $0ec, $0fa, $0108
	dc.w $0118, $0129, $013b, $014d, $0161, $0176, $018c, $01a4
	dc.w $01bd, $01d7, $01f3, $0211, $0230, $0252, $0275, $029a
	dc.w $02c2, $02ec, $0319, $0348, $037a, $03af, $03e7, $0422
	dc.w $0461, $04a4, $04ea, $0535, $0584, $05d8, $0631, $068f
	dc.w $06f3, $075d, $07cd, $0844, $08c2, $0947, $09d4, $0a6a
	dc.w $0b08, $0bb0, $0c62, $0d1f, $0de7, $0eba, $0f9a, $01088
	dc.w $01184, $0128e, $013a9, $014d4, $01611, $01761, $018c5, $01a3e
	dc.w $01bcd, $01d74, $01f35, $02110, $02307, $0251c, $02751, $029a8
	dc.w $02c22, $02ec2, $03189, $0347b, $0379a, $03ae9, $03e69, $04220
	dc.w $0460e, $04a39, $04ea2, $0534f, $05844, $05d83, $06313, $068f7
	dc.w $06f35, $075d1, $07cd3, $0843f, $08c1c, $09471, $09d45, $0a69f
	dc.w $0b087, $0bb06, $0c625, $0d1ee, $0de69, $0eba3, $0f9a6, $00
	dc.w $02c, $02f, $032, $035, $038, $03b, $03f, $042
	dc.w $046, $04a, $04f, $053, $058, $05e, $063, $069
	dc.w $06f, $076, $07d, $084, $08c, $095, $09e, $0a7
	dc.w $0b1, $0bb, $0c7, $0d2, $0df, $0ec, $0fa, $0109
	dc.w $0119, $0129, $013b, $014e, $0162, $0177, $018d, $01a5
	dc.w $01be, $01d8, $01f4, $0212, $0231, $0253, $0276, $029c
	dc.w $02c3, $02ed, $031a, $0349, $037b, $03b0, $03e8, $0424
	dc.w $0463, $04a6, $04ec, $0537, $0587, $05db, $0634, $0692
	dc.w $06f7, $0760, $07d1, $0848, $08c6, $094b, $09d9, $0a6f
	dc.w $0b0e, $0bb6, $0c68, $0d25, $0ded, $0ec1, $0fa2, $01090
	dc.w $0118c, $01297, $013b2, $014dd, $0161b, $0176c, $018d0, $01a4a
	dc.w $01bda, $01d82, $01f43, $0211f, $02317, $0252d, $02763, $029bb
	dc.w $02c36, $02ed7, $031a0, $03494, $037b4, $03b04, $03e86, $0423e
	dc.w $0462f, $04a5b, $04ec7, $05376, $0586c, $05dae, $06340, $06927
	dc.w $06f68, $07608, $07d0d, $0847c, $08c5d, $094b6, $09d8d, $0a6ec
	dc.w $0b0d9, $0bb5d, $0c681, $0d24f, $0ded0, $0ec10, $0fa19, $00
	dc.w $02c, $02f, $032, $035, $038, $03b, $03f, $042
	dc.w $046, $04a, $04f, $054, $059, $05e, $063, $069
	dc.w $070, $076, $07d, $085, $08d, $095, $09e, $0a7
	dc.w $0b1, $0bc, $0c7, $0d3, $0df, $0ec, $0fb, $0109
	dc.w $0119, $012a, $013c, $014e, $0162, $0177, $018e, $01a5
	dc.w $01be, $01d9, $01f5, $0213, $0232, $0254, $0277, $029d
	dc.w $02c5, $02ef, $031b, $034b, $037d, $03b2, $03ea, $0426
	dc.w $0465, $04a8, $04ef, $053a, $0589, $05de, $0637, $0695
	dc.w $06fa, $0764, $07d4, $084c, $08ca, $0950, $09dd, $0a74
	dc.w $0b13, $0bbb, $0c6e, $0d2b, $0df3, $0ec8, $0fa9, $01097
	dc.w $01194, $0129f, $013bb, $014e7, $01625, $01776, $018dc, $01a56
	dc.w $01be7, $01d90, $01f52, $0212e, $02327, $0253f, $02776, $029ce
	dc.w $02c4b, $02eed, $031b7, $034ac, $037ce, $03b1f, $03ea3, $0425d
	dc.w $0464f, $04a7d, $04eeb, $0539c, $05895, $05dda, $0636e, $06958
	dc.w $06f9c, $0763f, $07d47, $084ba, $08c9e, $094fa, $09dd6, $0a739
	dc.w $0b12b, $0bbb3, $0c6dd, $0d2b0, $0df37, $0ec7d, $0fa8d, $00
	dc.w $02c, $02f, $032, $035, $038, $03b, $03f, $042
	dc.w $046, $04b, $04f, $054, $059, $05e, $064, $06a
	dc.w $070, $076, $07e, $085, $08d, $095, $09e, $0a8
	dc.w $0b1, $0bc, $0c7, $0d3, $0e0, $0ed, $0fb, $010a
	dc.w $011a, $012a, $013c, $014f, $0163, $0178, $018e, $01a6
	dc.w $01bf, $01da, $01f6, $0214, $0233, $0255, $0278, $029e
	dc.w $02c6, $02f0, $031d, $034c, $037e, $03b4, $03ec, $0428
	dc.w $0467, $04aa, $04f1, $053c, $058c, $05e0, $063a, $0699
	dc.w $06fd, $0767, $07d8, $084f, $08ce, $0954, $09e2, $0a78
	dc.w $0b18, $0bc1, $0c74, $0d31, $0dfa, $0ecf, $0fb0, $0109f
	dc.w $0119c, $012a8, $013c4, $014f1, $01630, $01781, $018e7, $01a62
	dc.w $01bf4, $01d9d, $01f60, $0213e, $02338, $02550, $02788, $029e2
	dc.w $02c5f, $02f03, $031ce, $034c4, $037e8, $03b3b, $03ec0, $0427b
	dc.w $0466f, $04aa0, $04f10, $053c3, $058be, $05e05, $0639c, $06989
	dc.w $06fcf, $07675, $07d80, $084f7, $08cdf, $0953f, $09e1f, $0a786
	dc.w $0b17c, $0bc0a, $0c739, $0d311, $0df9e, $0ecea, $0fb01, $00
	dc.w $02c, $02f, $032, $035, $038, $03b, $03f, $043
	dc.w $047, $04b, $04f, $054, $059, $05e, $064, $06a
	dc.w $070, $077, $07e, $085, $08d, $096, $09e, $0a8
	dc.w $0b2, $0bc, $0c8, $0d3, $0e0, $0ed, $0fb, $010a
	dc.w $011a, $012b, $013d, $0150, $0164, $0179, $018f, $01a7
	dc.w $01c0, $01db, $01f7, $0215, $0235, $0256, $027a, $029f
	dc.w $02c7, $02f2, $031e, $034e, $0380, $03b5, $03ee, $042a
	dc.w $0469, $04ac, $04f3, $053f, $058e, $05e3, $063d, $069c
	dc.w $0700, $076b, $07dc, $0853, $08d2, $0958, $09e7, $0a7d
	dc.w $0b1d, $0bc6, $0c79, $0d37, $0e00, $0ed6, $0fb7, $010a7
	dc.w $011a4, $012b1, $013cd, $014fa, $0163a, $0178c, $018f3, $01a6e
	dc.w $01c01, $01dab, $01f6f, $0214d, $02348, $02561, $0279a, $029f5
	dc.w $02c74, $02f18, $031e5, $034dd, $03801, $03b56, $03edd, $0429a
	dc.w $04690, $04ac2, $04f34, $053ea, $058e7, $05e31, $063ca, $069ba
	dc.w $07003, $076ac, $07dba, $08534, $08d20, $09584, $09e68, $0a7d4
	dc.w $0b1cf, $0bc61, $0c795, $0d373, $0e006, $0ed58, $0fb75, $00
	dc.w $02d, $02f, $032, $035, $038, $03b, $03f, $043
	dc.w $047, $04b, $04f, $054, $059, $05e, $064, $06a
	dc.w $070, $077, $07e, $085, $08d, $096, $09f, $0a8
	dc.w $0b2, $0bd, $0c8, $0d4, $0e0, $0ee, $0fc, $010b
	dc.w $011b, $012c, $013d, $0150, $0164, $0179, $0190, $01a8
	dc.w $01c1, $01dc, $01f8, $0216, $0236, $0257, $027b, $02a1
	dc.w $02c9, $02f3, $0320, $034f, $0382, $03b7, $03f0, $042c
	dc.w $046b, $04ae, $04f6, $0541, $0591, $05e6, $0640, $069f
	dc.w $0703, $076e, $07df, $0857, $08d6, $095d, $09eb, $0a82
	dc.w $0b22, $0bcc, $0c7f, $0d3d, $0e07, $0edc, $0fbf, $010ae
	dc.w $011ac, $012b9, $013d6, $01504, $01644, $01797, $018fe, $01a7b
	dc.w $01c0e, $01db9, $01f7d, $0215d, $02358, $02572, $027ac, $02a08
	dc.w $02c88, $02f2e, $031fc, $034f5, $0381b, $03b71, $03efa, $042b9
	dc.w $046b1, $04ae5, $04f59, $05411, $05910, $05e5c, $063f9, $069ea
	dc.w $07037, $076e3, $07df5, $08572, $08d61, $095ca, $09eb2, $0a821
	dc.w $0b221, $0bcb8, $0c7f1, $0d3d5, $0e06d, $0edc6, $0fbe9, $00
	dc.w $02d, $02f, $032, $035, $038, $03c, $03f, $043
	dc.w $047, $04b, $04f, $054, $059, $05f, $064, $06a
	dc.w $070, $077, $07e, $086, $08e, $096, $09f, $0a8
	dc.w $0b2, $0bd, $0c8, $0d4, $0e1, $0ee, $0fc, $010b
	dc.w $011b, $012c, $013e, $0151, $0165, $017a, $0191, $01a8
	dc.w $01c2, $01dc, $01f9, $0217, $0237, $0258, $027c, $02a2
	dc.w $02ca, $02f4, $0321, $0351, $0383, $03b9, $03f1, $042d
	dc.w $046d, $04b0, $04f8, $0543, $0594, $05e8, $0642, $06a2
	dc.w $0707, $0772, $07e3, $085b, $08da, $0961, $09f0, $0a87
	dc.w $0b27, $0bd1, $0c85, $0d43, $0e0d, $0ee3, $0fc6, $010b6
	dc.w $011b4, $012c2, $013df, $0150e, $0164e, $017a2, $0190a, $01a87
	dc.w $01c1b, $01dc6, $01f8c, $0216c, $02369, $02584, $027bf, $02a1c
	dc.w $02c9d, $02f44, $03213, $0350e, $03835, $03b8d, $03f17, $042d8
	dc.w $046d1, $04b07, $04f7e, $05438, $0593a, $05e88, $06427, $06a1b
	dc.w $0706b, $0771a, $07e2f, $085b0, $08da3, $0960f, $09efb, $0a86f
	dc.w $0b273, $0bd10, $0c84e, $0d437, $0e0d5, $0ee34, $0fc5e, $00
	dc.w $02d, $02f, $032, $035, $038, $03c, $03f, $043
	dc.w $047, $04b, $050, $054, $059, $05f, $064, $06a
	dc.w $071, $077, $07e, $086, $08e, $096, $09f, $0a9
	dc.w $0b3, $0bd, $0c9, $0d5, $0e1, $0ef, $0fd, $010c
	dc.w $011c, $012d, $013f, $0151, $0166, $017b, $0191, $01a9
	dc.w $01c2, $01dd, $01fa, $0218, $0238, $0259, $027d, $02a3
	dc.w $02cb, $02f6, $0323, $0352, $0385, $03bb, $03f3, $042f
	dc.w $046f, $04b3, $04fa, $0546, $0596, $05eb, $0645, $06a5
	dc.w $070a, $0775, $07e7, $085f, $08de, $0965, $09f4, $0a8c
	dc.w $0b2c, $0bd6, $0c8b, $0d4a, $0e14, $0eea, $0fcd, $010be
	dc.w $011bd, $012cb, $013e9, $01518, $01659, $017ad, $01915, $01a93
	dc.w $01c28, $01dd4, $01f9a, $0217b, $02379, $02595, $027d1, $02a2f
	dc.w $02cb1, $02f5a, $0322b, $03526, $0384f, $03ba8, $03f35, $042f7
	dc.w $046f2, $04b2a, $04fa2, $0545f, $05963, $05eb4, $06455, $06a4c
	dc.w $0709f, $07751, $07e69, $085ee, $08de4, $09654, $09f45, $0a8bd
	dc.w $0b2c6, $0bd67, $0c8aa, $0d499, $0e13d, $0eea2, $0fcd3, $00
	dc.w $02d, $02f, $032, $035, $038, $03c, $03f, $043
	dc.w $047, $04b, $050, $055, $05a, $05f, $065, $06a
	dc.w $071, $078, $07f, $086, $08e, $097, $0a0, $0a9
	dc.w $0b3, $0be, $0c9, $0d5, $0e2, $0ef, $0fd, $010c
	dc.w $011c, $012d, $013f, $0152, $0166, $017b, $0192, $01aa
	dc.w $01c3, $01de, $01fb, $0219, $0239, $025a, $027e, $02a4
	dc.w $02cc, $02f7, $0324, $0354, $0387, $03bc, $03f5, $0431
	dc.w $0471, $04b5, $04fc, $0548, $0599, $05ee, $0648, $06a8
	dc.w $070d, $0779, $07ea, $0863, $08e2, $096a, $09f9, $0a91
	dc.w $0b32, $0bdc, $0c90, $0d50, $0e1a, $0ef1, $0fd4, $010c5
	dc.w $011c5, $012d3, $013f2, $01521, $01663, $017b8, $01921, $01a9f
	dc.w $01c35, $01de2, $01fa9, $0218b, $02389, $025a6, $027e4, $02a43
	dc.w $02cc6, $02f70, $03242, $0353f, $03869, $03bc4, $03f52, $04316
	dc.w $04713, $04b4d, $04fc7, $05486, $0598c, $05edf, $06484, $06a7e
	dc.w $070d3, $07788, $07ea4, $0862c, $08e26, $0969a, $09f8e, $0a90b
	dc.w $0b318, $0bdbf, $0c907, $0d4fb, $0e1a5, $0ef10, $0fd47, $00
	dc.w $02d, $030, $032, $035, $039, $03c, $03f, $043
	dc.w $047, $04b, $050, $055, $05a, $05f, $065, $06b
	dc.w $071, $078, $07f, $086, $08e, $097, $0a0, $0a9
	dc.w $0b3, $0be, $0c9, $0d5, $0e2, $0ef, $0fe, $010d
	dc.w $011d, $012e, $0140, $0153, $0167, $017c, $0193, $01ab
	dc.w $01c4, $01df, $01fb, $021a, $023a, $025b, $027f, $02a5
	dc.w $02ce, $02f8, $0326, $0355, $0388, $03be, $03f7, $0433
	dc.w $0473, $04b7, $04ff, $054b, $059b, $05f1, $064b, $06ab
	dc.w $0710, $077c, $07ee, $0867, $08e6, $096e, $09fe, $0a96
	dc.w $0b37, $0be1, $0c96, $0d56, $0e21, $0ef8, $0fdc, $010cd
	dc.w $011cd, $012dc, $013fb, $0152b, $0166d, $017c3, $0192d, $01aac
	dc.w $01c42, $01df0, $01fb8, $0219a, $0239a, $025b8, $027f6, $02a56
	dc.w $02cdb, $02f86, $03259, $03557, $03883, $03be0, $03f6f, $04335
	dc.w $04734, $04b70, $04fec, $054ad, $059b6, $05f0b, $064b2, $06aaf
	dc.w $07107, $077bf, $07ede, $0866a, $08e68, $096df, $09fd8, $0a959
	dc.w $0b36b, $0be16, $0c964, $0d55e, $0e20e, $0ef7f, $0fdbd, $00
	dc.w $02d, $030, $032, $035, $039, $03c, $040, $043
	dc.w $047, $04c, $050, $055, $05a, $05f, $065, $06b
	dc.w $071, $078, $07f, $087, $08f, $097, $0a0, $0aa
	dc.w $0b4, $0be, $0ca, $0d6, $0e2, $0f0, $0fe, $010d
	dc.w $011d, $012e, $0140, $0153, $0167, $017d, $0194, $01ac
	dc.w $01c5, $01e0, $01fc, $021b, $023b, $025d, $0281, $02a7
	dc.w $02cf, $02fa, $0327, $0357, $038a, $03c0, $03f9, $0435
	dc.w $0475, $04b9, $0501, $054d, $059e, $05f3, $064e, $06ae
	dc.w $0714, $077f, $07f2, $086a, $08eb, $0972, $0a02, $0a9a
	dc.w $0b3c, $0be7, $0c9c, $0d5c, $0e27, $0eff, $0fe3, $010d5
	dc.w $011d5, $012e5, $01404, $01535, $01678, $017ce, $01938, $01ab8
	dc.w $01c4f, $01dfe, $01fc6, $021aa, $023aa, $025c9, $02809, $02a6a
	dc.w $02cf0, $02f9c, $03270, $03570, $0389e, $03bfb, $03f8c, $04354
	dc.w $04755, $04b93, $05011, $054d4, $059df, $05f37, $064e1, $06ae0
	dc.w $0713b, $077f7, $07f19, $086a8, $08eaa, $09725, $0a022, $0a9a8
	dc.w $0b3be, $0be6e, $0c9c1, $0d5c0, $0e276, $0efee, $0fe32, $00
	dc.w $02d, $030, $033, $036, $039, $03c, $040, $043
	dc.w $047, $04c, $050, $055, $05a, $05f, $065, $06b
	dc.w $071, $078, $07f, $087, $08f, $097, $0a0, $0aa
	dc.w $0b4, $0bf, $0ca, $0d6, $0e3, $0f0, $0ff, $010e
	dc.w $011e, $012f, $0141, $0154, $0168, $017e, $0194, $01ac
	dc.w $01c6, $01e1, $01fd, $021c, $023c, $025e, $0282, $02a8
	dc.w $02d0, $02fb, $0328, $0359, $038b, $03c1, $03fb, $0437
	dc.w $0477, $04bb, $0503, $0550, $05a1, $05f6, $0651, $06b1
	dc.w $0717, $0783, $07f5, $086e, $08ef, $0977, $0a07, $0a9f
	dc.w $0b41, $0bec, $0ca2, $0d62, $0e2e, $0f06, $0fea, $010dd
	dc.w $011dd, $012ed, $0140e, $0153f, $01682, $017d9, $01944, $01ac4
	dc.w $01c5c, $01e0c, $01fd5, $021ba, $023bb, $025db, $0281b, $02a7e
	dc.w $02d04, $02fb2, $03288, $03589, $038b8, $03c17, $03faa, $04373
	dc.w $04776, $04bb6, $05036, $054fb, $05a09, $05f63, $0650f, $06b12
	dc.w $07170, $0782e, $07f54, $086e6, $08eec, $0976b, $0a06c, $0a9f6
	dc.w $0b411, $0bec6, $0ca1f, $0d623, $0e2df, $0f05d, $0fea8, $00
	dc.w $02d, $030, $033, $036, $039, $03c, $040, $044
	dc.w $048, $04c, $050, $055, $05a, $060, $065, $06b
	dc.w $072, $078, $080, $087, $08f, $098, $0a1, $0aa
	dc.w $0b4, $0bf, $0ca, $0d7, $0e3, $0f1, $0ff, $010e
	dc.w $011e, $012f, $0141, $0155, $0169, $017e, $0195, $01ad
	dc.w $01c7, $01e2, $01fe, $021d, $023d, $025f, $0283, $02a9
	dc.w $02d2, $02fc, $032a, $035a, $038d, $03c3, $03fc, $0439
	dc.w $0479, $04be, $0506, $0552, $05a3, $05f9, $0654, $06b4
	dc.w $071a, $0786, $07f9, $0872, $08f3, $097b, $0a0b, $0aa4
	dc.w $0b46, $0bf2, $0ca8, $0d68, $0e34, $0f0d, $0ff2, $010e5
	dc.w $011e6, $012f6, $01417, $01549, $0168d, $017e4, $01950, $01ad1
	dc.w $01c69, $01e19, $01fe4, $021c9, $023cb, $025ec, $0282e, $02a91
	dc.w $02d19, $02fc8, $0329f, $035a2, $038d2, $03c33, $03fc7, $04392
	dc.w $04797, $04bd9, $0505b, $05522, $05a32, $05f8f, $0653e, $06b43
	dc.w $071a4, $07866, $07f8f, $08724, $08f2e, $097b1, $0a0b6, $0aa45
	dc.w $0b465, $0bf1f, $0ca7c, $0d686, $0e348, $0f0cc, $0ff1d, $00
	dc.w 
PSG_PSGNote	dc.w	
Ticks_ti0 = $a0
Ticks_ti1 = $a1
Ticks_ti2 = $a2
Ticks_ti = $a0
Ticks_lastti	dc.w	
Ticks_lastti0	dc.b	
X16Mouse_Buttons	dc.b	
X16Mouse_X	dc.w	
X16Mouse_Y	dc.w	
X16Mouse_Xch	dc.b	
X16Mouse_Ych	dc.b	
Input_key	dc.b	
Input_note	dc.b	
Input_octave	dc.b	
Default_irq_handler	= $22
i	dc.w	
	; ***********  Defining procedure : init16x8mul
	;    Procedure type : Built-in function
	;    Requires initialization : no
mul16x8_num1Hi = $4c
mul16x8_num1 = $4e
mul16x8_num2 = $50
mul16x8_procedure
	lda #$00
	ldy #$00
	beq mul16x8_enterLoop
mul16x8_doAdd
	clc
	adc mul16x8_num1
	tax
	tya
	adc mul16x8_num1Hi
	tay
	txa
mul16x8_loop
	asl mul16x8_num1
	rol mul16x8_num1Hi
mul16x8_enterLoop  ; accumulating multiply entry point (enter with .A=lo, .Y=hi)
	lsr mul16x8_num2
	bcs mul16x8_doAdd
	bne mul16x8_loop
	rts
	; ***********  Defining procedure : initeightbitmul
	;    Procedure type : Built-in function
	;    Requires initialization : no
multiplier = $4c
multiplier_a = $4e
multiply_eightbit
	cpx #$00
	beq mul_end
	dex
	stx $4e
	lsr
	sta multiplier
	lda #$00
	ldx #$08
mul_loop
	bcc mul_skip
mul_mod
	adc multiplier_a
mul_skip
	ror
	ror multiplier
	dex
	bne mul_loop
	ldx multiplier
	rts
mul_end
	txa
	rts
initeightbitmul_multiply_eightbit2
	rts
	; ***********  Defining procedure : SCF_DrawChar
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawChar_SCF_X	dc.b	
localVariable_SCF_DrawChar_SCF_Y	dc.b	
localVariable_SCF_DrawChar_SCF_char	dc.b	
localVariable_SCF_DrawChar_SCF_color	dc.b	
SCF_DrawChar_block3
SCF_DrawChar
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	lda localVariable_SCF_DrawChar_SCF_X
	asl
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f22
	lda #$20
	; Calling storevariable
	sta $9f22
	; Assigning memory location
	; Assigning single variable : $9f21
	lda localVariable_SCF_DrawChar_SCF_Y
	; Calling storevariable
	sta $9f21
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawChar_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawChar_SCF_char
	; Calling storevariable
	sta $9f23
	; Assigning memory location
	; Assigning single variable : $9f20
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawChar_SCF_X
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawChar_SCF_color
	; Calling storevariable
	sta $9f23
	rts
	; ***********  Defining procedure : SCF_DrawBox
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawBox_SCF_x	dc.b	
localVariable_SCF_DrawBox_SCF_y	dc.b	
localVariable_SCF_DrawBox_SCF_posX	dc.b	
localVariable_SCF_DrawBox_SCF_posY	dc.b	
localVariable_SCF_DrawBox_SCF_Width	dc.b	
localVariable_SCF_DrawBox_SCF_Height	dc.b	
localVariable_SCF_DrawBox_SCF_color	dc.b	
SCF_DrawBox_block4
SCF_DrawBox
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_x
	lda localVariable_SCF_DrawBox_SCF_posX
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_x
SCF_DrawBox_forloop5
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_y
	lda localVariable_SCF_DrawBox_SCF_posY
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_y
SCF_DrawBox_forloop7
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	lda localVariable_SCF_DrawBox_SCF_x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_SCF_DrawBox_SCF_y
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda #$a0
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	lda localVariable_SCF_DrawBox_SCF_color
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	; IS ONPAGE
	inc localVariable_SCF_DrawBox_SCF_y
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBox_SCF_posY
	clc
	adc localVariable_SCF_DrawBox_SCF_Height
	 ; end add / sub var with constant
	cmp localVariable_SCF_DrawBox_SCF_y ;keep
	bne SCF_DrawBox_forloop7
SCF_DrawBox_loopdone10: ;keep
	; IS ONPAGE
	inc localVariable_SCF_DrawBox_SCF_x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBox_SCF_posX
	clc
	adc localVariable_SCF_DrawBox_SCF_Width
	 ; end add / sub var with constant
	cmp localVariable_SCF_DrawBox_SCF_x ;keep
	bne SCF_DrawBox_forloop5
SCF_DrawBox_loopdone16: ;keep
	rts
	; ***********  Defining procedure : PSG_SetReg
	;    Procedure type : User-defined procedure
localVariable_PSG_SetReg_PSG_reg	dc.b	
localVariable_PSG_SetReg_PSG_data	dc.b	
PSG_SetReg_block17
PSG_SetReg
	; Assigning single variable : localVariable_PSG_SetReg_PSG_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_PSG_SetReg_PSG_reg
	and #$3f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_PSG_SetReg_PSG_reg
	; Assigning single variable : PSG_PSGLastState
	; Store Variable simplified optimization : right-hand term is pure
	tax ; optimized x, look out for bugs L22 ORG 	ldx localVariable_PSG_SetReg_PSG_reg ; optimized, look out for bugs
	lda localVariable_PSG_SetReg_PSG_data
	sta PSG_PSGLastState,x
	
; //$1F9C0 - $1F9FF 	PSG registers
	; Assigning single variable : localVariable_PSG_SetReg_PSG_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_PSG_SetReg_PSG_reg
	ora #$c0
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_PSG_SetReg_PSG_reg
	
; //+$C0;
	; Assigning memory location
	; Assigning single variable : $9f22
	lda #$1
	; Calling storevariable
	sta $9f22
	; Assigning memory location
	; Assigning single variable : $9f21
	lda #$f9
	; Calling storevariable
	sta $9f21
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_PSG_SetReg_PSG_reg
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_PSG_SetReg_PSG_data
	; Calling storevariable
	sta $9f23
	rts
	; ***********  Defining procedure : PSG_SetFreq
	;    Procedure type : User-defined procedure
localVariable_PSG_SetFreq_PSG_reg	dc.b	
localVariable_PSG_SetFreq_PSG_chn	dc.b	
localVariable_PSG_SetFreq_PSG_data	dc.w	
PSG_SetFreq_block18
PSG_SetFreq
	; Assigning single variable : localVariable_PSG_SetFreq_PSG_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_PSG_SetFreq_PSG_chn
	and #$f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_PSG_SetFreq_PSG_reg
	; Assigning single variable : localVariable_PSG_SetFreq_PSG_reg
	asl
	asl
	; Calling storevariable
	sta localVariable_PSG_SetFreq_PSG_reg
	; Assigning single variable : localVariable_PSG_SetReg_PSG_reg
	; Calling storevariable
	sta localVariable_PSG_SetReg_PSG_reg
	; Assigning single variable : localVariable_PSG_SetReg_PSG_data
	; integer assignment NodeVar
	ldy localVariable_PSG_SetFreq_PSG_data+1 ; Next one ; optimized, look out for bugs
	lda localVariable_PSG_SetFreq_PSG_data
	; Calling storevariable
	sta localVariable_PSG_SetReg_PSG_data
	jsr PSG_SetReg
	inc localVariable_PSG_SetFreq_PSG_reg
	; Assigning single variable : localVariable_PSG_SetReg_PSG_reg
	lda localVariable_PSG_SetFreq_PSG_reg
	; Calling storevariable
	sta localVariable_PSG_SetReg_PSG_reg
	; Assigning single variable : localVariable_PSG_SetReg_PSG_data
	; integer assignment NodeVar
	ldy localVariable_PSG_SetFreq_PSG_data+1 ; Next one ; optimized, look out for bugs
	lda localVariable_PSG_SetFreq_PSG_data
PSG_SetFreq_tempVarShift_var20 = $24
	sta PSG_SetFreq_tempVarShift_var20
	sty PSG_SetFreq_tempVarShift_var20+1
	; COUNT : 8
		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

		lsr PSG_SetFreq_tempVarShift_var20+1 ;keep
	ror PSG_SetFreq_tempVarShift_var20+0 ;keep

	lda PSG_SetFreq_tempVarShift_var20
	ldy PSG_SetFreq_tempVarShift_var20+1
	; Calling storevariable
	sta localVariable_PSG_SetReg_PSG_data
	jsr PSG_SetReg
	rts
	; ***********  Defining procedure : PSG_getFreq
	;    Procedure type : User-defined procedure
localVariable_PSG_getFreq_PSG_ntp	= $2C
localVariable_PSG_getFreq_PSG_tableselect	dc.w	
localVariable_PSG_getFreq_PSG_tablepos	dc.b	
localVariable_PSG_getFreq_PSG_reladdr	dc.w	
localVariable_PSG_getFreq_PSG_octave	dc.b	
localVariable_PSG_getFreq_PSG_note	dc.b	
localVariable_PSG_getFreq_PSG_detune	dc.b	
PSG_getFreq_block21
PSG_getFreq
	; Assigning single variable : localVariable_PSG_getFreq_PSG_ntp
	lda #<PSG_PSGNoteTable
	ldx #>PSG_PSGNoteTable
	sta localVariable_PSG_getFreq_PSG_ntp
	stx localVariable_PSG_getFreq_PSG_ntp+1
	; Assigning single variable : localVariable_PSG_getFreq_PSG_tableselect
	ldy #0
	lda localVariable_PSG_getFreq_PSG_detune
PSG_getFreq_tempVarShift_var22 = $24
	sta PSG_getFreq_tempVarShift_var22
	sty PSG_getFreq_tempVarShift_var22+1
	; COUNT : 8
		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

		asl PSG_getFreq_tempVarShift_var22+0 ;keep
	rol PSG_getFreq_tempVarShift_var22+1 ;keep

	lda PSG_getFreq_tempVarShift_var22
	ldy PSG_getFreq_tempVarShift_var22+1
	; Calling storevariable
	sta localVariable_PSG_getFreq_PSG_tableselect
	sty localVariable_PSG_getFreq_PSG_tableselect+1
	; Assigning single variable : localVariable_PSG_getFreq_PSG_tablepos
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	ldx localVariable_PSG_getFreq_PSG_octave ; optimized, look out for bugs
	; Load right hand side
	lda #$c
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc localVariable_PSG_getFreq_PSG_note
	 ; end add / sub var with constant
	asl
	; Calling storevariable
	sta localVariable_PSG_getFreq_PSG_tablepos
	; Assigning single variable : localVariable_PSG_getFreq_PSG_reladdr
	; INTEGER optimization: a=b+c 
	lda localVariable_PSG_getFreq_PSG_tableselect
	clc
	adc localVariable_PSG_getFreq_PSG_tablepos
	sta localVariable_PSG_getFreq_PSG_reladdr+0
	lda localVariable_PSG_getFreq_PSG_tableselect+1
	adc #0
	sta localVariable_PSG_getFreq_PSG_reladdr+1
	; Assigning single variable : localVariable_PSG_getFreq_PSG_ntp
	lda localVariable_PSG_getFreq_PSG_ntp
	clc
	adc localVariable_PSG_getFreq_PSG_reladdr
	sta localVariable_PSG_getFreq_PSG_ntp+0
	lda localVariable_PSG_getFreq_PSG_ntp+1
	adc localVariable_PSG_getFreq_PSG_reladdr+1
	sta localVariable_PSG_getFreq_PSG_ntp+1
	; Assigning single variable : PSG_PSGNote
	; Load pointer array
	ldy #$0
	lda (localVariable_PSG_getFreq_PSG_ntp),y
	; Calling storevariable
	sta PSG_PSGNote
	sty PSG_PSGNote+1
	; Assigning single variable : PSG_PSGNote
	; Generic 16 bit op
	; integer assignment NodeVar
	ldy PSG_PSGNote+1 ; Next one ; optimized, look out for bugs
	lda PSG_PSGNote
PSG_getFreq_rightvarInteger_var29 = $24
	sta PSG_getFreq_rightvarInteger_var29
	sty PSG_getFreq_rightvarInteger_var29+1
	; Load pointer array
	ldy #$1
	lda (localVariable_PSG_getFreq_PSG_ntp),y
PSG_getFreq_tempVarShift_var30 = $26
	sta PSG_getFreq_tempVarShift_var30
	sty PSG_getFreq_tempVarShift_var30+1
	; COUNT : 8
		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

		asl PSG_getFreq_tempVarShift_var30+0 ;keep
	rol PSG_getFreq_tempVarShift_var30+1 ;keep

	lda PSG_getFreq_tempVarShift_var30
	ldy PSG_getFreq_tempVarShift_var30+1
	; Low bit binop:
	clc
	adc PSG_getFreq_rightvarInteger_var29
PSG_getFreq_wordAdd27
	sta PSG_getFreq_rightvarInteger_var29
	; High-bit binop
	tya
	adc PSG_getFreq_rightvarInteger_var29+1
	tay
	lda PSG_getFreq_rightvarInteger_var29
	; Calling storevariable
	sta PSG_PSGNote
	sty PSG_PSGNote+1
	rts
	; ***********  Defining procedure : Ticks_GetTI
	;    Procedure type : User-defined procedure
Ticks_GetTI
	; ****** Inline assembler section
		jsr $FFDE
		sta Ticks_ti0
		stx Ticks_ti1
		sty Ticks_ti2
	
	rts
	; ***********  Defining procedure : X16Mouse_CursorOn
	;    Procedure type : User-defined procedure
X16Mouse_CursorOn
	; ****** Inline assembler section
		LDA #1
		jsr $FF68
	
	rts
	; ***********  Defining procedure : X16Mouse_CursorOff
	;    Procedure type : User-defined procedure
X16Mouse_CursorOff
	; ****** Inline assembler section
		LDA #0
		jsr $FF68
	
	rts
	; ***********  Defining procedure : DoThisInIRQ
	;    Procedure type : User-defined procedure
DoThisInIRQ
	rts
	; ***********  Defining procedure : SetIRQToMyHandler
	;    Procedure type : User-defined procedure
SetIRQToMyHandler
	; ****** Inline assembler section
	sei
    lda $0314
    sta Default_irq_handler
    lda $0315
    sta Default_irq_handler+1
	lda #<custom_irq_handler
	sta $0314
	lda #>custom_irq_handler
	sta $0315
	cli
	rts
	
custom_irq_handler:
//Handle only VSYNC interrupt, so we run only 60 times per second
    lda $9F27	
    and #$01
    beq irq_done
    ; Whatever code your program
    ; wanted to execute...
	
	jsr DoThisInIRQ
	; ****** Inline assembler section
//This is recommended to only have VSYNC interrupt. Or what and how.	
    lda #$01
    sta $9F27
irq_done:
    ; Return to Kernal handling:
    jmp(Default_irq_handler)
	
	rts
	; ***********  Defining procedure : SetIRQToDefaultHandler
	;    Procedure type : User-defined procedure
SetIRQToDefaultHandler
	; ****** Inline assembler section
	sei
	lda Default_irq_handler
	sta $0314
	lda Default_irq_handler+1
	sta $0315
	cli
	rts
	
	rts
block1
	jsr X16Mouse_CursorOn
	jsr SetIRQToMyHandler
	; Assigning single variable : i
	ldy #0
	lda #$0
	; Calling storevariable
	sta i
	sty i+1
MainProgram_forloop37
	
; //	SCF::TextAtPos(0,PSG::yp,"OCTAVE",7);
; //	SCF::TextAtPos(10,PSG::yp,"NOTE",7);
; //	SCF::TextAtPos(20,PSG::yp,"DETUNE",7);	
; //	SCF::TextAtPos(30,PSG::yp,"NTP",7);	
; //	SCF::TextAtPos(40,PSG::yp,"TABLESEL",7);	
; //	SCF::TextAtPos(50,PSG::yp,"TABLEPOS",7);	
; //	SCF::TextAtPos(60,PSG::yp,"RELADDR",7);	
; //	SCF::TextAtPos(70,PSG::yp,"PSGNOTE",7);	
; //	inc(PSG::yp);
	; Assigning single variable : localVariable_PSG_getFreq_PSG_octave
	lda #$a
	; Calling storevariable
	sta localVariable_PSG_getFreq_PSG_octave
	; Assigning single variable : localVariable_PSG_getFreq_PSG_note
	lda #$0
	; Calling storevariable
	sta localVariable_PSG_getFreq_PSG_note
	; Assigning single variable : localVariable_PSG_getFreq_PSG_detune
	; integer assignment NodeVar
	ldy i+1 ; Next one ; optimized, look out for bugs
	lda i
	; Calling storevariable
	sta localVariable_PSG_getFreq_PSG_detune
	jsr PSG_getFreq
	; IS ONPAGE
	inc i
	ldy #0   ; Force integer assignment, set y = 0 for values lower than 255
	lda #$1f
	cmp i ;keep
	bcs MainProgram_forloop37
MainProgram_loopdone40: ;keep
	jsr SetIRQToDefaultHandler
	jsr X16Mouse_CursorOff
	rts
EndSymbol
	; End of program
	; Ending memory block
EndBlock761
