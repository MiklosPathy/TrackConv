 processor 6502
	org $1000
	; Starting new memory block at $1000
Widget
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
Widget_Map	dc.b	 
	org Widget_Map+4800
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
	; ***********  Defining procedure : SCF_DrawBinByte
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawBinByte_SCF_X	dc.b	
localVariable_SCF_DrawBinByte_SCF_Y	dc.b	
localVariable_SCF_DrawBinByte_SCF_Number	dc.b	
localVariable_SCF_DrawBinByte_SCF_Col	dc.b	
SCF_DrawBinByte_block3
SCF_DrawBinByte
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_X
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	lda localVariable_SCF_DrawBinByte_SCF_X
	asl
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f22
	lda #$20
	; Calling storevariable
	sta $9f22
	; Assigning memory location
	; Assigning single variable : $9f21
	lda localVariable_SCF_DrawBinByte_SCF_Y
	; Calling storevariable
	sta $9f21
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	lsr
	lsr
	lsr
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	lsr
	lsr
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	lsr
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	lsr
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBinByte_SCF_Number
	and #$1
	 ; end add / sub var with constant
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawBinByte_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawBinByte_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawBinByte_SCF_Col
	; Calling storevariable
	sta $9f23
	rts
	; ***********  Defining procedure : SCF_DrawHexByte
	;    Procedure type : User-defined procedure
localVariable_SCF_DrawHexByte_SCF_X	dc.b	
localVariable_SCF_DrawHexByte_SCF_Y	dc.b	
localVariable_SCF_DrawHexByte_SCF_Number	dc.b	
localVariable_SCF_DrawHexByte_SCF_Col	dc.b	
SCF_DrawHexByte_block19
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
localVariable_SCF_DrawHexInt_SCF_X	dc.b	
localVariable_SCF_DrawHexInt_SCF_Y	dc.b	
localVariable_SCF_DrawHexInt_SCF_Number	dc.w	
localVariable_SCF_DrawHexInt_SCF_Col	dc.b	
SCF_DrawHexInt_block23
SCF_DrawHexInt
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_X
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	lda localVariable_SCF_DrawHexInt_SCF_X
	asl
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f22
	lda #$20
	; Calling storevariable
	sta $9f22
	; Assigning memory location
	; Assigning single variable : $9f21
	lda localVariable_SCF_DrawHexInt_SCF_Y
	; Calling storevariable
	sta $9f21
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Number+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Number
SCF_DrawHexInt_tempVarShift_var24 = $24
	sta SCF_DrawHexInt_tempVarShift_var24
	sty SCF_DrawHexInt_tempVarShift_var24+1
	; COUNT : 12
		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var24+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var24+0 ;keep

	lda SCF_DrawHexInt_tempVarShift_var24
	ldy SCF_DrawHexInt_tempVarShift_var24+1
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; Generic 16 bit op
	ldy #0
	lda #$f
SCF_DrawHexInt_rightvarInteger_var29 = $24
	sta SCF_DrawHexInt_rightvarInteger_var29
	sty SCF_DrawHexInt_rightvarInteger_var29+1
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Number+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Number
SCF_DrawHexInt_tempVarShift_var30 = $26
	sta SCF_DrawHexInt_tempVarShift_var30
	sty SCF_DrawHexInt_tempVarShift_var30+1
	; COUNT : 8
		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var30+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var30+0 ;keep

	lda SCF_DrawHexInt_tempVarShift_var30
	ldy SCF_DrawHexInt_tempVarShift_var30+1
	; Low bit binop:
	and SCF_DrawHexInt_rightvarInteger_var29
SCF_DrawHexInt_wordAdd27
	sta SCF_DrawHexInt_rightvarInteger_var29
	; High-bit binop
	tya
	and SCF_DrawHexInt_rightvarInteger_var29+1
	tay
	ldx SCF_DrawHexInt_rightvarInteger_var29 ; optimized, look out for bugs
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; Generic 16 bit op
	ldy #0
	lda #$f
SCF_DrawHexInt_rightvarInteger_var35 = $24
	sta SCF_DrawHexInt_rightvarInteger_var35
	sty SCF_DrawHexInt_rightvarInteger_var35+1
	; integer assignment NodeVar
	ldy localVariable_SCF_DrawHexInt_SCF_Number+1 ; Next one ; optimized, look out for bugs
	lda localVariable_SCF_DrawHexInt_SCF_Number
SCF_DrawHexInt_tempVarShift_var36 = $26
	sta SCF_DrawHexInt_tempVarShift_var36
	sty SCF_DrawHexInt_tempVarShift_var36+1
	; COUNT : 4
		lsr SCF_DrawHexInt_tempVarShift_var36+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var36+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var36+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var36+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var36+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var36+0 ;keep

		lsr SCF_DrawHexInt_tempVarShift_var36+1 ;keep
	ror SCF_DrawHexInt_tempVarShift_var36+0 ;keep

	lda SCF_DrawHexInt_tempVarShift_var36
	ldy SCF_DrawHexInt_tempVarShift_var36+1
	; Low bit binop:
	and SCF_DrawHexInt_rightvarInteger_var35
SCF_DrawHexInt_wordAdd33
	sta SCF_DrawHexInt_rightvarInteger_var35
	; High-bit binop
	tya
	and SCF_DrawHexInt_rightvarInteger_var35+1
	tay
	ldx SCF_DrawHexInt_rightvarInteger_var35 ; optimized, look out for bugs
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	lda localVariable_SCF_DrawHexInt_SCF_Col
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
	lda localVariable_SCF_DrawHexInt_SCF_X
	; Calling storevariable
	sta $9f20
	; Assigning memory location
	; Assigning single variable : $9f23
	; Load Unknown type array
	; HandleVarBinopB16bit
	ldy #0 ; ::HandleVarBinopB16bit 0
	lda #$f
SCF_DrawHexInt_rightvarInteger_var40 = $24
	sta SCF_DrawHexInt_rightvarInteger_var40
	sty SCF_DrawHexInt_rightvarInteger_var40+1
	lda localVariable_SCF_DrawHexInt_SCF_Number+1
	and SCF_DrawHexInt_rightvarInteger_var40+1
	tay
	lda localVariable_SCF_DrawHexInt_SCF_Number
	and SCF_DrawHexInt_rightvarInteger_var40
	bcs SCF_DrawHexInt_wordAdd39
	dey
SCF_DrawHexInt_wordAdd39
	tax
	lda SCF_hex,x
	; Calling storevariable
	sta $9f23
	inc localVariable_SCF_DrawHexInt_SCF_X
	; Assigning memory location
	; Assigning single variable : $9f20
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
SCF_DrawChar_block42
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
	; ***********  Defining procedure : SCF_TextAtPos
	;    Procedure type : User-defined procedure
localVariable_SCF_TextAtPos_SCF_i	dc.b	
localVariable_SCF_TextAtPos_SCF_c	dc.b	
localVariable_SCF_TextAtPos_SCF_c2	dc.b	
localVariable_SCF_TextAtPos_SCF_X	dc.b	
localVariable_SCF_TextAtPos_SCF_Y	dc.b	
localVariable_SCF_TextAtPos_SCF_caption	= $22
localVariable_SCF_TextAtPos_SCF_color	dc.b	
SCF_TextAtPos_block43
SCF_TextAtPos
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_i
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_i
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_c
	; Load pointer array
	tay ; optimized y, look out for bugs L22 ORG 	ldy localVariable_SCF_TextAtPos_SCF_i
	lda (localVariable_SCF_TextAtPos_SCF_caption),y
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_c
SCF_TextAtPos_while44
	; Binary clause Simplified: NOTEQUALS
	lda localVariable_SCF_TextAtPos_SCF_c
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq SCF_TextAtPos_elsedoneblock47
SCF_TextAtPos_ConditionalTrueBlock45: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_c2
	lda #$20
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_c2
	; Binary clause Simplified: GREATEREQUAL
	lda localVariable_SCF_TextAtPos_SCF_c
	; Compare with pure num / var optimization
	cmp #$41;keep
	bcc SCF_TextAtPos_elsedoneblock68
SCF_TextAtPos_localsuccess70: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: LESSEQUAL
	lda localVariable_SCF_TextAtPos_SCF_c
	; Compare with pure num / var optimization
	cmp #$5a;keep
	beq SCF_TextAtPos_ConditionalTrueBlock66
	bcs SCF_TextAtPos_elsedoneblock68
SCF_TextAtPos_ConditionalTrueBlock66: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_c2
	; Optimizer: a = a +/- b
	lda localVariable_SCF_TextAtPos_SCF_c
	sec
	sbc #$40
	sta localVariable_SCF_TextAtPos_SCF_c2
SCF_TextAtPos_elsedoneblock68
	; Binary clause Simplified: GREATEREQUAL
	lda localVariable_SCF_TextAtPos_SCF_c
	; Compare with pure num / var optimization
	cmp #$20;keep
	bcc SCF_TextAtPos_elsedoneblock75
SCF_TextAtPos_localsuccess77: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: LESSEQUAL
	lda localVariable_SCF_TextAtPos_SCF_c
	; Compare with pure num / var optimization
	cmp #$40;keep
	beq SCF_TextAtPos_ConditionalTrueBlock73
	bcs SCF_TextAtPos_elsedoneblock75
SCF_TextAtPos_ConditionalTrueBlock73: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_c2
	lda localVariable_SCF_TextAtPos_SCF_c
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_c2
SCF_TextAtPos_elsedoneblock75
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_TextAtPos_SCF_X
	clc
	adc localVariable_SCF_TextAtPos_SCF_i
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_SCF_TextAtPos_SCF_Y
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda localVariable_SCF_TextAtPos_SCF_c2
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	lda localVariable_SCF_TextAtPos_SCF_color
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	inc localVariable_SCF_TextAtPos_SCF_i
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_c
	; Load pointer array
	ldy localVariable_SCF_TextAtPos_SCF_i
	lda (localVariable_SCF_TextAtPos_SCF_caption),y
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_c
	jmp SCF_TextAtPos_while44
SCF_TextAtPos_elsedoneblock47
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
SCF_DrawBox_block80
SCF_DrawBox
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_x
	lda localVariable_SCF_DrawBox_SCF_posX
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_x
SCF_DrawBox_forloop81
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_y
	lda localVariable_SCF_DrawBox_SCF_posY
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_y
SCF_DrawBox_forloop83
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
	bne SCF_DrawBox_forloop83
SCF_DrawBox_loopdone86: ;keep
	; IS ONPAGE
	inc localVariable_SCF_DrawBox_SCF_x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_SCF_DrawBox_SCF_posX
	clc
	adc localVariable_SCF_DrawBox_SCF_Width
	 ; end add / sub var with constant
	cmp localVariable_SCF_DrawBox_SCF_x ;keep
	bne SCF_DrawBox_forloop81
SCF_DrawBox_loopdone92: ;keep
	rts
	; ***********  Defining procedure : SCF_InitScreen
	;    Procedure type : User-defined procedure
localVariable_SCF_InitScreen_SCF_color	dc.b	
SCF_InitScreen_block93
SCF_InitScreen
	; Assigning memory location
	; Assigning single variable : $9f25
	lda #$0
	; Calling storevariable
	sta $9f25
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posX
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posX
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posY
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posY
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Width
	lda #$50
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Width
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Height
	lda #$3c
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Height
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_color
	lda localVariable_SCF_InitScreen_SCF_color
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_color
	jsr SCF_DrawBox
	rts
	; ***********  Defining procedure : Widget_putMapValue
	;    Procedure type : User-defined procedure
localVariable_Widget_putMapValue_Widget_wmp	= $22
localVariable_Widget_putMapValue_Widget_posX	dc.b	
localVariable_Widget_putMapValue_Widget_posY	dc.b	
localVariable_Widget_putMapValue_Widget_value	dc.b	
Widget_putMapValue_block94
Widget_putMapValue
	; Assigning single variable : localVariable_Widget_putMapValue_Widget_wmp
	lda #<Widget_Map
	ldx #>Widget_Map
	sta localVariable_Widget_putMapValue_Widget_wmp
	stx localVariable_Widget_putMapValue_Widget_wmp+1
	; Assigning single variable : localVariable_Widget_putMapValue_Widget_wmp
	; Generic 16 bit op
	ldy #0
	lda localVariable_Widget_putMapValue_Widget_posX
Widget_putMapValue_rightvarInteger_var97 = $24
	sta Widget_putMapValue_rightvarInteger_var97
	sty Widget_putMapValue_rightvarInteger_var97+1
	; Generic 16 bit op
	; integer assignment NodeVar
	ldy localVariable_Widget_putMapValue_Widget_wmp+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Widget_putMapValue_Widget_wmp
Widget_putMapValue_rightvarInteger_var100 = $26
	sta Widget_putMapValue_rightvarInteger_var100
	sty Widget_putMapValue_rightvarInteger_var100+1
	; Swapping nodes :  num * expr -> exp*num (mul only)
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda localVariable_Widget_putMapValue_Widget_posY
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$50
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc Widget_putMapValue_rightvarInteger_var100
Widget_putMapValue_wordAdd98
	sta Widget_putMapValue_rightvarInteger_var100
	; High-bit binop
	tya
	adc Widget_putMapValue_rightvarInteger_var100+1
	tay
	lda Widget_putMapValue_rightvarInteger_var100
	; Low bit binop:
	clc
	adc Widget_putMapValue_rightvarInteger_var97
Widget_putMapValue_wordAdd95
	sta Widget_putMapValue_rightvarInteger_var97
	; High-bit binop
	tya
	adc Widget_putMapValue_rightvarInteger_var97+1
	tay
	lda Widget_putMapValue_rightvarInteger_var97
	sta localVariable_Widget_putMapValue_Widget_wmp
	sty localVariable_Widget_putMapValue_Widget_wmp+1
	; Assigning single variable : localVariable_Widget_putMapValue_Widget_wmp
	; Store Variable simplified optimization : right-hand term is pure
	ldy #$0 ; optimized, look out for bugs
	lda localVariable_Widget_putMapValue_Widget_value
	sta (localVariable_Widget_putMapValue_Widget_wmp),y
	rts
	; ***********  Defining procedure : Widget_getMapValue
	;    Procedure type : User-defined procedure
localVariable_Widget_getMapValue_Widget_wmp	= $22
localVariable_Widget_getMapValue_Widget_posX	dc.b	
localVariable_Widget_getMapValue_Widget_posY	dc.b	
Widget_getMapValue_block101
Widget_getMapValue
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_wmp
	lda #<Widget_Map
	ldx #>Widget_Map
	sta localVariable_Widget_getMapValue_Widget_wmp
	stx localVariable_Widget_getMapValue_Widget_wmp+1
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_wmp
	; Generic 16 bit op
	ldy #0
	lda localVariable_Widget_getMapValue_Widget_posX
Widget_getMapValue_rightvarInteger_var104 = $24
	sta Widget_getMapValue_rightvarInteger_var104
	sty Widget_getMapValue_rightvarInteger_var104+1
	; Generic 16 bit op
	; integer assignment NodeVar
	ldy localVariable_Widget_getMapValue_Widget_wmp+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Widget_getMapValue_Widget_wmp
Widget_getMapValue_rightvarInteger_var107 = $26
	sta Widget_getMapValue_rightvarInteger_var107
	sty Widget_getMapValue_rightvarInteger_var107+1
	; Swapping nodes :  num * expr -> exp*num (mul only)
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda localVariable_Widget_getMapValue_Widget_posY
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$50
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc Widget_getMapValue_rightvarInteger_var107
Widget_getMapValue_wordAdd105
	sta Widget_getMapValue_rightvarInteger_var107
	; High-bit binop
	tya
	adc Widget_getMapValue_rightvarInteger_var107+1
	tay
	lda Widget_getMapValue_rightvarInteger_var107
	; Low bit binop:
	clc
	adc Widget_getMapValue_rightvarInteger_var104
Widget_getMapValue_wordAdd102
	sta Widget_getMapValue_rightvarInteger_var104
	; High-bit binop
	tya
	adc Widget_getMapValue_rightvarInteger_var104+1
	tay
	lda Widget_getMapValue_rightvarInteger_var104
	sta localVariable_Widget_getMapValue_Widget_wmp
	sty localVariable_Widget_getMapValue_Widget_wmp+1
	; Load pointer array
	ldy #$0
	lda (localVariable_Widget_getMapValue_Widget_wmp),y
	rts
	rts
	; ***********  Defining procedure : Widget_ShowMap
	;    Procedure type : User-defined procedure
localVariable_Widget_ShowMap_Widget_x	dc.b	
localVariable_Widget_ShowMap_Widget_y	dc.b	
localVariable_Widget_ShowMap_Widget_v	dc.b	
Widget_ShowMap_block108
Widget_ShowMap
	; Assigning single variable : localVariable_Widget_ShowMap_Widget_y
	lda #$0
	; Calling storevariable
	sta localVariable_Widget_ShowMap_Widget_y
Widget_ShowMap_forloop109
	; Assigning single variable : localVariable_Widget_ShowMap_Widget_x
	lda #$0
	; Calling storevariable
	sta localVariable_Widget_ShowMap_Widget_x
Widget_ShowMap_forloop111
	; Assigning single variable : localVariable_Widget_ShowMap_Widget_v
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posX
	lda localVariable_Widget_ShowMap_Widget_x
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posX
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posY
	lda localVariable_Widget_ShowMap_Widget_y
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posY
	jsr Widget_getMapValue
	; Calling storevariable
	sta localVariable_Widget_ShowMap_Widget_v
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	lda localVariable_Widget_ShowMap_Widget_x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_Widget_ShowMap_Widget_y
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda localVariable_Widget_ShowMap_Widget_v
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	; IS ONPAGE
	inc localVariable_Widget_ShowMap_Widget_x
	lda #$50
	cmp localVariable_Widget_ShowMap_Widget_x ;keep
	bne Widget_ShowMap_forloop111
Widget_ShowMap_loopdone114: ;keep
	; IS ONPAGE
	inc localVariable_Widget_ShowMap_Widget_y
	lda #$3c
	cmp localVariable_Widget_ShowMap_Widget_y ;keep
	bne Widget_ShowMap_forloop109
Widget_ShowMap_loopdone120: ;keep
	rts
	; ***********  Defining procedure : Widget_ClearMap
	;    Procedure type : User-defined procedure
localVariable_Widget_ClearMap_Widget_wmp	= $22
localVariable_Widget_ClearMap_Widget_endpoint	= $2C
Widget_ClearMap_block121
Widget_ClearMap
	; Assigning single variable : localVariable_Widget_ClearMap_Widget_wmp
	lda #<Widget_Map
	ldx #>Widget_Map
	sta localVariable_Widget_ClearMap_Widget_wmp
	stx localVariable_Widget_ClearMap_Widget_wmp+1
	; Assigning single variable : localVariable_Widget_ClearMap_Widget_endpoint
	; INTEGER optimization: a=b+c 
	lda localVariable_Widget_ClearMap_Widget_wmp
	clc
	adc #$c0
	sta localVariable_Widget_ClearMap_Widget_endpoint+0
	lda localVariable_Widget_ClearMap_Widget_wmp+1
	adc #$12
	sta localVariable_Widget_ClearMap_Widget_endpoint+1
Widget_ClearMap_while123
	; Binary clause INTEGER: LESS
	; Compare INTEGER with pure num / var optimization
	lda localVariable_Widget_ClearMap_Widget_wmp+1   ; compare high bytes
	cmp localVariable_Widget_ClearMap_Widget_endpoint+1 ;keep
	bcc Widget_ClearMap_ConditionalTrueBlock124
	bne Widget_ClearMap_elsedoneblock126
	lda localVariable_Widget_ClearMap_Widget_wmp
	cmp localVariable_Widget_ClearMap_Widget_endpoint ;keep
	bcs Widget_ClearMap_elsedoneblock126
Widget_ClearMap_ConditionalTrueBlock124: ;Main true block ;keep 
	; Assigning single variable : localVariable_Widget_ClearMap_Widget_wmp
	; Store Variable simplified optimization : right-hand term is pure
	ldy #$0 ; optimized, look out for bugs
	lda #$ff
	sta (localVariable_Widget_ClearMap_Widget_wmp),y
	inc localVariable_Widget_ClearMap_Widget_wmp
	bne Widget_ClearMap_incdec130
	inc localVariable_Widget_ClearMap_Widget_wmp +1
Widget_ClearMap_incdec130
	jmp Widget_ClearMap_while123
Widget_ClearMap_elsedoneblock126
	rts
	; ***********  Defining procedure : Widget_PlaceOnMap
	;    Procedure type : User-defined procedure
localVariable_Widget_PlaceOnMap_Widget_x	dc.b	
localVariable_Widget_PlaceOnMap_Widget_y	dc.b	
localVariable_Widget_PlaceOnMap_Widget_posX	dc.b	
localVariable_Widget_PlaceOnMap_Widget_posY	dc.b	
localVariable_Widget_PlaceOnMap_Widget_Width	dc.b	
localVariable_Widget_PlaceOnMap_Widget_Height	dc.b	
localVariable_Widget_PlaceOnMap_Widget_WID	dc.b	
Widget_PlaceOnMap_block131
Widget_PlaceOnMap
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_y
	lda localVariable_Widget_PlaceOnMap_Widget_posY
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_y
Widget_PlaceOnMap_forloop132
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_x
	lda localVariable_Widget_PlaceOnMap_Widget_posX
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_x
Widget_PlaceOnMap_forloop134
	; Assigning single variable : localVariable_Widget_putMapValue_Widget_posX
	lda localVariable_Widget_PlaceOnMap_Widget_x
	; Calling storevariable
	sta localVariable_Widget_putMapValue_Widget_posX
	; Assigning single variable : localVariable_Widget_putMapValue_Widget_posY
	lda localVariable_Widget_PlaceOnMap_Widget_y
	; Calling storevariable
	sta localVariable_Widget_putMapValue_Widget_posY
	; Assigning single variable : localVariable_Widget_putMapValue_Widget_value
	lda localVariable_Widget_PlaceOnMap_Widget_WID
	; Calling storevariable
	sta localVariable_Widget_putMapValue_Widget_value
	jsr Widget_putMapValue
	; IS ONPAGE
	inc localVariable_Widget_PlaceOnMap_Widget_x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Widget_PlaceOnMap_Widget_posX
	clc
	adc localVariable_Widget_PlaceOnMap_Widget_Width
	 ; end add / sub var with constant
	cmp localVariable_Widget_PlaceOnMap_Widget_x ;keep
	bne Widget_PlaceOnMap_forloop134
Widget_PlaceOnMap_loopdone137: ;keep
	; IS ONPAGE
	inc localVariable_Widget_PlaceOnMap_Widget_y
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Widget_PlaceOnMap_Widget_posY
	clc
	adc localVariable_Widget_PlaceOnMap_Widget_Height
	 ; end add / sub var with constant
	cmp localVariable_Widget_PlaceOnMap_Widget_y ;keep
	bne Widget_PlaceOnMap_forloop132
Widget_PlaceOnMap_loopdone143: ;keep
	rts
block1
EndSymbol
	; End of program
	; Ending memory block
EndBlock116
