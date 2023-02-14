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
Input_lastkey	dc.b	
Input_note	dc.b	
Input_octave	dc.b	
Default_irq_handler	= $22
justanumber	dc.w	
i	dc.w	
j	dc.w	
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
	; ***********  Defining procedure : SCF_DrawHexByte
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawHexByte_SCF_X	dc.b	
localVariable_SCF_DrawHexByte_SCF_Y	dc.b	
localVariable_SCF_DrawHexByte_SCF_Number	dc.b	
localVariable_SCF_DrawHexByte_SCF_Col	dc.b	
SCF_DrawHexByte_block3
SCF_DrawHexByte
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	lda localVariable_SCF_DrawHexByte_SCF_X
	asl
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f22
	lda #$20
	; Calling storevariable
	sta $9f22
	; Assigning memory location
	; Assigning single variable : $9f21
	lda localVariable_SCF_DrawHexByte_SCF_Y
	; Calling storevariable
	sta $9f21
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	lda localVariable_SCF_DrawHexByte_SCF_Number
	lsr
	lsr
	lsr
	lsr
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawHexByte_SCF_Number
	and #$f
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexByte_SCF_Col
	; Calling storevariable
	sta $9f23
	rts
	; ***********  Defining procedure : SCF_DrawHexInt
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawHexInt_SCF_X	dc.w	
localVariable_SCF_DrawHexInt_SCF_Y	dc.w	
localVariable_SCF_DrawHexInt_SCF_Number	dc.w	
localVariable_SCF_DrawHexInt_SCF_Col	dc.b	
SCF_DrawHexInt_block7
SCF_DrawHexInt
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_X
	ldy #0
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	; Integer assignment in nodevar
	lda localVariable_SCF_DrawHexInt_SCF_X
	ldy localVariable_SCF_DrawHexInt_SCF_X+1
	sta mul16x8_num1
	sty mul16x8_num1Hi
	ldy #0   ; Force integer assignment, set y = 0 for values lower than 255
	lda #$2
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_X
	sty localVariable_SCF_DrawHexInt_SCF_X+1
	; Assigning memory location
	; Assigning single variable : $9f22
	lda #$20
	; Calling storevariable
	sta $9f22
	; Assigning memory location
	; Assigning single variable : $9f21
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Y+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Y
	; Calling storevariable
	sta $9f21
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Number+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Number
SCF_DrawHexInt_tempVarShift_var8 = $24
	sta SCF_DrawHexInt_tempVarShift_var8
	sty SCF_DrawHexInt_tempVarShift_var8+1
	; COUNT : 12
		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var8+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var8+0 ;keep

	lda SCF_DrawHexInt_tempVarShift_var8
	ldy SCF_DrawHexInt_tempVarShift_var8+1
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec9
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec9
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec10
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec10
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; Generic 16 bit op
	ldy #0
	lda #$f
SCF_DrawHexInt_rightvarInteger_var13 = $24
	sta SCF_DrawHexInt_rightvarInteger_var13
	sty SCF_DrawHexInt_rightvarInteger_var13+1
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Number+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Number
SCF_DrawHexInt_tempVarShift_var14 = $26
	sta SCF_DrawHexInt_tempVarShift_var14
	sty SCF_DrawHexInt_tempVarShift_var14+1
	; COUNT : 8
		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var14+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var14+0 ;keep

	lda SCF_DrawHexInt_tempVarShift_var14
	ldy SCF_DrawHexInt_tempVarShift_var14+1
	; Low bit binop:
	and SCF_DrawHexInt_rightvarInteger_var13
SCF_DrawHexInt_wordAdd11
	sta SCF_DrawHexInt_rightvarInteger_var13
	; High-bit binop
	tya
	and SCF_DrawHexInt_rightvarInteger_var13+1
	tay
	ldx SCF_DrawHexInt_rightvarInteger_var13 ; optimized, look out for bugs
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec15
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec15
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec16
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec16
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; Generic 16 bit op
	ldy #0
	lda #$f
SCF_DrawHexInt_rightvarInteger_var19 = $24
	sta SCF_DrawHexInt_rightvarInteger_var19
	sty SCF_DrawHexInt_rightvarInteger_var19+1
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Number+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Number
SCF_DrawHexInt_tempVarShift_var20 = $26
	sta SCF_DrawHexInt_tempVarShift_var20
	sty SCF_DrawHexInt_tempVarShift_var20+1
	; COUNT : 4
		lsr SCF_DrawHexInt_tempVarShift_var20+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var20+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var20+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var20+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var20+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var20+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var20+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var20+0 ;keep

	lda SCF_DrawHexInt_tempVarShift_var20
	ldy SCF_DrawHexInt_tempVarShift_var20+1
	; Low bit binop:
	and SCF_DrawHexInt_rightvarInteger_var19
SCF_DrawHexInt_wordAdd17
	sta SCF_DrawHexInt_rightvarInteger_var19
	; High-bit binop
	tya
	and SCF_DrawHexInt_rightvarInteger_var19+1
	tay
	ldx SCF_DrawHexInt_rightvarInteger_var19 ; optimized, look out for bugs
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec21
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec21
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec22
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec22
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; HandleVarBinopB16bit
	ldy #0 ; ::HandleVarBinopB16bit 0
	lda #$f
SCF_DrawHexInt_rightvarInteger_var24 = $24
	sta SCF_DrawHexInt_rightvarInteger_var24
	sty SCF_DrawHexInt_rightvarInteger_var24+1
	lda localVariable_SCF_DrawHexInt_SCF_Number+1
	and SCF_DrawHexInt_rightvarInteger_var24+1
	tay
	lda localVariable_SCF_DrawHexInt_SCF_Number
	and SCF_DrawHexInt_rightvarInteger_var24
	bcs SCF_DrawHexInt_wordAdd23
	dey
SCF_DrawHexInt_wordAdd23
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	bne SCF_DrawHexInt_incdec25
	inc localVariable_SCF_DrawHexInt_SCF_X +1
SCF_DrawHexInt_incdec25
	; Assigning memory location
	; Assigning single variable : $9f20
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_X+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	rts
	; ***********  Defining procedure : SCF_DrawChar
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawChar_SCF_X	dc.b	
localVariable_SCF_DrawChar_SCF_Y	dc.b	
localVariable_SCF_DrawChar_SCF_char	dc.b	
localVariable_SCF_DrawChar_SCF_color	dc.b	
SCF_DrawChar_block26
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
SCF_DrawBox_block27
SCF_DrawBox
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_x
	lda localVariable_SCF_DrawBox_SCF_posX
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_x
SCF_DrawBox_forloop28
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_y
	lda localVariable_SCF_DrawBox_SCF_posY
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_y
SCF_DrawBox_forloop30
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
	bne SCF_DrawBox_forloop30
SCF_DrawBox_loopdone33: ;keep
	; IS ONPAGE
	inc localVariable_SCF_DrawBox_SCF_x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBox_SCF_posX
	clc
	adc localVariable_SCF_DrawBox_SCF_Width
	 ; end add / sub var with constant
	cmp localVariable_SCF_DrawBox_SCF_x ;keep
	bne SCF_DrawBox_forloop28
SCF_DrawBox_loopdone39: ;keep
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
	; ***********  Defining procedure : Ticks_WaitTicks
	;    Procedure type : User-defined procedure
localVariable_Ticks_WaitTicks_Ticks_targetticks	dc.w	
localVariable_Ticks_WaitTicks_Ticks_ticks	dc.b	
Ticks_WaitTicks_block41
Ticks_WaitTicks
	; Assigning single variable : localVariable_Ticks_WaitTicks_Ticks_targetticks
	ldy #0
	; INTEGER optimization: a=b+c 
	lda Ticks_lastti
	clc
	adc localVariable_Ticks_WaitTicks_Ticks_ticks
	sta localVariable_Ticks_WaitTicks_Ticks_targetticks+0
	lda Ticks_lastti+1
	adc #0
	sta localVariable_Ticks_WaitTicks_Ticks_targetticks+1
	jsr Ticks_GetTI
Ticks_WaitTicks_while43
	; Binary clause INTEGER: GREATER
	; Compare INTEGER with pure num / var optimization. GREATER. 
	lda localVariable_Ticks_WaitTicks_Ticks_targetticks+1   ; compare high bytes
	cmp Ticks_ti+1 ;keep
	bcc Ticks_WaitTicks_elsedoneblock46
	bne Ticks_WaitTicks_ConditionalTrueBlock44
	lda localVariable_Ticks_WaitTicks_Ticks_targetticks
	cmp Ticks_ti ;keep
	bcc Ticks_WaitTicks_elsedoneblock46
	beq Ticks_WaitTicks_elsedoneblock46
Ticks_WaitTicks_ConditionalTrueBlock44: ;Main true block ;keep 
	jsr Ticks_GetTI
	jmp Ticks_WaitTicks_while43
Ticks_WaitTicks_elsedoneblock46
	; Assigning single variable : Ticks_lastti
	; integer assignment NodeVar
	ldy Ticks_ti+1 ; Next one ; optimized, look out for bugs
	lda Ticks_ti
	; Calling storevariable
	sta Ticks_lastti
	sty Ticks_lastti+1
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
	; ***********  Defining procedure : Input_getin
	;    Procedure type : User-defined procedure
Input_getin
	; ****** Inline assembler section
		//jsr $FF9F //SCNKEY
		jsr $FFE4 //GETIN
		sta Input_key
	
	rts
	; ***********  Defining procedure : DoThisInIRQ
	;    Procedure type : User-defined procedure
DoThisInIRQ
	inc justanumber
	bne DoThisInIRQ_incdec53
	inc justanumber +1
DoThisInIRQ_incdec53
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
	lda #$a
	; Calling storevariable
	sta i
	sty i+1
MainProgram_forloop56
	; Assigning single variable : j
	ldy #0
	lda #$0
	; Calling storevariable
	sta j
	sty j+1
MainProgram_forloop58
	jsr Input_getin
	; Binary clause Simplified: NOTEQUALS
	lda Input_key
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock63
MainProgram_ConditionalTrueBlock61: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$4b
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$37
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	lda Input_key
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$5
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
MainProgram_elsedoneblock63
	; Assigning single variable : localVariable_Ticks_WaitTicks_Ticks_ticks
	lda #$1
	; Calling storevariable
	sta localVariable_Ticks_WaitTicks_Ticks_ticks
	jsr Ticks_WaitTicks
	; Assigning single variable : Input_lastkey
	lda Input_key
	; Calling storevariable
	sta Input_lastkey
	; IS ONPAGE
	inc j
	ldy #0   ; Force integer assignment, set y = 0 for values lower than 255
	lda #$3c
	cmp j ;keep
	bne MainProgram_forloop58
MainProgram_loopdone73: ;keep
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_X
	ldy #0
	lda #$a
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_X
	sty localVariable_SCF_DrawHexInt_SCF_X+1
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Y
	; integer assignment NodeVar
	ldy i+1 ; Next one ; optimized, look out for bugs
	lda i
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Y
	sty localVariable_SCF_DrawHexInt_SCF_Y+1
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Number
	; integer assignment NodeVar
	ldy justanumber+1 ; Next one ; optimized, look out for bugs
	lda justanumber
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Number
	sty localVariable_SCF_DrawHexInt_SCF_Number+1
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Col
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Col
	jsr SCF_DrawHexInt
	; Assigning single variable : justanumber
	ldy #0
	lda #$0
	; Calling storevariable
	sta justanumber
	sty justanumber+1
	inc i
	lda #$32
	cmp i ;keep
	bcc MainProgram_loopdone91
MainProgram_loopnotdone92
	jmp MainProgram_forloop56
MainProgram_loopdone91
	jsr SetIRQToDefaultHandler
	jsr X16Mouse_CursorOff
	rts
EndSymbol
	; End of program
	; Ending memory block
EndBlock505
