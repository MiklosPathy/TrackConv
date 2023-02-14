 processor 6502
	org $1000
	; Starting new memory block at $1000
ELFO
	jmp block1
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_DOWNDURATION	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_KEYSYNC	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXDURATION	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXLEVEL	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINDURATION	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINLEVEL	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_REPEATE	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_UPDURATION	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter	dc.b	0
	    dc.b 0,0,0
ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state	dc.b	0
	    dc.b 0,0,0
	; ***********  Defining procedure : ELFO_setUPDURATION
	;    Procedure type : User-defined procedure
localVariable_ELFO_setUPDURATION_ELFO_elfo	dc.b	
localVariable_ELFO_setUPDURATION_ELFO_value	dc.b	
ELFO_setUPDURATION_block2
ELFO_setUPDURATION
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setUPDURATION_ELFO_value
	; Compare with pure num / var optimization
	cmp #$3f;keep
	bcc ELFO_setUPDURATION_elsedoneblock6
	beq ELFO_setUPDURATION_elsedoneblock6
ELFO_setUPDURATION_ConditionalTrueBlock4: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setUPDURATION_ELFO_value
	lda #$3f
	; Calling storevariable
	sta localVariable_ELFO_setUPDURATION_ELFO_value
ELFO_setUPDURATION_elsedoneblock6
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_UPDURATION
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$3f
	sec
	sbc localVariable_ELFO_setUPDURATION_ELFO_value
	 ; end add / sub var with constant
	; Calling storevariable
	ldx localVariable_ELFO_setUPDURATION_ELFO_elfo ; optimized, look out for bugs
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_UPDURATION,x
	rts
	; ***********  Defining procedure : ELFO_setMAXLEVEL
	;    Procedure type : User-defined procedure
localVariable_ELFO_setMAXLEVEL_ELFO_elfo	dc.b	
localVariable_ELFO_setMAXLEVEL_ELFO_value	dc.b	
ELFO_setMAXLEVEL_block9
ELFO_setMAXLEVEL
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setMAXLEVEL_ELFO_value
	; Compare with pure num / var optimization
	cmp #$3f;keep
	bcc ELFO_setMAXLEVEL_elsedoneblock13
	beq ELFO_setMAXLEVEL_elsedoneblock13
ELFO_setMAXLEVEL_ConditionalTrueBlock11: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setMAXLEVEL_ELFO_value
	lda #$3f
	; Calling storevariable
	sta localVariable_ELFO_setMAXLEVEL_ELFO_value
ELFO_setMAXLEVEL_elsedoneblock13
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXLEVEL
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setMAXLEVEL_ELFO_elfo ; optimized, look out for bugs
	lda localVariable_ELFO_setMAXLEVEL_ELFO_value
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXLEVEL,x
	rts
	; ***********  Defining procedure : ELFO_setMAXDURATION
	;    Procedure type : User-defined procedure
localVariable_ELFO_setMAXDURATION_ELFO_elfo	dc.b	
localVariable_ELFO_setMAXDURATION_ELFO_value	dc.b	
ELFO_setMAXDURATION_block16
ELFO_setMAXDURATION
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setMAXDURATION_ELFO_value
	; Compare with pure num / var optimization
	cmp #$3f;keep
	bcc ELFO_setMAXDURATION_elsedoneblock20
	beq ELFO_setMAXDURATION_elsedoneblock20
ELFO_setMAXDURATION_ConditionalTrueBlock18: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setMAXDURATION_ELFO_value
	lda #$3f
	; Calling storevariable
	sta localVariable_ELFO_setMAXDURATION_ELFO_value
ELFO_setMAXDURATION_elsedoneblock20
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXDURATION
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setMAXDURATION_ELFO_elfo ; optimized, look out for bugs
	lda localVariable_ELFO_setMAXDURATION_ELFO_value
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXDURATION,x
	rts
	; ***********  Defining procedure : ELFO_setDOWNDURATION
	;    Procedure type : User-defined procedure
localVariable_ELFO_setDOWNDURATION_ELFO_elfo	dc.b	
localVariable_ELFO_setDOWNDURATION_ELFO_value	dc.b	
ELFO_setDOWNDURATION_block23
ELFO_setDOWNDURATION
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setDOWNDURATION_ELFO_value
	; Compare with pure num / var optimization
	cmp #$3f;keep
	bcc ELFO_setDOWNDURATION_elsedoneblock27
	beq ELFO_setDOWNDURATION_elsedoneblock27
ELFO_setDOWNDURATION_ConditionalTrueBlock25: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setDOWNDURATION_ELFO_value
	lda #$3f
	; Calling storevariable
	sta localVariable_ELFO_setDOWNDURATION_ELFO_value
ELFO_setDOWNDURATION_elsedoneblock27
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_DOWNDURATION
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$3f
	sec
	sbc localVariable_ELFO_setDOWNDURATION_ELFO_value
	 ; end add / sub var with constant
	; Calling storevariable
	ldx localVariable_ELFO_setDOWNDURATION_ELFO_elfo ; optimized, look out for bugs
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_DOWNDURATION,x
	rts
	; ***********  Defining procedure : ELFO_setMINLEVEL
	;    Procedure type : User-defined procedure
localVariable_ELFO_setMINLEVEL_ELFO_elfo	dc.b	
localVariable_ELFO_setMINLEVEL_ELFO_value	dc.b	
ELFO_setMINLEVEL_block30
ELFO_setMINLEVEL
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setMINLEVEL_ELFO_value
	; Compare with pure num / var optimization
	cmp #$3f;keep
	bcc ELFO_setMINLEVEL_elsedoneblock34
	beq ELFO_setMINLEVEL_elsedoneblock34
ELFO_setMINLEVEL_ConditionalTrueBlock32: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setMINLEVEL_ELFO_value
	lda #$3f
	; Calling storevariable
	sta localVariable_ELFO_setMINLEVEL_ELFO_value
ELFO_setMINLEVEL_elsedoneblock34
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINLEVEL
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setMINLEVEL_ELFO_elfo ; optimized, look out for bugs
	lda localVariable_ELFO_setMINLEVEL_ELFO_value
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINLEVEL,x
	rts
	; ***********  Defining procedure : ELFO_setMINDURATION
	;    Procedure type : User-defined procedure
localVariable_ELFO_setMINDURATION_ELFO_elfo	dc.b	
localVariable_ELFO_setMINDURATION_ELFO_value	dc.b	
ELFO_setMINDURATION_block37
ELFO_setMINDURATION
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setMINDURATION_ELFO_value
	; Compare with pure num / var optimization
	cmp #$3f;keep
	bcc ELFO_setMINDURATION_elsedoneblock41
	beq ELFO_setMINDURATION_elsedoneblock41
ELFO_setMINDURATION_ConditionalTrueBlock39: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setMINDURATION_ELFO_value
	lda #$3f
	; Calling storevariable
	sta localVariable_ELFO_setMINDURATION_ELFO_value
ELFO_setMINDURATION_elsedoneblock41
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINDURATION
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setMINDURATION_ELFO_elfo ; optimized, look out for bugs
	lda localVariable_ELFO_setMINDURATION_ELFO_value
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINDURATION,x
	rts
	; ***********  Defining procedure : ELFO_setKEYSYNC
	;    Procedure type : User-defined procedure
localVariable_ELFO_setKEYSYNC_ELFO_elfo	dc.b	
localVariable_ELFO_setKEYSYNC_ELFO_value	dc.b	
ELFO_setKEYSYNC_block44
ELFO_setKEYSYNC
	; Binary clause Simplified: GREATER
	lda localVariable_ELFO_setKEYSYNC_ELFO_value
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc ELFO_setKEYSYNC_elsedoneblock48
	beq ELFO_setKEYSYNC_elsedoneblock48
ELFO_setKEYSYNC_ConditionalTrueBlock46: ;Main true block ;keep 
	; Assigning single variable : localVariable_ELFO_setKEYSYNC_ELFO_value
	lda #$1
	; Calling storevariable
	sta localVariable_ELFO_setKEYSYNC_ELFO_value
ELFO_setKEYSYNC_elsedoneblock48
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_KEYSYNC
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setKEYSYNC_ELFO_elfo ; optimized, look out for bugs
	lda localVariable_ELFO_setKEYSYNC_ELFO_value
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_KEYSYNC,x
	rts
	; ***********  Defining procedure : ELFO_setREPEATE
	;    Procedure type : User-defined procedure
localVariable_ELFO_setREPEATE_ELFO_elfo	dc.b	
localVariable_ELFO_setREPEATE_ELFO_value	dc.b	
ELFO_setREPEATE_block51
ELFO_setREPEATE
	; Binary clause Simplified: EQUALS
	lda localVariable_ELFO_setREPEATE_ELFO_value
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne ELFO_setREPEATE_elsedoneblock55
ELFO_setREPEATE_ConditionalTrueBlock53: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_REPEATE
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setREPEATE_ELFO_elfo ; optimized, look out for bugs
	lda #$0
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_REPEATE,x
	rts
ELFO_setREPEATE_elsedoneblock55
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_setREPEATE_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne ELFO_setREPEATE_elsedoneblock61
ELFO_setREPEATE_ConditionalTrueBlock59: ;Main true block ;keep 
	
; //if ELFOz[elfo].REPEATE=1 then return();
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setREPEATE_ELFO_elfo ; optimized, look out for bugs
	lda #$1
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
ELFO_setREPEATE_elsedoneblock61
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_REPEATE
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_setREPEATE_ELFO_elfo ; optimized, look out for bugs
	lda #$1
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_REPEATE,x
	rts
	; ***********  Defining procedure : ELFO_KeyDown
	;    Procedure type : User-defined procedure
localVariable_ELFO_KeyDown_ELFO_elfo	dc.b	
ELFO_KeyDown_block64
ELFO_KeyDown
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_KeyDown_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_KEYSYNC,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne ELFO_KeyDown_elsedoneblock68
ELFO_KeyDown_ConditionalTrueBlock66: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_KeyDown_ELFO_elfo ; optimized, look out for bugs
	lda #$1
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; Load Byte array
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINLEVEL,x
	; Calling storevariable
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
ELFO_KeyDown_elsedoneblock68
	rts
	; ***********  Defining procedure : ELFO_KeyUp
	;    Procedure type : User-defined procedure
localVariable_ELFO_KeyUp_ELFO_elfo	dc.b	
ELFO_KeyUp_block71
ELFO_KeyUp
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_KeyUp_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_KEYSYNC,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne ELFO_KeyUp_elsedoneblock75
ELFO_KeyUp_ConditionalTrueBlock73: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_KeyUp_ELFO_elfo ; optimized, look out for bugs
	lda #$3
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
ELFO_KeyUp_elsedoneblock75
	rts
	; ***********  Defining procedure : ELFO_getCurrentValue
	;    Procedure type : User-defined procedure
localVariable_ELFO_getCurrentValue_ELFO_elfo	dc.b	
ELFO_getCurrentValue_block78
ELFO_getCurrentValue
	; Load Byte array
	ldx localVariable_ELFO_getCurrentValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	rts
	rts
	; ***********  Defining procedure : ELFO_CalcNextValue
	;    Procedure type : User-defined procedure
localVariable_ELFO_CalcNextValue_ELFO_elfo	dc.b	
ELFO_CalcNextValue_block79
ELFO_CalcNextValue
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne ELFO_CalcNextValue_elsedoneblock83
ELFO_CalcNextValue_ConditionalTrueBlock81: ;Main true block ;keep 
	rts
ELFO_CalcNextValue_elsedoneblock83
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne ELFO_CalcNextValue_elsedoneblock89
ELFO_CalcNextValue_ConditionalTrueBlock87: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	clc
	; Load Byte array
	adc ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_UPDURATION,x
	 ; end add / sub var with constant
	; Calling storevariable
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	; Binary clause Simplified: GREATEREQUAL
	; Load Byte array
ELFO_CalcNextValue_binary_clause_temp_var105 = $24
	sta ELFO_CalcNextValue_binary_clause_temp_var105
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXLEVEL,x
ELFO_CalcNextValue_binary_clause_temp_2_var106 = $26
	sta ELFO_CalcNextValue_binary_clause_temp_2_var106
	lda ELFO_CalcNextValue_binary_clause_temp_var105
	cmp ELFO_CalcNextValue_binary_clause_temp_2_var106;keep
	bcc ELFO_CalcNextValue_elsedoneblock103
ELFO_CalcNextValue_ConditionalTrueBlock101: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXLEVEL,x
	; Calling storevariable
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	lda #$2
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter
	; Store Variable simplified optimization : right-hand term is pure
	lda #$0
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter,x
ELFO_CalcNextValue_elsedoneblock103
	rts
ELFO_CalcNextValue_elsedoneblock89
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Compare with pure num / var optimization
	cmp #$2;keep
	bne ELFO_CalcNextValue_elsedoneblock111
ELFO_CalcNextValue_ConditionalTrueBlock109: ;Main true block ;keep 
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo ; optimized, look out for bugs
	inc ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter,x
	; Binary clause Simplified: GREATEREQUAL
	; Load Byte array
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter,x
ELFO_CalcNextValue_binary_clause_temp_var129 = $24
	sta ELFO_CalcNextValue_binary_clause_temp_var129
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MAXDURATION,x
ELFO_CalcNextValue_binary_clause_temp_2_var130 = $26
	sta ELFO_CalcNextValue_binary_clause_temp_2_var130
	lda ELFO_CalcNextValue_binary_clause_temp_var129
	cmp ELFO_CalcNextValue_binary_clause_temp_2_var130;keep
	bcc ELFO_CalcNextValue_elsedoneblock127
ELFO_CalcNextValue_ConditionalTrueBlock125: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo ; optimized, look out for bugs
	lda #$3
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
ELFO_CalcNextValue_elsedoneblock127
	rts
ELFO_CalcNextValue_elsedoneblock111
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Compare with pure num / var optimization
	cmp #$3;keep
	bne ELFO_CalcNextValue_localfailed145
	jmp ELFO_CalcNextValue_ConditionalTrueBlock133
ELFO_CalcNextValue_localfailed145
	jmp ELFO_CalcNextValue_elsedoneblock135
ELFO_CalcNextValue_ConditionalTrueBlock133: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; Optimizer: a = a +/- b
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	clc
	adc #$7f
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	sec
	; Load Byte array
	sbc ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_DOWNDURATION,x
	 ; end add / sub var with constant
	; Calling storevariable
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	; Binary clause Simplified: LESSEQUAL
	; Load Byte array
ELFO_CalcNextValue_binary_clause_temp_var152 = $24
	sta ELFO_CalcNextValue_binary_clause_temp_var152
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINLEVEL,x
	clc
	adc #$7f
	 ; end add / sub var with constant
ELFO_CalcNextValue_binary_clause_temp_2_var153 = $26
	sta ELFO_CalcNextValue_binary_clause_temp_2_var153
	lda ELFO_CalcNextValue_binary_clause_temp_var152
	cmp ELFO_CalcNextValue_binary_clause_temp_2_var153;keep
	beq ELFO_CalcNextValue_ConditionalTrueBlock148
	bcs ELFO_CalcNextValue_elsedoneblock150
ELFO_CalcNextValue_ConditionalTrueBlock148: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINLEVEL,x
	; Calling storevariable
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	lda #$4
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter
	; Store Variable simplified optimization : right-hand term is pure
	lda #$0
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter,x
	rts
ELFO_CalcNextValue_elsedoneblock150
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue
	; Optimizer: a = a +/- b
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	sec
	sbc #$7f
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_currentvalue,x
	rts
ELFO_CalcNextValue_elsedoneblock135
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	; Compare with pure num / var optimization
	cmp #$4;keep
	bne ELFO_CalcNextValue_elsedoneblock158
ELFO_CalcNextValue_ConditionalTrueBlock156: ;Main true block ;keep 
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo ; optimized, look out for bugs
	inc ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter,x
	; Binary clause Simplified: GREATEREQUAL
	; Load Byte array
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_durationcounter,x
ELFO_CalcNextValue_binary_clause_temp_var200 = $24
	sta ELFO_CalcNextValue_binary_clause_temp_var200
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_MINDURATION,x
ELFO_CalcNextValue_binary_clause_temp_2_var201 = $26
	sta ELFO_CalcNextValue_binary_clause_temp_2_var201
	lda ELFO_CalcNextValue_binary_clause_temp_var200
	cmp ELFO_CalcNextValue_binary_clause_temp_2_var201;keep
	bcc ELFO_CalcNextValue_elsedoneblock190
ELFO_CalcNextValue_ConditionalTrueBlock188: ;Main true block ;keep 
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo
	lda ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_REPEATE,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne ELFO_CalcNextValue_elseblock205
ELFO_CalcNextValue_ConditionalTrueBlock204: ;Main true block ;keep 
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo ; optimized, look out for bugs
	lda #$1
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
	jmp ELFO_CalcNextValue_elsedoneblock206
ELFO_CalcNextValue_elseblock205
	; Assigning single variable : ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_ELFO_CalcNextValue_ELFO_elfo ; optimized, look out for bugs
	lda #$0
	sta ELFO_ELFOz_ELFO_tELFO_ELFO_tELFO_state,x
ELFO_CalcNextValue_elsedoneblock206
ELFO_CalcNextValue_elsedoneblock190
	rts
ELFO_CalcNextValue_elsedoneblock158
	rts
block1
EndSymbol
	; End of program
	; Ending memory block
EndBlock558
