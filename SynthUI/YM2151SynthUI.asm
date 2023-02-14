 processor 6502
	org $1000
	; Starting new memory block at $1000
YM2151SynthUI
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
YM2151_Normal2YMNote	dc.b $0e, $00, $01, $02, $04, $05, $06, $08
	dc.b $09, $0a, $0c, $0d
YM2151_YMLastState	dc.b	 
	org YM2151_YMLastState+256
YM2151_YMReg = $9fe0
YM2151_YMData = $9fe1
YM2151_opmask	dc.b	$78
X16Mouse_Buttons	dc.b	
X16Mouse_X	dc.w	
X16Mouse_Y	dc.w	
X16Mouse_Xch	dc.b	
X16Mouse_Ych	dc.b	
X16Mouse_mouseXchposAtClick	dc.b	
X16Mouse_mouseYchposAtClick	dc.b	
X16Mouse_mouseClicked	dc.b	
Input_key	dc.b	
Input_lastkey	dc.b	
Input_note	dc.b	
Input_octave	dc.b	
Widget_Map	dc.b	 
	org Widget_Map+4800
Label_labels_Label_tLabel_Label_tLabel_Color	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Label_labels_Label_tLabel_Label_tLabel_Value	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Label_labels_Label_tLabel_Label_tLabel_posX	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Label_labels_Label_tLabel_Label_tLabel_posY	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_AttachedLabel	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_Color	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_Length_	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_Max_	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_Mode	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_NeedToSetValueLater	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_PrevValue	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_SetValueLater	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_Value	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_posX	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_sliders_Slider_tSlider_Slider_tSlider_posY	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Slider_clickedSlider	dc.b	$ff
Button_buttons_Button_tButton_Button_tButton_Color	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Button_buttons_Button_tButton_Button_tButton_Height	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Button_buttons_Button_tButton_Button_tButton_Label_	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Button_buttons_Button_tButton_Button_tButton_Width	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Button_buttons_Button_tButton_Button_tButton_posX	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Button_buttons_Button_tButton_Button_tButton_posY	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOff	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOn	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Height	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Width	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posX	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posY	dc.b	0
	    dc.b 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CheckBox_clickedcheckbox	dc.b	$ff
Conn_Xpos	dc.b	$3c
Conn_Ypos	dc.b	$28
Conn_Color	dc.b	$01
Conn_LastCon	dc.b	$ff
Conn_c00		dc.b	49
	dc.b	67
	dc.b	51
	dc.b	67
	dc.b	50
	dc.b	67
	dc.b	52
	dc.b	67
	dc.b	87
	dc.b	0
Conn_c10		dc.b	49
	dc.b	110
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	0
Conn_c11		dc.b	32
	dc.b	107
	dc.b	50
	dc.b	67
	dc.b	52
	dc.b	67
	dc.b	87
	dc.b	0
Conn_c12		dc.b	51
	dc.b	125
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	0
Conn_c20		dc.b	50
	dc.b	67
	dc.b	51
	dc.b	110
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	0
Conn_c21		dc.b	32
	dc.b	32
	dc.b	32
	dc.b	107
	dc.b	52
	dc.b	67
	dc.b	87
	dc.b	0
Conn_c22		dc.b	32
	dc.b	32
	dc.b	49
	dc.b	125
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	0
Conn_c30		dc.b	49
	dc.b	67
	dc.b	50
	dc.b	110
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	0
Conn_c31		dc.b	32
	dc.b	32
	dc.b	32
	dc.b	107
	dc.b	52
	dc.b	67
	dc.b	87
	dc.b	0
Conn_c32		dc.b	32
	dc.b	32
	dc.b	51
	dc.b	125
	dc.b	32
	dc.b	32
	dc.b	32
	dc.b	0
Conn_c40		dc.b	49
	dc.b	67
	dc.b	51
	dc.b	110
	dc.b	32
	dc.b	0
Conn_c41		dc.b	32
	dc.b	32
	dc.b	32
	dc.b	107
	dc.b	87
	dc.b	0
Conn_c42		dc.b	50
	dc.b	67
	dc.b	52
	dc.b	125
	dc.b	32
	dc.b	0
Conn_c50		dc.b	49
	dc.b	114
	dc.b	50
	dc.b	110
	dc.b	32
	dc.b	0
Conn_c51		dc.b	32
	dc.b	66
	dc.b	32
	dc.b	66
	dc.b	32
	dc.b	0
Conn_c52		dc.b	32
	dc.b	107
	dc.b	51
	dc.b	91
	dc.b	87
	dc.b	0
Conn_c53		dc.b	32
	dc.b	66
	dc.b	32
	dc.b	66
	dc.b	32
	dc.b	0
Conn_c54		dc.b	32
	dc.b	109
	dc.b	52
	dc.b	125
	dc.b	32
	dc.b	0
Conn_c60		dc.b	49
	dc.b	67
	dc.b	50
	dc.b	110
	dc.b	32
	dc.b	0
Conn_c61		dc.b	32
	dc.b	32
	dc.b	32
	dc.b	66
	dc.b	32
	dc.b	0
Conn_c62		dc.b	32
	dc.b	32
	dc.b	51
	dc.b	91
	dc.b	87
	dc.b	0
Conn_c63		dc.b	32
	dc.b	32
	dc.b	32
	dc.b	66
	dc.b	32
	dc.b	0
Conn_c64		dc.b	32
	dc.b	32
	dc.b	52
	dc.b	125
	dc.b	32
	dc.b	0
Conn_c70		dc.b	49
	dc.b	110
	dc.b	32
	dc.b	0
Conn_c71		dc.b	32
	dc.b	66
	dc.b	32
	dc.b	0
Conn_c72		dc.b	50
	dc.b	115
	dc.b	32
	dc.b	0
Conn_c73		dc.b	32
	dc.b	107
	dc.b	87
	dc.b	0
Conn_c74		dc.b	51
	dc.b	115
	dc.b	32
	dc.b	0
Conn_c75		dc.b	32
	dc.b	66
	dc.b	32
	dc.b	0
Conn_c76		dc.b	52
	dc.b	125
	dc.b	32
	dc.b	0
transpose	dc.b	$00
holdkey	dc.b	$00
currentchanel	dc.b	$00
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_AMSEN	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_AR	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D1L	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D1R	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D2R	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_DT1	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_DT2	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_KEYON	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_KS	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_MUL	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_RR	dc.b	0
	    dc.b 0,0,0
YM2151OpStats_tYM2151OpStat_tYM2151OpStat_TL	dc.b	0
	    dc.b 0,0,0
YM2151State_tYM2151State_tYM2151State_AMS	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_CON	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_FB	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_L	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_LFRQ	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_PMDAMD	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_PMS	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_R	dc.b	0
	    dc.b 
YM2151State_tYM2151State_tYM2151State_W	dc.b	0
	    dc.b 
	; ***********  Defining procedure : init16x8div
	;    Procedure type : Built-in function
	;    Requires initialization : no
initdiv16x8_divisor = $4c     ;$59 used for hi-byte
initdiv16x8_dividend = $4e	  ;$fc used for hi-byte
initdiv16x8_remainder = $50	  ;$fe used for hi-byte
initdiv16x8_result = $4e ;save memory by reusing divident to store the result
divide16x8	lda #0	        ;preset remainder to 0
	sta initdiv16x8_remainder
	sta initdiv16x8_remainder+1
	ldx #16	        ;repeat for each bit: ...
divloop16	asl initdiv16x8_dividend	;dividend lb & hb*2, msb -> Carry
	rol initdiv16x8_dividend+1
	rol initdiv16x8_remainder	;remainder lb & hb * 2 + msb from carry
	rol initdiv16x8_remainder+1
	lda initdiv16x8_remainder
	sec
	sbc initdiv16x8_divisor	;substract divisor to see if it fits in
	tay	        ;lb result -> Y, for we may need it later
	lda initdiv16x8_remainder+1
	sbc initdiv16x8_divisor+1
	bcc skip16	;if carry=0 then divisor didn't fit in yet
	sta initdiv16x8_remainder+1	;else save substraction result as new remainder,
	sty initdiv16x8_remainder
	inc initdiv16x8_result	;and INCrement result cause divisor fit in 1 times
skip16	dex
	bne divloop16
	rts
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
	; ***********  Defining procedure : init8x8div
	;    Procedure type : Built-in function
	;    Requires initialization : no
div8x8_c = $4c
div8x8_d = $4e
div8x8_e = $50
	; Normal 8x8 bin div
div8x8_procedure
	lda #$00
	ldx #$07
	clc
div8x8_loop1 rol div8x8_d
	rol
	cmp div8x8_c
	bcc div8x8_loop2
	sbc div8x8_c
div8x8_loop2 dex
	bpl div8x8_loop1
	rol div8x8_d
	lda div8x8_d
div8x8_def_end
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
	; ***********  Defining procedure : YM2151_SetReg
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetReg_YM2151_reg	dc.b	
localVariable_YM2151_SetReg_YM2151_data	dc.b	
YM2151_SetReg_block94
YM2151_SetReg
	; Assigning single variable : YM2151_YMReg
	lda localVariable_YM2151_SetReg_YM2151_reg
	; Calling storevariable
	sta YM2151_YMReg
	; Assigning single variable : YM2151_YMData
	lda localVariable_YM2151_SetReg_YM2151_data
	; Calling storevariable
	sta YM2151_YMData
	; Assigning single variable : YM2151_YMLastState
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_YM2151_SetReg_YM2151_reg ; optimized, look out for bugs
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$41
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	lda localVariable_YM2151_SetReg_YM2151_reg
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_X
	lda #$46
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_Y
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_Number
	lda localVariable_YM2151_SetReg_YM2151_data
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_Col
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_Col
	jsr SCF_DrawBinByte
	rts
	
; //TODO Noise... TODO? Eh... 
	; ***********  Defining procedure : YM2151_SetLFRQ
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetLFRQ_YM2151_data	dc.b	
YM2151_SetLFRQ_block95
YM2151_SetLFRQ
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda #$18
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetLFRQ_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetPMDAMD
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetPMDAMD_YM2151_data	dc.b	
YM2151_SetPMDAMD_block96
YM2151_SetPMDAMD
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda #$19
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetPMDAMD_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetW
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetW_YM2151_data	dc.b	
YM2151_SetW_block97
YM2151_SetW
	; Assigning single variable : localVariable_YM2151_SetW_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetW_YM2151_data
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetW_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx #$1b
	lda YM2151_YMLastState,x
	and #$fc
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState+#$1b
	; Assigning single variable : localVariable_YM2151_SetW_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	lda YM2151_YMLastState,x
	ora localVariable_YM2151_SetW_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetW_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda #$1b
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetW_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetR
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetR_YM2151_reg	dc.b	
localVariable_YM2151_SetR_YM2151_chn	dc.b	
localVariable_YM2151_SetR_YM2151_data	dc.b	
YM2151_SetR_block98
YM2151_SetR
	; Assigning single variable : localVariable_YM2151_SetR_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$20
	clc
	adc localVariable_YM2151_SetR_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetR_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetR_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetR_YM2151_data
	and #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetR_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetR_YM2151_data
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetR_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetR_YM2151_reg
	lda YM2151_YMLastState,x
	and #$7f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetR_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetR_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetR_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetR_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetR_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetL
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetL_YM2151_reg	dc.b	
localVariable_YM2151_SetL_YM2151_chn	dc.b	
localVariable_YM2151_SetL_YM2151_data	dc.b	
YM2151_SetL_block99
YM2151_SetL
	; Assigning single variable : localVariable_YM2151_SetL_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$20
	clc
	adc localVariable_YM2151_SetL_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetL_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetL_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetL_YM2151_data
	and #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetL_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetL_YM2151_data
	asl
	asl
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetL_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetL_YM2151_reg
	lda YM2151_YMLastState,x
	and #$bf
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetL_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetL_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetL_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetL_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetL_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetFB
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetFB_YM2151_reg	dc.b	
localVariable_YM2151_SetFB_YM2151_chn	dc.b	
localVariable_YM2151_SetFB_YM2151_data	dc.b	
YM2151_SetFB_block100
YM2151_SetFB
	; Assigning single variable : localVariable_YM2151_SetFB_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$20
	clc
	adc localVariable_YM2151_SetFB_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetFB_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetFB_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetFB_YM2151_data
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetFB_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetFB_YM2151_data
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetFB_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetFB_YM2151_reg
	lda YM2151_YMLastState,x
	and #$c7
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetFB_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetFB_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetFB_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetFB_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetFB_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetCON
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetCON_YM2151_reg	dc.b	
localVariable_YM2151_SetCON_YM2151_chn	dc.b	
localVariable_YM2151_SetCON_YM2151_data	dc.b	
YM2151_SetCON_block101
YM2151_SetCON
	; Assigning single variable : localVariable_YM2151_SetCON_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$20
	clc
	adc localVariable_YM2151_SetCON_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetCON_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetCON_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetCON_YM2151_data
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetCON_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetCON_YM2151_reg
	lda YM2151_YMLastState,x
	and #$f8
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetCON_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetCON_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetCON_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetCON_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetCON_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetPMS
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetPMS_YM2151_reg	dc.b	
localVariable_YM2151_SetPMS_YM2151_chn	dc.b	
localVariable_YM2151_SetPMS_YM2151_data	dc.b	
YM2151_SetPMS_block102
YM2151_SetPMS
	; Assigning single variable : localVariable_YM2151_SetPMS_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$38
	clc
	adc localVariable_YM2151_SetPMS_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetPMS_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetPMS_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetPMS_YM2151_data
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetPMS_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetPMS_YM2151_data
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetPMS_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetPMS_YM2151_reg
	lda YM2151_YMLastState,x
	and #$8f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetPMS_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetPMS_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetPMS_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetPMS_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetPMS_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetAMS
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetAMS_YM2151_reg	dc.b	
localVariable_YM2151_SetAMS_YM2151_chn	dc.b	
localVariable_YM2151_SetAMS_YM2151_data	dc.b	
YM2151_SetAMS_block103
YM2151_SetAMS
	; Assigning single variable : localVariable_YM2151_SetAMS_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$38
	clc
	adc localVariable_YM2151_SetAMS_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMS_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetAMS_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAMS_YM2151_data
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMS_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetAMS_YM2151_reg
	lda YM2151_YMLastState,x
	and #$fc
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetAMS_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetAMS_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMS_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetAMS_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetAMS_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetDT1
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetDT1_YM2151_reg	dc.b	
localVariable_YM2151_SetDT1_YM2151_chn	dc.b	
localVariable_YM2151_SetDT1_YM2151_opr	dc.b	
localVariable_YM2151_SetDT1_YM2151_data	dc.b	
YM2151_SetDT1_block104
YM2151_SetDT1
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT1_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT1_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT1_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$40
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetDT1_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT1_YM2151_data
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_data
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetDT1_YM2151_reg
	lda YM2151_YMLastState,x
	and #$8f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetDT1_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetDT1_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetDT1_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetMUL
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetMUL_YM2151_reg	dc.b	
localVariable_YM2151_SetMUL_YM2151_chn	dc.b	
localVariable_YM2151_SetMUL_YM2151_opr	dc.b	
localVariable_YM2151_SetMUL_YM2151_data	dc.b	
YM2151_SetMUL_block105
YM2151_SetMUL
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetMUL_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetMUL_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetMUL_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$40
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetMUL_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetMUL_YM2151_data
	and #$f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetMUL_YM2151_reg
	lda YM2151_YMLastState,x
	and #$f0
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetMUL_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetMUL_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetMUL_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetTL
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetTL_YM2151_reg	dc.b	
localVariable_YM2151_SetTL_YM2151_chn	dc.b	
localVariable_YM2151_SetTL_YM2151_opr	dc.b	
localVariable_YM2151_SetTL_YM2151_data	dc.b	
YM2151_SetTL_block106
YM2151_SetTL
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetTL_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetTL_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetTL_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$60
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetTL_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetTL_YM2151_data
	and #$7f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetTL_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetTL_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetKS
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetKS_YM2151_reg	dc.b	
localVariable_YM2151_SetKS_YM2151_chn	dc.b	
localVariable_YM2151_SetKS_YM2151_opr	dc.b	
localVariable_YM2151_SetKS_YM2151_data	dc.b	
YM2151_SetKS_block107
YM2151_SetKS
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetKS_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetKS_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetKS_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$80
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetKS_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetKS_YM2151_data
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_data
	asl
	asl
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetKS_YM2151_reg
	lda YM2151_YMLastState,x
	and #$3f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetKS_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetKS_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetKS_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetAR
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetAR_YM2151_reg	dc.b	
localVariable_YM2151_SetAR_YM2151_chn	dc.b	
localVariable_YM2151_SetAR_YM2151_opr	dc.b	
localVariable_YM2151_SetAR_YM2151_data	dc.b	
YM2151_SetAR_block108
YM2151_SetAR
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAR_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAR_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAR_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$80
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetAR_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAR_YM2151_data
	and #$1f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetAR_YM2151_reg
	lda YM2151_YMLastState,x
	and #$e0
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetAR_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetAR_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetAR_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetAMSEN
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetAMSEN_YM2151_reg	dc.b	
localVariable_YM2151_SetAMSEN_YM2151_chn	dc.b	
localVariable_YM2151_SetAMSEN_YM2151_opr	dc.b	
localVariable_YM2151_SetAMSEN_YM2151_data	dc.b	
YM2151_SetAMSEN_block109
YM2151_SetAMSEN
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAMSEN_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAMSEN_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAMSEN_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$a0
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetAMSEN_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAMSEN_YM2151_data
	and #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_data
	asl
	asl
	asl
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetAMSEN_YM2151_reg
	lda YM2151_YMLastState,x
	and #$7f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetAMSEN_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetAMSEN_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetAMSEN_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetD1R
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetD1R_YM2151_reg	dc.b	
localVariable_YM2151_SetD1R_YM2151_chn	dc.b	
localVariable_YM2151_SetD1R_YM2151_opr	dc.b	
localVariable_YM2151_SetD1R_YM2151_data	dc.b	
YM2151_SetD1R_block110
YM2151_SetD1R
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1R_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1R_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1R_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$a0
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetD1R_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1R_YM2151_data
	and #$1f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetD1R_YM2151_reg
	lda YM2151_YMLastState,x
	and #$e0
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetD1R_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetD1R_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetD1R_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetDT2
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetDT2_YM2151_reg	dc.b	
localVariable_YM2151_SetDT2_YM2151_chn	dc.b	
localVariable_YM2151_SetDT2_YM2151_opr	dc.b	
localVariable_YM2151_SetDT2_YM2151_data	dc.b	
YM2151_SetDT2_block111
YM2151_SetDT2
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT2_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT2_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT2_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$c0
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetDT2_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetDT2_YM2151_data
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_data
	asl
	asl
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetDT2_YM2151_reg
	lda YM2151_YMLastState,x
	and #$3f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetDT2_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetDT2_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetDT2_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetD2R
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetD2R_YM2151_reg	dc.b	
localVariable_YM2151_SetD2R_YM2151_chn	dc.b	
localVariable_YM2151_SetD2R_YM2151_opr	dc.b	
localVariable_YM2151_SetD2R_YM2151_data	dc.b	
YM2151_SetD2R_block112
YM2151_SetD2R
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD2R_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD2R_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD2R_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$c0
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetD2R_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD2R_YM2151_data
	and #$1f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetD2R_YM2151_reg
	lda YM2151_YMLastState,x
	and #$e0
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetD2R_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetD2R_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetD2R_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetD1L
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetD1L_YM2151_reg	dc.b	
localVariable_YM2151_SetD1L_YM2151_chn	dc.b	
localVariable_YM2151_SetD1L_YM2151_opr	dc.b	
localVariable_YM2151_SetD1L_YM2151_data	dc.b	
YM2151_SetD1L_block113
YM2151_SetD1L
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1L_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1L_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1L_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$e0
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetD1L_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetD1L_YM2151_data
	and #$f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_data
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetD1L_YM2151_reg
	lda YM2151_YMLastState,x
	and #$f
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetD1L_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetD1L_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetD1L_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetRR
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetRR_YM2151_reg	dc.b	
localVariable_YM2151_SetRR_YM2151_chn	dc.b	
localVariable_YM2151_SetRR_YM2151_opr	dc.b	
localVariable_YM2151_SetRR_YM2151_data	dc.b	
YM2151_SetRR_block114
YM2151_SetRR
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_opr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetRR_YM2151_opr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetRR_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetRR_YM2151_opr
	asl
	asl
	asl
	clc
	adc #$e0
	 ; end add / sub var with constant
	clc
	adc localVariable_YM2151_SetRR_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetRR_YM2151_data
	and #$f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_data
	; Assigning single variable : YM2151_YMLastState
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetRR_YM2151_reg
	lda YM2151_YMLastState,x
	and #$f0
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_YMLastState,x
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ora localVariable_YM2151_SetRR_YM2151_data
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_data
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_SetRR_YM2151_reg
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_SetRR_YM2151_data
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetAtKeyOnOperatorEnabled
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_mask	dc.b	
localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_maskneg	dc.b	
localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr	dc.b	
localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_data	dc.b	
YM2151_SetAtKeyOnOperatorEnabled_block115
YM2151_SetAtKeyOnOperatorEnabled
	lda localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	cmp #$1 ;keep
	bne YM2151_SetAtKeyOnOperatorEnabled_casenext117
	; Assigning single variable : localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	lda #$2
	; Calling storevariable
	sta localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	jmp YM2151_SetAtKeyOnOperatorEnabled_caseend116
YM2151_SetAtKeyOnOperatorEnabled_casenext117
	lda localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	cmp #$2 ;keep
	bne YM2151_SetAtKeyOnOperatorEnabled_casenext119
	; Assigning single variable : localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	lda #$1
	; Calling storevariable
	sta localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	jmp YM2151_SetAtKeyOnOperatorEnabled_caseend116
YM2151_SetAtKeyOnOperatorEnabled_casenext119
YM2151_SetAtKeyOnOperatorEnabled_caseend116
	; Assigning single variable : localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_mask
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	clc
	adc #$3
	 ; end add / sub var with constant
	tax
	lda #$1
YM2151_SetAtKeyOnOperatorEnabled_lblShift121
	asl
	dex
	cpx #0
	bne YM2151_SetAtKeyOnOperatorEnabled_lblShift121
	; Calling storevariable
	sta localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_mask
	; Assigning single variable : localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_maskneg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$ff
	eor localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_mask
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_maskneg
	; Binary clause Simplified: EQUALS
	lda localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_data
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne YM2151_SetAtKeyOnOperatorEnabled_elseblock124
YM2151_SetAtKeyOnOperatorEnabled_ConditionalTrueBlock123: ;Main true block ;keep 
	; Assigning single variable : YM2151_opmask
	; 8 bit binop
	; Add/sub where right value is constant number
	lda YM2151_opmask
	and localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_maskneg
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_opmask
	jmp YM2151_SetAtKeyOnOperatorEnabled_elsedoneblock125
YM2151_SetAtKeyOnOperatorEnabled_elseblock124
	; Assigning single variable : YM2151_opmask
	; 8 bit binop
	; Add/sub where right value is constant number
	lda YM2151_opmask
	ora localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_mask
	 ; end add / sub var with constant
	; Calling storevariable
	sta YM2151_opmask
YM2151_SetAtKeyOnOperatorEnabled_elsedoneblock125
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda #$41
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<YM2151_SetAtKeyOnOperatorEnabled_stringassignstr130
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>YM2151_SetAtKeyOnOperatorEnabled_stringassignstr130
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_X
	lda #$46
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_Y
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_Number
	lda YM2151_opmask
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawBinByte_SCF_Col
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_DrawBinByte_SCF_Col
	jsr SCF_DrawBinByte
	rts
	; ***********  Defining procedure : YM2151_Reset
	;    Procedure type : User-defined procedure
localVariable_YM2151_Reset_YM2151_i	dc.b	
YM2151_Reset_block132
YM2151_Reset
	; Assigning single variable : localVariable_YM2151_Reset_YM2151_i
	lda #$0
	; Calling storevariable
	sta localVariable_YM2151_Reset_YM2151_i
YM2151_Reset_forloop133
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_Reset_YM2151_i
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda #$0
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	; IS ONPAGE
	inc localVariable_YM2151_Reset_YM2151_i
	lda #$5f
	cmp localVariable_YM2151_Reset_YM2151_i ;keep
	bcs YM2151_Reset_forloop133
YM2151_Reset_loopdone136: ;keep
	; Assigning single variable : localVariable_YM2151_Reset_YM2151_i
	lda #$60
	; Calling storevariable
	sta localVariable_YM2151_Reset_YM2151_i
YM2151_Reset_forloop137
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_Reset_YM2151_i
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda #$7f
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	; IS ONPAGE
	inc localVariable_YM2151_Reset_YM2151_i
	lda #$7f
	cmp localVariable_YM2151_Reset_YM2151_i ;keep
	bcs YM2151_Reset_forloop137
YM2151_Reset_loopdone140: ;keep
	; Assigning single variable : localVariable_YM2151_Reset_YM2151_i
	lda #$80
	; Calling storevariable
	sta localVariable_YM2151_Reset_YM2151_i
YM2151_Reset_forloop141
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_Reset_YM2151_i
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda #$0
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	; IS ONPAGE
	inc localVariable_YM2151_Reset_YM2151_i
	lda #$ff
	cmp localVariable_YM2151_Reset_YM2151_i ;keep
	bne YM2151_Reset_forloop141
YM2151_Reset_loopdone144: ;keep
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda localVariable_YM2151_Reset_YM2151_i
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda #$0
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_SetNote
	;    Procedure type : User-defined procedure
localVariable_YM2151_SetNote_YM2151_chn	dc.b	
localVariable_YM2151_SetNote_YM2151_octave	dc.b	
localVariable_YM2151_SetNote_YM2151_note	dc.b	
YM2151_SetNote_block145
YM2151_SetNote
	; Assigning single variable : localVariable_YM2151_SetNote_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_SetNote_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetNote_YM2151_chn
	; Binary clause Simplified: EQUALS
	lda localVariable_YM2151_SetNote_YM2151_note
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne YM2151_SetNote_elsedoneblock149
YM2151_SetNote_localsuccess152: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: GREATER
	lda localVariable_YM2151_SetNote_YM2151_octave
	; Compare with pure num / var optimization
	cmp #$0;keep
	bcc YM2151_SetNote_elsedoneblock149
	beq YM2151_SetNote_elsedoneblock149
YM2151_SetNote_ConditionalTrueBlock147: ;Main true block ;keep 
	dec localVariable_YM2151_SetNote_YM2151_octave
YM2151_SetNote_elsedoneblock149
	
; //YMidiotizm
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	clc
	adc localVariable_YM2151_SetNote_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	; 8 bit binop
	; Add/sub right value is variable/expression
	lda localVariable_YM2151_SetNote_YM2151_octave
	asl
	asl
	asl
	asl
YM2151_SetNote_rightvarAddSub_var155 = $24
	sta YM2151_SetNote_rightvarAddSub_var155
	; 8 bit binop
	; Add/sub where right value is constant number
	; Load Byte array
	ldx localVariable_YM2151_SetNote_YM2151_note
	lda YM2151_Normal2YMNote,x
	and #$f
	 ; end add / sub var with constant
	ora YM2151_SetNote_rightvarAddSub_var155
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_KeyOn
	;    Procedure type : User-defined procedure
localVariable_YM2151_KeyOn_YM2151_chn	dc.b	
YM2151_KeyOn_block156
YM2151_KeyOn
	; Assigning single variable : localVariable_YM2151_KeyOn_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_KeyOn_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_KeyOn_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda #$8
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	; 8 bit binop
	; Add/sub where right value is constant number
	lda YM2151_opmask
	ora localVariable_YM2151_KeyOn_YM2151_chn
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
	rts
	; ***********  Defining procedure : YM2151_KeyOff
	;    Procedure type : User-defined procedure
localVariable_YM2151_KeyOff_YM2151_chn	dc.b	
YM2151_KeyOff_block157
YM2151_KeyOff
	; Assigning single variable : localVariable_YM2151_KeyOff_YM2151_chn
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_YM2151_KeyOff_YM2151_chn
	and #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_KeyOff_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_reg
	lda #$8
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_reg
	; Assigning single variable : localVariable_YM2151_SetReg_YM2151_data
	lda localVariable_YM2151_KeyOff_YM2151_chn
	; Calling storevariable
	sta localVariable_YM2151_SetReg_YM2151_data
	jsr YM2151_SetReg
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
	; ***********  Defining procedure : X16Mouse_CalcChPos
	;    Procedure type : User-defined procedure
X16Mouse_CalcChPos
	; Assigning single variable : X16Mouse_Xch
	; integer assignment NodeVar
	ldy X16Mouse_X+1 ; Next one ; optimized, look out for bugs
	lda X16Mouse_X
X16Mouse_CalcChPos_tempVarShift_var161 = $24
	sta X16Mouse_CalcChPos_tempVarShift_var161
	sty X16Mouse_CalcChPos_tempVarShift_var161+1
	; COUNT : 3
		lsr X16Mouse_CalcChPos_tempVarShift_var161+1 ;keep
	ror X16Mouse_CalcChPos_tempVarShift_var161+0 ;keep

		lsr X16Mouse_CalcChPos_tempVarShift_var161+1 ;keep
	ror X16Mouse_CalcChPos_tempVarShift_var161+0 ;keep

		lsr X16Mouse_CalcChPos_tempVarShift_var161+1 ;keep
	ror X16Mouse_CalcChPos_tempVarShift_var161+0 ;keep

	lda X16Mouse_CalcChPos_tempVarShift_var161
	ldy X16Mouse_CalcChPos_tempVarShift_var161+1
	; Calling storevariable
	sta X16Mouse_Xch
	; Assigning single variable : X16Mouse_Ych
	; integer assignment NodeVar
	ldy X16Mouse_Y+1 ; Next one ; optimized, look out for bugs
	lda X16Mouse_Y
X16Mouse_CalcChPos_tempVarShift_var162 = $24
	sta X16Mouse_CalcChPos_tempVarShift_var162
	sty X16Mouse_CalcChPos_tempVarShift_var162+1
	; COUNT : 3
		lsr X16Mouse_CalcChPos_tempVarShift_var162+1 ;keep
	ror X16Mouse_CalcChPos_tempVarShift_var162+0 ;keep

		lsr X16Mouse_CalcChPos_tempVarShift_var162+1 ;keep
	ror X16Mouse_CalcChPos_tempVarShift_var162+0 ;keep

		lsr X16Mouse_CalcChPos_tempVarShift_var162+1 ;keep
	ror X16Mouse_CalcChPos_tempVarShift_var162+0 ;keep

	lda X16Mouse_CalcChPos_tempVarShift_var162
	ldy X16Mouse_CalcChPos_tempVarShift_var162+1
	; Calling storevariable
	sta X16Mouse_Ych
	rts
	; ***********  Defining procedure : X16Mouse_GetState
	;    Procedure type : User-defined procedure
X16Mouse_GetState
	; ****** Inline assembler section
		jsr $FF6B
		sta X16Mouse_Buttons
		LDA $00,X
		STA X16Mouse_X
		LDA $01,X
		STA X16Mouse_X+1;
		LDA $02,X
		sta X16Mouse_Y
		LDA $03,X
		sta X16Mouse_Y+1;
	
	rts
	; ***********  Defining procedure : Input_key2note
	;    Procedure type : User-defined procedure
Input_key2note
	; Assigning single variable : Input_note
	lda #$ff
	; Calling storevariable
	sta Input_note
	lda Input_key
	cmp #$5a ;keep
	bne Input_key2note_casenext166
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext166
	lda Input_key
	cmp #$53 ;keep
	bne Input_key2note_casenext168
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$1
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext168
	lda Input_key
	cmp #$58 ;keep
	bne Input_key2note_casenext170
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$2
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext170
	lda Input_key
	cmp #$44 ;keep
	bne Input_key2note_casenext172
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$3
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext172
	lda Input_key
	cmp #$43 ;keep
	bne Input_key2note_casenext174
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$4
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext174
	lda Input_key
	cmp #$56 ;keep
	bne Input_key2note_casenext176
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$5
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext176
	lda Input_key
	cmp #$47 ;keep
	bne Input_key2note_casenext178
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$6
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext178
	lda Input_key
	cmp #$42 ;keep
	bne Input_key2note_casenext180
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$7
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext180
	lda Input_key
	cmp #$48 ;keep
	bne Input_key2note_casenext182
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$8
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext182
	lda Input_key
	cmp #$4e ;keep
	bne Input_key2note_casenext184
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$9
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext184
	lda Input_key
	cmp #$4a ;keep
	bne Input_key2note_casenext186
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$a
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext186
	lda Input_key
	cmp #$4d ;keep
	bne Input_key2note_casenext188
	; Assigning single variable : Input_octave
	lda #$0
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$b
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext188
	lda Input_key
	cmp #$2c ;keep
	bne Input_key2note_casenext190
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$0
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext190
	lda Input_key
	cmp #$4c ;keep
	bne Input_key2note_casenext192
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext192
	lda Input_key
	cmp #$2e ;keep
	bne Input_key2note_casenext194
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$2
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext194
	lda Input_key
	cmp #$3b ;keep
	bne Input_key2note_casenext196
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$3
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext196
	lda Input_key
	cmp #$2f ;keep
	bne Input_key2note_casenext198
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$4
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext198
	lda Input_key
	cmp #$51 ;keep
	bne Input_key2note_casenext200
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$0
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext200
	lda Input_key
	cmp #$32 ;keep
	bne Input_key2note_casenext202
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext202
	lda Input_key
	cmp #$57 ;keep
	bne Input_key2note_casenext204
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$2
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext204
	lda Input_key
	cmp #$33 ;keep
	bne Input_key2note_casenext206
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$3
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext206
	lda Input_key
	cmp #$45 ;keep
	bne Input_key2note_casenext208
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$4
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext208
	lda Input_key
	cmp #$52 ;keep
	bne Input_key2note_casenext210
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$5
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext210
	lda Input_key
	cmp #$35 ;keep
	bne Input_key2note_casenext212
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$6
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext212
	lda Input_key
	cmp #$54 ;keep
	bne Input_key2note_casenext214
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$7
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext214
	lda Input_key
	cmp #$36 ;keep
	bne Input_key2note_casenext216
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$8
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext216
	lda Input_key
	cmp #$59 ;keep
	bne Input_key2note_casenext218
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$9
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext218
	lda Input_key
	cmp #$37 ;keep
	bne Input_key2note_casenext220
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$a
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext220
	lda Input_key
	cmp #$55 ;keep
	bne Input_key2note_casenext222
	; Assigning single variable : Input_octave
	lda #$1
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$b
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext222
	lda Input_key
	cmp #$49 ;keep
	bne Input_key2note_casenext224
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$0
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext224
	lda Input_key
	cmp #$39 ;keep
	bne Input_key2note_casenext226
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$1
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext226
	lda Input_key
	cmp #$4f ;keep
	bne Input_key2note_casenext228
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext228
	lda Input_key
	cmp #$30 ;keep
	bne Input_key2note_casenext230
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$3
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext230
	lda Input_key
	cmp #$50 ;keep
	bne Input_key2note_casenext232
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$4
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext232
	lda Input_key
	cmp #$5b ;keep
	bne Input_key2note_casenext234
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$5
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext234
	lda Input_key
	cmp #$3d ;keep
	bne Input_key2note_casenext236
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$6
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext236
	lda Input_key
	cmp #$5d ;keep
	bne Input_key2note_casenext238
	; Assigning single variable : Input_octave
	lda #$2
	; Calling storevariable
	sta Input_octave
	; Assigning single variable : Input_note
	lda #$7
	; Calling storevariable
	sta Input_note
	jmp Input_key2note_caseend165
Input_key2note_casenext238
Input_key2note_caseend165
	rts
	; ***********  Defining procedure : Input_getin
	;    Procedure type : User-defined procedure
Input_getin
	; ****** Inline assembler section
		//jsr $FF9F //SCNKEY
		jsr $FFE4 //GETIN
		sta Input_key
	
	rts
	; ***********  Defining procedure : Widget_putMapValue
	;    Procedure type : User-defined procedure
localVariable_Widget_putMapValue_Widget_wmp	= $22
localVariable_Widget_putMapValue_Widget_posX	dc.b	
localVariable_Widget_putMapValue_Widget_posY	dc.b	
localVariable_Widget_putMapValue_Widget_value	dc.b	
Widget_putMapValue_block241
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
Widget_putMapValue_rightvarInteger_var244 = $24
	sta Widget_putMapValue_rightvarInteger_var244
	sty Widget_putMapValue_rightvarInteger_var244+1
	; Generic 16 bit op
	; integer assignment NodeVar
	ldy localVariable_Widget_putMapValue_Widget_wmp+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Widget_putMapValue_Widget_wmp
Widget_putMapValue_rightvarInteger_var247 = $26
	sta Widget_putMapValue_rightvarInteger_var247
	sty Widget_putMapValue_rightvarInteger_var247+1
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
	adc Widget_putMapValue_rightvarInteger_var247
Widget_putMapValue_wordAdd245
	sta Widget_putMapValue_rightvarInteger_var247
	; High-bit binop
	tya
	adc Widget_putMapValue_rightvarInteger_var247+1
	tay
	lda Widget_putMapValue_rightvarInteger_var247
	; Low bit binop:
	clc
	adc Widget_putMapValue_rightvarInteger_var244
Widget_putMapValue_wordAdd242
	sta Widget_putMapValue_rightvarInteger_var244
	; High-bit binop
	tya
	adc Widget_putMapValue_rightvarInteger_var244+1
	tay
	lda Widget_putMapValue_rightvarInteger_var244
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
Widget_getMapValue_block248
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
Widget_getMapValue_rightvarInteger_var251 = $24
	sta Widget_getMapValue_rightvarInteger_var251
	sty Widget_getMapValue_rightvarInteger_var251+1
	; Generic 16 bit op
	; integer assignment NodeVar
	ldy localVariable_Widget_getMapValue_Widget_wmp+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Widget_getMapValue_Widget_wmp
Widget_getMapValue_rightvarInteger_var254 = $26
	sta Widget_getMapValue_rightvarInteger_var254
	sty Widget_getMapValue_rightvarInteger_var254+1
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
	adc Widget_getMapValue_rightvarInteger_var254
Widget_getMapValue_wordAdd252
	sta Widget_getMapValue_rightvarInteger_var254
	; High-bit binop
	tya
	adc Widget_getMapValue_rightvarInteger_var254+1
	tay
	lda Widget_getMapValue_rightvarInteger_var254
	; Low bit binop:
	clc
	adc Widget_getMapValue_rightvarInteger_var251
Widget_getMapValue_wordAdd249
	sta Widget_getMapValue_rightvarInteger_var251
	; High-bit binop
	tya
	adc Widget_getMapValue_rightvarInteger_var251+1
	tay
	lda Widget_getMapValue_rightvarInteger_var251
	sta localVariable_Widget_getMapValue_Widget_wmp
	sty localVariable_Widget_getMapValue_Widget_wmp+1
	; Load pointer array
	ldy #$0
	lda (localVariable_Widget_getMapValue_Widget_wmp),y
	rts
	rts
	; ***********  Defining procedure : Widget_ClearMap
	;    Procedure type : User-defined procedure
localVariable_Widget_ClearMap_Widget_wmp	= $22
localVariable_Widget_ClearMap_Widget_endpoint	= $2C
Widget_ClearMap_block255
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
Widget_ClearMap_while257
	; Binary clause INTEGER: LESS
	; Compare INTEGER with pure num / var optimization
	lda localVariable_Widget_ClearMap_Widget_wmp+1   ; compare high bytes
	cmp localVariable_Widget_ClearMap_Widget_endpoint+1 ;keep
	bcc Widget_ClearMap_ConditionalTrueBlock258
	bne Widget_ClearMap_elsedoneblock260
	lda localVariable_Widget_ClearMap_Widget_wmp
	cmp localVariable_Widget_ClearMap_Widget_endpoint ;keep
	bcs Widget_ClearMap_elsedoneblock260
Widget_ClearMap_ConditionalTrueBlock258: ;Main true block ;keep 
	; Assigning single variable : localVariable_Widget_ClearMap_Widget_wmp
	; Store Variable simplified optimization : right-hand term is pure
	ldy #$0 ; optimized, look out for bugs
	lda #$ff
	sta (localVariable_Widget_ClearMap_Widget_wmp),y
	inc localVariable_Widget_ClearMap_Widget_wmp
	bne Widget_ClearMap_incdec264
	inc localVariable_Widget_ClearMap_Widget_wmp +1
Widget_ClearMap_incdec264
	jmp Widget_ClearMap_while257
Widget_ClearMap_elsedoneblock260
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
Widget_PlaceOnMap_block265
Widget_PlaceOnMap
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_y
	lda localVariable_Widget_PlaceOnMap_Widget_posY
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_y
Widget_PlaceOnMap_forloop266
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_x
	lda localVariable_Widget_PlaceOnMap_Widget_posX
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_x
Widget_PlaceOnMap_forloop268
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
	bne Widget_PlaceOnMap_forloop268
Widget_PlaceOnMap_loopdone271: ;keep
	; IS ONPAGE
	inc localVariable_Widget_PlaceOnMap_Widget_y
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Widget_PlaceOnMap_Widget_posY
	clc
	adc localVariable_Widget_PlaceOnMap_Widget_Height
	 ; end add / sub var with constant
	cmp localVariable_Widget_PlaceOnMap_Widget_y ;keep
	bne Widget_PlaceOnMap_forloop266
Widget_PlaceOnMap_loopdone277: ;keep
	rts
	; ***********  Defining procedure : Label_Draw
	;    Procedure type : User-defined procedure
localVariable_Label_Draw_Label_lbl	dc.b	
Label_Draw_block278
Label_Draw
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	; Load Byte array
	ldx localVariable_Label_Draw_Label_lbl
	lda Label_labels_Label_tLabel_Label_tLabel_posX,x
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	; Load Byte array
	lda Label_labels_Label_tLabel_Label_tLabel_posY,x
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	; Load Byte array
	lda Label_labels_Label_tLabel_Label_tLabel_Value,x
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	; Load Byte array
	lda Label_labels_Label_tLabel_Label_tLabel_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	rts
	; ***********  Defining procedure : Label_setValue
	;    Procedure type : User-defined procedure
localVariable_Label_setValue_Label_lbl	dc.b	
localVariable_Label_setValue_Label_value	dc.b	
Label_setValue_block279
Label_setValue
	; Assigning single variable : Label_labels_Label_tLabel_Label_tLabel_Value
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Label_setValue_Label_lbl ; optimized, look out for bugs
	lda localVariable_Label_setValue_Label_value
	sta Label_labels_Label_tLabel_Label_tLabel_Value,x
	; Assigning single variable : localVariable_Label_Draw_Label_lbl
	lda localVariable_Label_setValue_Label_lbl
	; Calling storevariable
	sta localVariable_Label_Draw_Label_lbl
	jsr Label_Draw
	rts
	; ***********  Defining procedure : Label_Create
	;    Procedure type : User-defined procedure
localVariable_Label_Create_Label_lbID	dc.b	
localVariable_Label_Create_Label_posX	dc.b	
localVariable_Label_Create_Label_posY	dc.b	
localVariable_Label_Create_Label_Color	dc.b	
Label_Create_block280
Label_Create
	; Assigning single variable : Label_labels_Label_tLabel_Label_tLabel_posX
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Label_Create_Label_lbID ; optimized, look out for bugs
	lda localVariable_Label_Create_Label_posX
	sta Label_labels_Label_tLabel_Label_tLabel_posX,x
	; Assigning single variable : Label_labels_Label_tLabel_Label_tLabel_posY
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Label_Create_Label_posY
	sta Label_labels_Label_tLabel_Label_tLabel_posY,x
	; Assigning single variable : Label_labels_Label_tLabel_Label_tLabel_Value
	; Store Variable simplified optimization : right-hand term is pure
	lda #$0
	sta Label_labels_Label_tLabel_Label_tLabel_Value,x
	; Assigning single variable : Label_labels_Label_tLabel_Label_tLabel_Color
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Label_Create_Label_Color
	sta Label_labels_Label_tLabel_Label_tLabel_Color,x
	; Assigning single variable : localVariable_Label_Draw_Label_lbl
	lda localVariable_Label_Create_Label_lbID
	; Calling storevariable
	sta localVariable_Label_Draw_Label_lbl
	jsr Label_Draw
	rts
	; ***********  Defining procedure : Slider_getSlidePositionFine
	;    Procedure type : User-defined procedure
localVariable_Slider_getSlidePositionFine_Slider_temp	dc.w	
localVariable_Slider_getSlidePositionFine_Slider_slres	dc.b	
localVariable_Slider_getSlidePositionFine_Slider_sllen	dc.b	
localVariable_Slider_getSlidePositionFine_Slider_slval	dc.b	
localVariable_Slider_getSlidePositionFine_Slider_slmax	dc.b	
Slider_getSlidePositionFine_block281
Slider_getSlidePositionFine
	; Binary clause Simplified: EQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_getSlidePositionFine_Slider_sllen
	sec
	sbc #$1
	 ; end add / sub var with constant
	; Compare with pure num / var optimization
	cmp localVariable_Slider_getSlidePositionFine_Slider_slmax;keep
	bne Slider_getSlidePositionFine_elseblock284
Slider_getSlidePositionFine_ConditionalTrueBlock283: ;Main true block ;keep 
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slres
	lda localVariable_Slider_getSlidePositionFine_Slider_slval
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slres
	jmp Slider_getSlidePositionFine_elsedoneblock285
Slider_getSlidePositionFine_elseblock284
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_temp
	ldy #0
	; 16x8 div
	; Mul 16x8 setup
	lda localVariable_Slider_getSlidePositionFine_Slider_sllen
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda localVariable_Slider_getSlidePositionFine_Slider_slval
	sta mul16x8_num2
	jsr mul16x8_procedure
	sta initdiv16x8_dividend
	sty initdiv16x8_dividend+1
	ldy #0
	lda localVariable_Slider_getSlidePositionFine_Slider_slmax
	sta initdiv16x8_divisor
	sty initdiv16x8_divisor+1
	jsr divide16x8
	lda initdiv16x8_dividend
	ldy initdiv16x8_dividend+1
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_temp
	sty localVariable_Slider_getSlidePositionFine_Slider_temp+1
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slres
	; integer assignment NodeVar
	ldy localVariable_Slider_getSlidePositionFine_Slider_temp+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Slider_getSlidePositionFine_Slider_temp
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slres
	; Binary clause Simplified: GREATER
Slider_getSlidePositionFine_binary_clause_temp_var303 = $24
	sta Slider_getSlidePositionFine_binary_clause_temp_var303
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_getSlidePositionFine_Slider_sllen
	sec
	sbc #$1
	 ; end add / sub var with constant
Slider_getSlidePositionFine_binary_clause_temp_2_var304 = $26
	sta Slider_getSlidePositionFine_binary_clause_temp_2_var304
	lda Slider_getSlidePositionFine_binary_clause_temp_var303
	cmp Slider_getSlidePositionFine_binary_clause_temp_2_var304;keep
	bcc Slider_getSlidePositionFine_elsedoneblock301
	beq Slider_getSlidePositionFine_elsedoneblock301
Slider_getSlidePositionFine_ConditionalTrueBlock299: ;Main true block ;keep 
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slres
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_getSlidePositionFine_Slider_sllen
	sec
	sbc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slres
Slider_getSlidePositionFine_elsedoneblock301
Slider_getSlidePositionFine_elsedoneblock285
	lda localVariable_Slider_getSlidePositionFine_Slider_slres
	rts
	rts
	; ***********  Defining procedure : Slider_getSliderValueFine
	;    Procedure type : User-defined procedure
localVariable_Slider_getSliderValueFine_Slider_mousecorrected	dc.w	
localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected	dc.w	
localVariable_Slider_getSliderValueFine_Slider_temp	dc.w	
localVariable_Slider_getSliderValueFine_Slider_endcharpos	dc.b	
localVariable_Slider_getSliderValueFine_Slider_slres	dc.b	
localVariable_Slider_getSliderValueFine_Slider_mousepos	dc.w	
localVariable_Slider_getSliderValueFine_Slider_mousechpos	dc.b	
localVariable_Slider_getSliderValueFine_Slider_slpos	dc.b	
localVariable_Slider_getSliderValueFine_Slider_sllen	dc.b	
localVariable_Slider_getSliderValueFine_Slider_slmax	dc.b	
Slider_getSliderValueFine_block306
Slider_getSliderValueFine
	; Binary clause Simplified: LESS
	lda localVariable_Slider_getSliderValueFine_Slider_mousechpos
	; Compare with pure num / var optimization
	cmp localVariable_Slider_getSliderValueFine_Slider_slpos;keep
	bcs Slider_getSliderValueFine_elsedoneblock310
Slider_getSliderValueFine_ConditionalTrueBlock308: ;Main true block ;keep 
	lda #$0
	rts
Slider_getSliderValueFine_elsedoneblock310
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_endcharpos
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_getSliderValueFine_Slider_slpos
	clc
	adc localVariable_Slider_getSliderValueFine_Slider_sllen
	 ; end add / sub var with constant
	sec
	sbc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_endcharpos
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp localVariable_Slider_getSliderValueFine_Slider_mousechpos;keep
	bcs Slider_getSliderValueFine_elsedoneblock316
Slider_getSliderValueFine_ConditionalTrueBlock314: ;Main true block ;keep 
	lda localVariable_Slider_getSliderValueFine_Slider_slmax
	rts
Slider_getSliderValueFine_elsedoneblock316
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected
	ldy #0
	lda localVariable_Slider_getSliderValueFine_Slider_slpos
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected
	sty localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected+1
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected
	; integer assignment NodeVar
	ldy localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected
Slider_getSliderValueFine_tempVarShift_var319 = $24
	sta Slider_getSliderValueFine_tempVarShift_var319
	sty Slider_getSliderValueFine_tempVarShift_var319+1
	; COUNT : 2
		asl Slider_getSliderValueFine_tempVarShift_var319+0 ;keep
	rol Slider_getSliderValueFine_tempVarShift_var319+1 ;keep

		asl Slider_getSliderValueFine_tempVarShift_var319+0 ;keep
	rol Slider_getSliderValueFine_tempVarShift_var319+1 ;keep

	lda Slider_getSliderValueFine_tempVarShift_var319
	ldy Slider_getSliderValueFine_tempVarShift_var319+1
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected
	sty localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected+1
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_mousecorrected
	; Generic 16 bit op
	; integer assignment NodeVar
	ldy localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Slider_getSliderValueFine_Slider_sliderposcorrected
Slider_getSliderValueFine_rightvarInteger_var322 = $24
	sta Slider_getSliderValueFine_rightvarInteger_var322
	sty Slider_getSliderValueFine_rightvarInteger_var322+1
	; integer assignment NodeVar
	ldy localVariable_Slider_getSliderValueFine_Slider_mousepos+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Slider_getSliderValueFine_Slider_mousepos
Slider_getSliderValueFine_tempVarShift_var323 = $26
	sta Slider_getSliderValueFine_tempVarShift_var323
	sty Slider_getSliderValueFine_tempVarShift_var323+1
	; COUNT : 1
		lsr Slider_getSliderValueFine_tempVarShift_var323+1 ;keep
	ror Slider_getSliderValueFine_tempVarShift_var323+0 ;keep

	lda Slider_getSliderValueFine_tempVarShift_var323
	ldy Slider_getSliderValueFine_tempVarShift_var323+1
	; Low bit binop:
	sec
	sbc Slider_getSliderValueFine_rightvarInteger_var322
Slider_getSliderValueFine_wordAdd320
	sta Slider_getSliderValueFine_rightvarInteger_var322
	; High-bit binop
	tya
	sbc Slider_getSliderValueFine_rightvarInteger_var322+1
	tay
	lda Slider_getSliderValueFine_rightvarInteger_var322
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_mousecorrected
	sty localVariable_Slider_getSliderValueFine_Slider_mousecorrected+1
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_temp
	ldy #0
	; 16x8 div
	; Mul 16x8 setup
	lda localVariable_Slider_getSliderValueFine_Slider_slmax
	sta mul16x8_num1
	sty mul16x8_num1Hi
	; Integer assignment in nodevar
	lda localVariable_Slider_getSliderValueFine_Slider_mousecorrected
	ldy localVariable_Slider_getSliderValueFine_Slider_mousecorrected+1
	sta mul16x8_num2
	jsr mul16x8_procedure
	sta initdiv16x8_dividend
	sty initdiv16x8_dividend+1
	ldy #0
	lda localVariable_Slider_getSliderValueFine_Slider_sllen
Slider_getSliderValueFine_tempVarShift_var324 = $24
	sta Slider_getSliderValueFine_tempVarShift_var324
	sty Slider_getSliderValueFine_tempVarShift_var324+1
	; COUNT : 2
		asl Slider_getSliderValueFine_tempVarShift_var324+0 ;keep
	rol Slider_getSliderValueFine_tempVarShift_var324+1 ;keep

		asl Slider_getSliderValueFine_tempVarShift_var324+0 ;keep
	rol Slider_getSliderValueFine_tempVarShift_var324+1 ;keep

	lda Slider_getSliderValueFine_tempVarShift_var324
	ldy Slider_getSliderValueFine_tempVarShift_var324+1
	sta initdiv16x8_divisor
	sty initdiv16x8_divisor+1
	jsr divide16x8
	lda initdiv16x8_dividend
	ldy initdiv16x8_dividend+1
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_temp
	sty localVariable_Slider_getSliderValueFine_Slider_temp+1
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_slres
	; integer assignment NodeVar
	ldy localVariable_Slider_getSliderValueFine_Slider_temp+1 ; Next one ; optimized, look out for bugs
	lda localVariable_Slider_getSliderValueFine_Slider_temp
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_slres
	rts
	rts
	; ***********  Defining procedure : Slider_DrawSlide
	;    Procedure type : User-defined procedure
localVariable_Slider_DrawSlide_Slider_slres	dc.b	
localVariable_Slider_DrawSlide_Slider_posx	dc.b	
localVariable_Slider_DrawSlide_Slider_posy	dc.b	
localVariable_Slider_DrawSlide_Slider_chartype	dc.b	
localVariable_Slider_DrawSlide_Slider_char	dc.b	
localVariable_Slider_DrawSlide_Slider_slID	dc.b	
Slider_DrawSlide_block325
Slider_DrawSlide
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Mode,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne Slider_DrawSlide_localfailed366
	jmp Slider_DrawSlide_ConditionalTrueBlock327
Slider_DrawSlide_localfailed366
	jmp Slider_DrawSlide_elseblock328
Slider_DrawSlide_ConditionalTrueBlock327: ;Main true block ;keep 
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_slres
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_sllen
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Length_,x
	asl
	asl
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_sllen
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slval
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slval
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slmax
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slmax
	jsr Slider_getSlidePositionFine
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_slres
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_posx
	; 8 bit binop
	; Add/sub where right value is constant number
	lsr
	lsr
	clc
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	adc Slider_sliders_Slider_tSlider_Slider_tSlider_posX,x
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_posx
	; Binary clause Simplified: NOTEQUALS
Slider_DrawSlide_binary_clause_temp_var373 = $24
	sta Slider_DrawSlide_binary_clause_temp_var373
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
Slider_DrawSlide_binary_clause_temp_2_var374 = $26
	sta Slider_DrawSlide_binary_clause_temp_2_var374
	lda Slider_DrawSlide_binary_clause_temp_var373
	cmp Slider_DrawSlide_binary_clause_temp_2_var374;keep
	beq Slider_DrawSlide_elsedoneblock371
Slider_DrawSlide_ConditionalTrueBlock369: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_posY,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda #$43
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Slider_DrawSlide_Slider_slID ; optimized, look out for bugs
	lda localVariable_Slider_DrawSlide_Slider_posx
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
Slider_DrawSlide_elsedoneblock371
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_chartype
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_DrawSlide_Slider_slres
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$0 ;keep
	bne Slider_DrawSlide_casenext377
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$74
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend376
Slider_DrawSlide_casenext377
	lda localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$1 ;keep
	bne Slider_DrawSlide_casenext379
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$47
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend376
Slider_DrawSlide_casenext379
	lda localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$2 ;keep
	bne Slider_DrawSlide_casenext381
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$48
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend376
Slider_DrawSlide_casenext381
	lda localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$3 ;keep
	bne Slider_DrawSlide_casenext383
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$6a
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend376
Slider_DrawSlide_casenext383
Slider_DrawSlide_caseend376
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	lda localVariable_Slider_DrawSlide_Slider_posx
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_posY,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda localVariable_Slider_DrawSlide_Slider_char
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	jmp Slider_DrawSlide_elsedoneblock329
Slider_DrawSlide_elseblock328
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_slres
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_sllen
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Length_,x
	asl
	asl
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_sllen
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slval
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slval
	; Assigning single variable : localVariable_Slider_getSlidePositionFine_Slider_slmax
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
	; Calling storevariable
	sta localVariable_Slider_getSlidePositionFine_Slider_slmax
	jsr Slider_getSlidePositionFine
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_slres
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_posy
	; 8 bit binop
	; Add/sub where right value is constant number
	lsr
	lsr
	clc
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	adc Slider_sliders_Slider_tSlider_Slider_tSlider_posY,x
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_posy
	; Binary clause Simplified: NOTEQUALS
Slider_DrawSlide_binary_clause_temp_var391 = $24
	sta Slider_DrawSlide_binary_clause_temp_var391
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
Slider_DrawSlide_binary_clause_temp_2_var392 = $26
	sta Slider_DrawSlide_binary_clause_temp_2_var392
	lda Slider_DrawSlide_binary_clause_temp_var391
	cmp Slider_DrawSlide_binary_clause_temp_2_var392;keep
	beq Slider_DrawSlide_elsedoneblock389
Slider_DrawSlide_ConditionalTrueBlock387: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_posX,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda #$5d
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Slider_DrawSlide_Slider_slID ; optimized, look out for bugs
	lda localVariable_Slider_DrawSlide_Slider_posy
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
Slider_DrawSlide_elsedoneblock389
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_chartype
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_DrawSlide_Slider_slres
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$0 ;keep
	bne Slider_DrawSlide_casenext395
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$77
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend394
Slider_DrawSlide_casenext395
	lda localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$1 ;keep
	bne Slider_DrawSlide_casenext397
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$44
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend394
Slider_DrawSlide_casenext397
	lda localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$2 ;keep
	bne Slider_DrawSlide_casenext399
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$46
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend394
Slider_DrawSlide_casenext399
	lda localVariable_Slider_DrawSlide_Slider_chartype
	cmp #$3 ;keep
	bne Slider_DrawSlide_casenext401
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_char
	lda #$6f
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_char
	jmp Slider_DrawSlide_caseend394
Slider_DrawSlide_casenext401
Slider_DrawSlide_caseend394
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_posX,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_Slider_DrawSlide_Slider_posy
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda localVariable_Slider_DrawSlide_Slider_char
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
Slider_DrawSlide_elsedoneblock329
	; Binary clause Simplified: NOTEQUALS
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_AttachedLabel,x
	; Compare with pure num / var optimization
	cmp #$ff;keep
	beq Slider_DrawSlide_elsedoneblock406
Slider_DrawSlide_ConditionalTrueBlock404: ;Main true block ;keep 
	; Assigning single variable : localVariable_Label_setValue_Label_lbl
	; Load Byte array
	ldx localVariable_Slider_DrawSlide_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_AttachedLabel,x
	; Calling storevariable
	sta localVariable_Label_setValue_Label_lbl
	; Assigning single variable : localVariable_Label_setValue_Label_value
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	; Calling storevariable
	sta localVariable_Label_setValue_Label_value
	jsr Label_setValue
Slider_DrawSlide_elsedoneblock406
	rts
	; ***********  Defining procedure : Slider_getValue
	;    Procedure type : User-defined procedure
localVariable_Slider_getValue_Slider_slID	dc.b	
Slider_getValue_block409
Slider_getValue
	; Load Byte array
	ldx localVariable_Slider_getValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	rts
	rts
	; ***********  Defining procedure : Slider_setValue
	;    Procedure type : User-defined procedure
localVariable_Slider_setValue_Slider_slID	dc.b	
localVariable_Slider_setValue_Slider_value	dc.b	
Slider_setValue_block410
Slider_setValue
	; Binary clause Simplified: GREATER
	lda localVariable_Slider_setValue_Slider_value
Slider_setValue_binary_clause_temp_var416 = $24
	sta Slider_setValue_binary_clause_temp_var416
	; Load Byte array
	ldx localVariable_Slider_setValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
Slider_setValue_binary_clause_temp_2_var417 = $26
	sta Slider_setValue_binary_clause_temp_2_var417
	lda Slider_setValue_binary_clause_temp_var416
	cmp Slider_setValue_binary_clause_temp_2_var417;keep
	bcc Slider_setValue_elsedoneblock414
	beq Slider_setValue_elsedoneblock414
Slider_setValue_ConditionalTrueBlock412: ;Main true block ;keep 
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	; Load Byte array
	ldx localVariable_Slider_setValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
Slider_setValue_elsedoneblock414
	; Binary clause Simplified: NOTEQUALS
	lda localVariable_Slider_setValue_Slider_value
Slider_setValue_binary_clause_temp_var424 = $24
	sta Slider_setValue_binary_clause_temp_var424
	; Load Byte array
	ldx localVariable_Slider_setValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_PrevValue,x
Slider_setValue_binary_clause_temp_2_var425 = $26
	sta Slider_setValue_binary_clause_temp_2_var425
	lda Slider_setValue_binary_clause_temp_var424
	cmp Slider_setValue_binary_clause_temp_2_var425;keep
	beq Slider_setValue_elsedoneblock422
Slider_setValue_ConditionalTrueBlock420: ;Main true block ;keep 
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_PrevValue
	; Load Byte array
	ldx localVariable_Slider_setValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	; Calling storevariable
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_PrevValue,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_Value
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_setValue_Slider_value
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_slID
	lda localVariable_Slider_setValue_Slider_slID
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_slID
	jsr Slider_DrawSlide
Slider_setValue_elsedoneblock422
	rts
	; ***********  Defining procedure : Slider_calcSliderValue
	;    Procedure type : User-defined procedure
localVariable_Slider_calcSliderValue_Slider_temp	dc.b	
localVariable_Slider_calcSliderValue_Slider_slID	dc.b	
Slider_calcSliderValue_block427
Slider_calcSliderValue
	; Load Byte array
	ldx localVariable_Slider_calcSliderValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Mode,x
	cmp #$0 ;keep
	bne Slider_calcSliderValue_casenext429
	; Assigning single variable : localVariable_Slider_calcSliderValue_Slider_temp
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_mousepos
	; integer assignment NodeVar
	ldy X16Mouse_Y+1 ; Next one ; optimized, look out for bugs
	lda X16Mouse_Y
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_mousepos
	sty localVariable_Slider_getSliderValueFine_Slider_mousepos+1
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_mousechpos
	lda X16Mouse_Ych
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_mousechpos
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_slpos
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_posY,x
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_slpos
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_sllen
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Length_,x
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_sllen
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_slmax
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_slmax
	jsr Slider_getSliderValueFine
	; Calling storevariable
	sta localVariable_Slider_calcSliderValue_Slider_temp
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda localVariable_Slider_calcSliderValue_Slider_slID
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_Slider_calcSliderValue_Slider_temp
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	jmp Slider_calcSliderValue_caseend428
Slider_calcSliderValue_casenext429
	; Load Byte array
	ldx localVariable_Slider_calcSliderValue_Slider_slID
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Mode,x
	cmp #$1 ;keep
	bne Slider_calcSliderValue_casenext431
	
; //sliders[slID].Value:=getSliderValueFine(X16Mouse::Y,X16Mouse::Ych,sliders[slID].posY,sliders[slID].Length_,sliders[slID].Max_);
	; Assigning single variable : localVariable_Slider_calcSliderValue_Slider_temp
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_mousepos
	; integer assignment NodeVar
	ldy X16Mouse_X+1 ; Next one ; optimized, look out for bugs
	lda X16Mouse_X
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_mousepos
	sty localVariable_Slider_getSliderValueFine_Slider_mousepos+1
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_mousechpos
	lda X16Mouse_Xch
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_mousechpos
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_slpos
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_posX,x
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_slpos
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_sllen
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Length_,x
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_sllen
	; Assigning single variable : localVariable_Slider_getSliderValueFine_Slider_slmax
	; Load Byte array
	lda Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
	; Calling storevariable
	sta localVariable_Slider_getSliderValueFine_Slider_slmax
	jsr Slider_getSliderValueFine
	; Calling storevariable
	sta localVariable_Slider_calcSliderValue_Slider_temp
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda localVariable_Slider_calcSliderValue_Slider_slID
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_Slider_calcSliderValue_Slider_temp
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	jmp Slider_calcSliderValue_caseend428
Slider_calcSliderValue_casenext431
Slider_calcSliderValue_caseend428
	rts
	
; //sliders[slID].Value:=getSliderValueFine(X16Mouse::X,X16Mouse::Xch,sliders[slID].posX,sliders[slID].Length_,sliders[slID].Max_);
	; ***********  Defining procedure : Slider_HandleClick
	;    Procedure type : User-defined procedure
localVariable_Slider_HandleClick_Slider_slID	dc.b	
localVariable_Slider_HandleClick_Slider_WID	dc.b	
localVariable_Slider_HandleClick_Slider_WT	dc.b	
Slider_HandleClick_block433
Slider_HandleClick
	; Binary clause Simplified: EQUALS
	lda X16Mouse_mouseClicked
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne Slider_HandleClick_elseblock436
Slider_HandleClick_localsuccess446: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: NOTEQUALS
	lda Slider_clickedSlider
	; Compare with pure num / var optimization
	cmp #$ff;keep
	beq Slider_HandleClick_elseblock436
Slider_HandleClick_ConditionalTrueBlock435: ;Main true block ;keep 
	
; //Slider dragging.
	; Assigning single variable : localVariable_Slider_calcSliderValue_Slider_slID
	lda Slider_clickedSlider
	; Calling storevariable
	sta localVariable_Slider_calcSliderValue_Slider_slID
	jsr Slider_calcSliderValue
	jmp Slider_HandleClick_elsedoneblock437
Slider_HandleClick_elseblock436
	; Assigning single variable : Slider_clickedSlider
	lda #$ff
	; Calling storevariable
	sta Slider_clickedSlider
	; Assigning single variable : localVariable_Slider_HandleClick_Slider_WID
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posX
	lda X16Mouse_Xch
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posX
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posY
	lda X16Mouse_Ych
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posY
	jsr Widget_getMapValue
	; Calling storevariable
	sta localVariable_Slider_HandleClick_Slider_WID
	; Assigning single variable : localVariable_Slider_HandleClick_Slider_WT
	; 8 bit binop
	; Add/sub where right value is constant number
	and #$80
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_HandleClick_Slider_WT
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne Slider_HandleClick_elsedoneblock452
Slider_HandleClick_ConditionalTrueBlock450: ;Main true block ;keep 
	
; //Slider
	; Assigning single variable : localVariable_Slider_HandleClick_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_HandleClick_Slider_WID
	and #$7f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_HandleClick_Slider_slID
	; Assigning single variable : Slider_clickedSlider
	; Calling storevariable
	sta Slider_clickedSlider
	; Assigning single variable : localVariable_Slider_calcSliderValue_Slider_slID
	; Calling storevariable
	sta localVariable_Slider_calcSliderValue_Slider_slID
	jsr Slider_calcSliderValue
Slider_HandleClick_elsedoneblock452
Slider_HandleClick_elsedoneblock437
	rts
	; ***********  Defining procedure : Slider_Create
	;    Procedure type : User-defined procedure
localVariable_Slider_Create_Slider_WID	dc.b	
localVariable_Slider_Create_Slider_i	dc.b	
localVariable_Slider_Create_Slider_slID	dc.b	
localVariable_Slider_Create_Slider_posX	dc.b	
localVariable_Slider_Create_Slider_posY	dc.b	
localVariable_Slider_Create_Slider_Length_	dc.b	
localVariable_Slider_Create_Slider_Color	dc.b	
localVariable_Slider_Create_Slider_Max_	dc.b	
localVariable_Slider_Create_Slider_Mode	dc.b	
localVariable_Slider_Create_Slider_AttachedLabelID	dc.b	
Slider_Create_block455
Slider_Create
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_posX
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Slider_Create_Slider_slID ; optimized, look out for bugs
	lda localVariable_Slider_Create_Slider_posX
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_posX,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_posY
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_Create_Slider_posY
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_posY,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_Length_
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_Create_Slider_Length_
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_Length_,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_Color
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_Create_Slider_Color
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_Color,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_Value
	; Store Variable simplified optimization : right-hand term is pure
	lda #$0
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_Value,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_Max_
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_Create_Slider_Max_
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_Max_,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_Mode
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_Create_Slider_Mode
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_Mode,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_AttachedLabel
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_Slider_Create_Slider_AttachedLabelID
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_AttachedLabel,x
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_NeedToSetValueLater
	; Store Variable simplified optimization : right-hand term is pure
	lda #$0
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_NeedToSetValueLater,x
	; Assigning single variable : localVariable_Slider_Create_Slider_WID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_Create_Slider_slID
	and #$7f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_WID
	lda localVariable_Slider_Create_Slider_Mode
	cmp #$1 ;keep
	bne Slider_Create_casenext457
	
; //Set first bit 0 = slider
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_posX
	lda localVariable_Slider_Create_Slider_posX
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_posX
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_posY
	lda localVariable_Slider_Create_Slider_posY
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_posY
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_Width
	lda localVariable_Slider_Create_Slider_Length_
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_Width
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_Height
	lda #$1
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_Height
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_WID
	lda localVariable_Slider_Create_Slider_WID
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_WID
	jsr Widget_PlaceOnMap
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Slider_Create_Slider_slID ; optimized, look out for bugs
	lda localVariable_Slider_Create_Slider_posX
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
	; Assigning single variable : localVariable_Slider_Create_Slider_i
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_i
Slider_Create_forloop459
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	lda localVariable_Slider_Create_Slider_i
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_Slider_Create_Slider_posY
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda #$43
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	lda localVariable_Slider_Create_Slider_Color
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	; IS ONPAGE
	inc localVariable_Slider_Create_Slider_i
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_Create_Slider_posX
	clc
	adc localVariable_Slider_Create_Slider_Length_
	 ; end add / sub var with constant
	cmp localVariable_Slider_Create_Slider_i ;keep
	bne Slider_Create_forloop459
Slider_Create_loopdone462: ;keep
	jmp Slider_Create_caseend456
Slider_Create_casenext457
	lda localVariable_Slider_Create_Slider_Mode
	cmp #$0 ;keep
	bne Slider_Create_casenext463
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_posX
	lda localVariable_Slider_Create_Slider_posX
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_posX
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_posY
	lda localVariable_Slider_Create_Slider_posY
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_posY
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_Width
	lda #$1
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_Width
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_Height
	lda localVariable_Slider_Create_Slider_Length_
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_Height
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_WID
	lda localVariable_Slider_Create_Slider_WID
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_WID
	jsr Widget_PlaceOnMap
	; Assigning single variable : Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_Slider_Create_Slider_slID ; optimized, look out for bugs
	lda localVariable_Slider_Create_Slider_posY
	sta Slider_sliders_Slider_tSlider_Slider_tSlider_PrevSlideCharPos,x
	; Assigning single variable : localVariable_Slider_Create_Slider_i
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_i
Slider_Create_forloop465
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	lda localVariable_Slider_Create_Slider_posX
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_Slider_Create_Slider_i
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda #$5d
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	lda localVariable_Slider_Create_Slider_Color
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	; IS ONPAGE
	inc localVariable_Slider_Create_Slider_i
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Slider_Create_Slider_posY
	clc
	adc localVariable_Slider_Create_Slider_Length_
	 ; end add / sub var with constant
	cmp localVariable_Slider_Create_Slider_i ;keep
	bne Slider_Create_forloop465
Slider_Create_loopdone468: ;keep
	jmp Slider_Create_caseend456
Slider_Create_casenext463
Slider_Create_caseend456
	; Assigning single variable : localVariable_Slider_DrawSlide_Slider_slID
	lda localVariable_Slider_Create_Slider_slID
	; Calling storevariable
	sta localVariable_Slider_DrawSlide_Slider_slID
	jsr Slider_DrawSlide
	rts
	; ***********  Defining procedure : Button_Draw
	;    Procedure type : User-defined procedure
localVariable_Button_Draw_Button_labelx	dc.b	
localVariable_Button_Draw_Button_labely	dc.b	
localVariable_Button_Draw_Button_butt	dc.b	
Button_Draw_block469
Button_Draw
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posX
	; Load Byte array
	ldx localVariable_Button_Draw_Button_butt
	lda Button_buttons_Button_tButton_Button_tButton_posX,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posX
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posY
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_posY,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posY
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Width
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_Width,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Width
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Height
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_Height,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Height
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_color
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_color
	jsr SCF_DrawBox
	; Assigning single variable : localVariable_Button_Draw_Button_labelx
	; 8 bit binop
	; Add/sub right value is variable/expression
	; Load Byte array
	ldx localVariable_Button_Draw_Button_butt
	lda Button_buttons_Button_tButton_Button_tButton_Width,x
	lsr
Button_Draw_rightvarAddSub_var470 = $24
	sta Button_Draw_rightvarAddSub_var470
	; Load Byte array
	ldx localVariable_Button_Draw_Button_butt
	lda Button_buttons_Button_tButton_Button_tButton_posX,x
	clc
	adc Button_Draw_rightvarAddSub_var470
	; Calling storevariable
	sta localVariable_Button_Draw_Button_labelx
	; Assigning single variable : localVariable_Button_Draw_Button_labely
	; 8 bit binop
	; Add/sub right value is variable/expression
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_Height,x
	lsr
Button_Draw_rightvarAddSub_var471 = $24
	sta Button_Draw_rightvarAddSub_var471
	; Load Byte array
	ldx localVariable_Button_Draw_Button_butt
	lda Button_buttons_Button_tButton_Button_tButton_posY,x
	clc
	adc Button_Draw_rightvarAddSub_var471
	; Calling storevariable
	sta localVariable_Button_Draw_Button_labely
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	lda localVariable_Button_Draw_Button_labelx
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_Button_Draw_Button_labely
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_Label_,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	; Load Byte array
	lda Button_buttons_Button_tButton_Button_tButton_Color,x
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	rts
	; ***********  Defining procedure : CheckBox_Draw
	;    Procedure type : User-defined procedure
localVariable_CheckBox_Draw_CheckBox_color	dc.b	
localVariable_CheckBox_Draw_CheckBox_cbID	dc.b	
CheckBox_Draw_block472
CheckBox_Draw
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx localVariable_CheckBox_Draw_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne CheckBox_Draw_elseblock475
CheckBox_Draw_ConditionalTrueBlock474: ;Main true block ;keep 
	; Assigning single variable : localVariable_CheckBox_Draw_CheckBox_color
	; Load Byte array
	ldx localVariable_CheckBox_Draw_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOff,x
	; Calling storevariable
	sta localVariable_CheckBox_Draw_CheckBox_color
	jmp CheckBox_Draw_elsedoneblock476
CheckBox_Draw_elseblock475
	; Assigning single variable : localVariable_CheckBox_Draw_CheckBox_color
	; Load Byte array
	ldx localVariable_CheckBox_Draw_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOn,x
	; Calling storevariable
	sta localVariable_CheckBox_Draw_CheckBox_color
CheckBox_Draw_elsedoneblock476
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posX
	; Load Byte array
	ldx localVariable_CheckBox_Draw_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posX,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posX
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posY
	; Load Byte array
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posY,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posY
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Width
	; Load Byte array
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Width,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Width
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Height
	; Load Byte array
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Height,x
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Height
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_color
	lda localVariable_CheckBox_Draw_CheckBox_color
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_color
	jsr SCF_DrawBox
	rts
	; ***********  Defining procedure : CheckBox_getValue
	;    Procedure type : User-defined procedure
localVariable_CheckBox_getValue_CheckBox_cbID	dc.b	
CheckBox_getValue_block481
CheckBox_getValue
	; Load Byte array
	ldx localVariable_CheckBox_getValue_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
	rts
	rts
	; ***********  Defining procedure : CheckBox_setValue
	;    Procedure type : User-defined procedure
localVariable_CheckBox_setValue_CheckBox_cbID	dc.b	
localVariable_CheckBox_setValue_CheckBox_value	dc.b	
CheckBox_setValue_block482
CheckBox_setValue
	; Binary clause Simplified: NOTEQUALS
	; Load Byte array
	ldx localVariable_CheckBox_setValue_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
	; Compare with pure num / var optimization
	cmp localVariable_CheckBox_setValue_CheckBox_value;keep
	beq CheckBox_setValue_elsedoneblock486
CheckBox_setValue_ConditionalTrueBlock484: ;Main true block ;keep 
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_CheckBox_setValue_CheckBox_cbID ; optimized, look out for bugs
	lda localVariable_CheckBox_setValue_CheckBox_value
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
	; Assigning single variable : localVariable_CheckBox_Draw_CheckBox_cbID
	lda localVariable_CheckBox_setValue_CheckBox_cbID
	; Calling storevariable
	sta localVariable_CheckBox_Draw_CheckBox_cbID
	jsr CheckBox_Draw
CheckBox_setValue_elsedoneblock486
	rts
	; ***********  Defining procedure : CheckBox_HandleClick
	;    Procedure type : User-defined procedure
localVariable_CheckBox_HandleClick_CheckBox_cbID	dc.b	
localVariable_CheckBox_HandleClick_CheckBox_WID	dc.b	
localVariable_CheckBox_HandleClick_CheckBox_WT	dc.b	
CheckBox_HandleClick_block489
CheckBox_HandleClick
	; Assigning single variable : localVariable_CheckBox_HandleClick_CheckBox_WID
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posX
	lda X16Mouse_mouseXchposAtClick
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posX
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posY
	lda X16Mouse_mouseYchposAtClick
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posY
	jsr Widget_getMapValue
	; Calling storevariable
	sta localVariable_CheckBox_HandleClick_CheckBox_WID
	; Assigning single variable : localVariable_CheckBox_HandleClick_CheckBox_WT
	; 8 bit binop
	; Add/sub where right value is constant number
	and #$80
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_HandleClick_CheckBox_WT
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$80;keep
	bne CheckBox_HandleClick_elsedoneblock493
CheckBox_HandleClick_ConditionalTrueBlock491: ;Main true block ;keep 
	
; //1 checkbox
	; Assigning single variable : localVariable_CheckBox_HandleClick_CheckBox_cbID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_CheckBox_HandleClick_CheckBox_WID
	and #$7f
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_HandleClick_CheckBox_cbID
	; Binary clause Simplified: EQUALS
	; Load Byte array
	tax ; optimized x, look out for bugs L22 ORG 	ldx localVariable_CheckBox_HandleClick_CheckBox_cbID
	lda CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne CheckBox_HandleClick_elseblock506
CheckBox_HandleClick_ConditionalTrueBlock505: ;Main true block ;keep 
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_CheckBox_HandleClick_CheckBox_cbID ; optimized, look out for bugs
	lda #$1
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
	jmp CheckBox_HandleClick_elsedoneblock507
CheckBox_HandleClick_elseblock506
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_CheckBox_HandleClick_CheckBox_cbID ; optimized, look out for bugs
	lda #$0
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Value,x
CheckBox_HandleClick_elsedoneblock507
	; Assigning single variable : localVariable_CheckBox_Draw_CheckBox_cbID
	lda localVariable_CheckBox_HandleClick_CheckBox_cbID
	; Calling storevariable
	sta localVariable_CheckBox_Draw_CheckBox_cbID
	jsr CheckBox_Draw
	; Assigning single variable : CheckBox_clickedcheckbox
	lda localVariable_CheckBox_HandleClick_CheckBox_cbID
	; Calling storevariable
	sta CheckBox_clickedcheckbox
CheckBox_HandleClick_elsedoneblock493
	rts
	; ***********  Defining procedure : CheckBox_Create
	;    Procedure type : User-defined procedure
localVariable_CheckBox_Create_CheckBox_WID	dc.b	
localVariable_CheckBox_Create_CheckBox_cbID	dc.b	
localVariable_CheckBox_Create_CheckBox_posX	dc.b	
localVariable_CheckBox_Create_CheckBox_posY	dc.b	
localVariable_CheckBox_Create_CheckBox_Width	dc.b	
localVariable_CheckBox_Create_CheckBox_Height	dc.b	
localVariable_CheckBox_Create_CheckBox_ColorOn	dc.b	
localVariable_CheckBox_Create_CheckBox_ColorOff	dc.b	
CheckBox_Create_block512
CheckBox_Create
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posX
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_CheckBox_Create_CheckBox_cbID ; optimized, look out for bugs
	lda localVariable_CheckBox_Create_CheckBox_posX
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posX,x
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posY
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_CheckBox_Create_CheckBox_posY
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_posY,x
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Width
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_CheckBox_Create_CheckBox_Width
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Width,x
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Height
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_CheckBox_Create_CheckBox_Height
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_Height,x
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOn
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_CheckBox_Create_CheckBox_ColorOn
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOn,x
	; Assigning single variable : CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOff
	; Store Variable simplified optimization : right-hand term is pure
	lda localVariable_CheckBox_Create_CheckBox_ColorOff
	sta CheckBox_checkboxes_CheckBox_tCheckBox_CheckBox_tCheckBox_ColorOff,x
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_WID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_CheckBox_Create_CheckBox_cbID
	ora #$80
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_WID
	
; //Cb type is 1;
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_posX
	lda localVariable_CheckBox_Create_CheckBox_posX
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_posX
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_posY
	lda localVariable_CheckBox_Create_CheckBox_posY
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_posY
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_Width
	lda localVariable_CheckBox_Create_CheckBox_Width
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_Width
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_Height
	lda localVariable_CheckBox_Create_CheckBox_Height
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_Height
	; Assigning single variable : localVariable_Widget_PlaceOnMap_Widget_WID
	lda localVariable_CheckBox_Create_CheckBox_WID
	; Calling storevariable
	sta localVariable_Widget_PlaceOnMap_Widget_WID
	jsr Widget_PlaceOnMap
	; Assigning single variable : localVariable_CheckBox_Draw_CheckBox_cbID
	lda localVariable_CheckBox_Create_CheckBox_cbID
	; Calling storevariable
	sta localVariable_CheckBox_Draw_CheckBox_cbID
	jsr CheckBox_Draw
	rts
	; ***********  Defining procedure : Conn_StringAtPos
	;    Procedure type : User-defined procedure
localVariable_Conn_StringAtPos_Conn_i	dc.b	
localVariable_Conn_StringAtPos_Conn_c	dc.b	
localVariable_Conn_StringAtPos_Conn_X	dc.b	
localVariable_Conn_StringAtPos_Conn_Y	dc.b	
localVariable_Conn_StringAtPos_Conn_caption	= $22
localVariable_Conn_StringAtPos_Conn_color	dc.b	
Conn_StringAtPos_block513
Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_i
	lda #$0
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_i
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_c
	; Load pointer array
	tay ; optimized y, look out for bugs L22 ORG 	ldy localVariable_Conn_StringAtPos_Conn_i
	lda (localVariable_Conn_StringAtPos_Conn_caption),y
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_c
Conn_StringAtPos_while514
	; Binary clause Simplified: NOTEQUALS
	lda localVariable_Conn_StringAtPos_Conn_c
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq Conn_StringAtPos_elsedoneblock517
Conn_StringAtPos_ConditionalTrueBlock515: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_X
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_Conn_StringAtPos_Conn_X
	clc
	adc localVariable_Conn_StringAtPos_Conn_i
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_X
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_Y
	lda localVariable_Conn_StringAtPos_Conn_Y
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_char
	lda localVariable_Conn_StringAtPos_Conn_c
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_char
	; Assigning single variable : localVariable_SCF_DrawChar_SCF_color
	lda localVariable_Conn_StringAtPos_Conn_color
	; Calling storevariable
	sta localVariable_SCF_DrawChar_SCF_color
	jsr SCF_DrawChar
	inc localVariable_Conn_StringAtPos_Conn_i
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_c
	; Load pointer array
	ldy localVariable_Conn_StringAtPos_Conn_i
	lda (localVariable_Conn_StringAtPos_Conn_caption),y
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_c
	jmp Conn_StringAtPos_while514
Conn_StringAtPos_elsedoneblock517
	rts
	; ***********  Defining procedure : Conn_C0
	;    Procedure type : User-defined procedure
Conn_C0
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	lda Conn_Xpos
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c00
	ldx #>Conn_c00
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C1
	;    Procedure type : User-defined procedure
Conn_C1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c10
	ldx #>Conn_c10
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c11
	ldx #>Conn_c11
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c12
	ldx #>Conn_c12
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C2
	;    Procedure type : User-defined procedure
Conn_C2
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c20
	ldx #>Conn_c20
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c21
	ldx #>Conn_c21
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c22
	ldx #>Conn_c22
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C3
	;    Procedure type : User-defined procedure
Conn_C3
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c30
	ldx #>Conn_c30
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c31
	ldx #>Conn_c31
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c32
	ldx #>Conn_c32
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C4
	;    Procedure type : User-defined procedure
Conn_C4
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c40
	ldx #>Conn_c40
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c41
	ldx #>Conn_c41
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c42
	ldx #>Conn_c42
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C5
	;    Procedure type : User-defined procedure
Conn_C5
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; 8 bit binop
	; Add/sub where right value is constant number
	lda Conn_Ypos
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c50
	ldx #>Conn_c50
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c51
	ldx #>Conn_c51
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c52
	ldx #>Conn_c52
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c53
	ldx #>Conn_c53
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$5
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c54
	ldx #>Conn_c54
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C6
	;    Procedure type : User-defined procedure
Conn_C6
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; 8 bit binop
	; Add/sub where right value is constant number
	lda Conn_Ypos
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c60
	ldx #>Conn_c60
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c61
	ldx #>Conn_c61
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c62
	ldx #>Conn_c62
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c63
	ldx #>Conn_c63
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$5
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c64
	ldx #>Conn_c64
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_C7
	;    Procedure type : User-defined procedure
Conn_C7
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	lda Conn_Ypos
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c70
	ldx #>Conn_c70
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; 8 bit binop
	; Add/sub where right value is constant number
	lda Conn_Ypos
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c71
	ldx #>Conn_c71
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$2
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c72
	ldx #>Conn_c72
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$3
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c73
	ldx #>Conn_c73
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$4
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c74
	ldx #>Conn_c74
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$5
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c75
	ldx #>Conn_c75
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_X
	; Optimizer: a = a +/- b
	lda Conn_Xpos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_X
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_Y
	; Optimizer: a = a +/- b
	lda Conn_Ypos
	clc
	adc #$6
	sta localVariable_Conn_StringAtPos_Conn_Y
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_caption
	lda #<Conn_c76
	ldx #>Conn_c76
	sta localVariable_Conn_StringAtPos_Conn_caption
	stx localVariable_Conn_StringAtPos_Conn_caption+1
	; Assigning single variable : localVariable_Conn_StringAtPos_Conn_color
	lda Conn_Color
	; Calling storevariable
	sta localVariable_Conn_StringAtPos_Conn_color
	jsr Conn_StringAtPos
	rts
	; ***********  Defining procedure : Conn_Show
	;    Procedure type : User-defined procedure
localVariable_Conn_Show_Conn_con	dc.b	
Conn_Show_block530
Conn_Show
	; Binary clause Simplified: NOTEQUALS
	lda Conn_LastCon
	; Compare with pure num / var optimization
	cmp localVariable_Conn_Show_Conn_con;keep
	beq Conn_Show_localfailed553
	jmp Conn_Show_ConditionalTrueBlock532
Conn_Show_localfailed553
	jmp Conn_Show_elsedoneblock534
Conn_Show_ConditionalTrueBlock532: ;Main true block ;keep 
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posX
	lda Conn_Xpos
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posX
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_posY
	lda Conn_Ypos
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_posY
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Width
	lda #$9
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Width
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_Height
	lda #$7
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_Height
	; Assigning single variable : localVariable_SCF_DrawBox_SCF_color
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_DrawBox_SCF_color
	jsr SCF_DrawBox
	lda localVariable_Conn_Show_Conn_con
	cmp #$0 ;keep
	bne Conn_Show_casenext556
	jsr Conn_C0
	jmp Conn_Show_caseend555
Conn_Show_casenext556
	lda localVariable_Conn_Show_Conn_con
	cmp #$1 ;keep
	bne Conn_Show_casenext558
	jsr Conn_C1
	jmp Conn_Show_caseend555
Conn_Show_casenext558
	lda localVariable_Conn_Show_Conn_con
	cmp #$2 ;keep
	bne Conn_Show_casenext560
	jsr Conn_C2
	jmp Conn_Show_caseend555
Conn_Show_casenext560
	lda localVariable_Conn_Show_Conn_con
	cmp #$3 ;keep
	bne Conn_Show_casenext562
	jsr Conn_C3
	jmp Conn_Show_caseend555
Conn_Show_casenext562
	lda localVariable_Conn_Show_Conn_con
	cmp #$4 ;keep
	bne Conn_Show_casenext564
	jsr Conn_C4
	jmp Conn_Show_caseend555
Conn_Show_casenext564
	lda localVariable_Conn_Show_Conn_con
	cmp #$5 ;keep
	bne Conn_Show_casenext566
	jsr Conn_C5
	jmp Conn_Show_caseend555
Conn_Show_casenext566
	lda localVariable_Conn_Show_Conn_con
	cmp #$6 ;keep
	bne Conn_Show_casenext568
	jsr Conn_C6
	jmp Conn_Show_caseend555
Conn_Show_casenext568
	lda localVariable_Conn_Show_Conn_con
	cmp #$7 ;keep
	bne Conn_Show_casenext570
	jsr Conn_C7
	jmp Conn_Show_caseend555
Conn_Show_casenext570
Conn_Show_caseend555
	; Assigning single variable : Conn_LastCon
	lda localVariable_Conn_Show_Conn_con
	; Calling storevariable
	sta Conn_LastCon
Conn_Show_elsedoneblock534
	rts
	; ***********  Defining procedure : CommonUI_CreateStdHorizontalSlider
	;    Procedure type : User-defined procedure
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID	dc.b	
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos	dc.b	
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos	dc.b	
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_	dc.b	
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_	dc.b	
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color	dc.b	
localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption	= $22
CommonUI_CreateStdHorizontalSlider_block572
CommonUI_CreateStdHorizontalSlider
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	ldx localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	sta localVariable_SCF_TextAtPos_SCF_caption
	stx localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_Label_Create_Label_lbID
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Calling storevariable
	sta localVariable_Label_Create_Label_lbID
	; Assigning single variable : localVariable_Label_Create_Label_posX
	; Optimizer: a = a +/- b
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	clc
	adc #$4
	sta localVariable_Label_Create_Label_posX
	; Assigning single variable : localVariable_Label_Create_Label_posY
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Calling storevariable
	sta localVariable_Label_Create_Label_posY
	; Assigning single variable : localVariable_Label_Create_Label_Color
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Calling storevariable
	sta localVariable_Label_Create_Label_Color
	jsr Label_Create
	; Assigning single variable : localVariable_Slider_Create_Slider_slID
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_slID
	; Assigning single variable : localVariable_Slider_Create_Slider_posX
	; Optimizer: a = a +/- b
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	clc
	adc #$7
	sta localVariable_Slider_Create_Slider_posX
	; Assigning single variable : localVariable_Slider_Create_Slider_posY
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_posY
	; Assigning single variable : localVariable_Slider_Create_Slider_Length_
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Length_
	; Assigning single variable : localVariable_Slider_Create_Slider_Color
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Color
	; Assigning single variable : localVariable_Slider_Create_Slider_Max_
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Max_
	; Assigning single variable : localVariable_Slider_Create_Slider_Mode
	lda #$1
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Mode
	; Assigning single variable : localVariable_Slider_Create_Slider_AttachedLabelID
	lda localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_AttachedLabelID
	jsr Slider_Create
	rts
	; ***********  Defining procedure : CommonUI_CreateStdVerticalSlider
	;    Procedure type : User-defined procedure
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID	dc.b	
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos	dc.b	
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos	dc.b	
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_	dc.b	
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_	dc.b	
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color	dc.b	
localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption	= $22
CommonUI_CreateStdVerticalSlider_block573
CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	ldx localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	sta localVariable_SCF_TextAtPos_SCF_caption
	stx localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_Label_Create_Label_lbID
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Calling storevariable
	sta localVariable_Label_Create_Label_lbID
	; Assigning single variable : localVariable_Label_Create_Label_posX
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Calling storevariable
	sta localVariable_Label_Create_Label_posX
	; Assigning single variable : localVariable_Label_Create_Label_posY
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	clc
	adc localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	 ; end add / sub var with constant
	clc
	adc #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Label_Create_Label_posY
	; Assigning single variable : localVariable_Label_Create_Label_Color
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Calling storevariable
	sta localVariable_Label_Create_Label_Color
	jsr Label_Create
	; Assigning single variable : localVariable_Slider_Create_Slider_slID
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_slID
	; Assigning single variable : localVariable_Slider_Create_Slider_posX
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_posX
	; Assigning single variable : localVariable_Slider_Create_Slider_posY
	; Optimizer: a = a +/- b
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	clc
	adc #$2
	sta localVariable_Slider_Create_Slider_posY
	; Assigning single variable : localVariable_Slider_Create_Slider_Length_
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Length_
	; Assigning single variable : localVariable_Slider_Create_Slider_Color
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Color
	; Assigning single variable : localVariable_Slider_Create_Slider_Max_
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Max_
	; Assigning single variable : localVariable_Slider_Create_Slider_Mode
	lda #$0
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Mode
	; Assigning single variable : localVariable_Slider_Create_Slider_AttachedLabelID
	lda localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_AttachedLabelID
	jsr Slider_Create
	rts
	; ***********  Defining procedure : setDT1
	;    Procedure type : User-defined procedure
localVariable_setDT1_op	dc.b	
localVariable_setDT1_value	dc.b	
setDT1_block574
setDT1
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_DT1
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setDT1_op ; optimized, look out for bugs
	lda localVariable_setDT1_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_DT1,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$0
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setDT1_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_opr
	lda localVariable_setDT1_op
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetDT1_YM2151_data
	lda localVariable_setDT1_value
	; Calling storevariable
	sta localVariable_YM2151_SetDT1_YM2151_data
	jsr YM2151_SetDT1
	rts
	; ***********  Defining procedure : setMUL
	;    Procedure type : User-defined procedure
localVariable_setMUL_op	dc.b	
localVariable_setMUL_value	dc.b	
setMUL_block577
setMUL
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_MUL
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setMUL_op ; optimized, look out for bugs
	lda localVariable_setMUL_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_MUL,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setMUL_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_opr
	lda localVariable_setMUL_op
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetMUL_YM2151_data
	lda localVariable_setMUL_value
	; Calling storevariable
	sta localVariable_YM2151_SetMUL_YM2151_data
	jsr YM2151_SetMUL
	rts
	; ***********  Defining procedure : setTL
	;    Procedure type : User-defined procedure
localVariable_setTL_op	dc.b	
localVariable_setTL_value	dc.b	
setTL_block580
setTL
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_TL
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setTL_op ; optimized, look out for bugs
	lda localVariable_setTL_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_TL,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$2
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setTL_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_opr
	lda localVariable_setTL_op
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetTL_YM2151_data
	lda localVariable_setTL_value
	; Calling storevariable
	sta localVariable_YM2151_SetTL_YM2151_data
	jsr YM2151_SetTL
	rts
	; ***********  Defining procedure : setKS
	;    Procedure type : User-defined procedure
localVariable_setKS_op	dc.b	
localVariable_setKS_value	dc.b	
setKS_block583
setKS
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_KS
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setKS_op ; optimized, look out for bugs
	lda localVariable_setKS_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_KS,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setKS_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_opr
	lda localVariable_setKS_op
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetKS_YM2151_data
	lda localVariable_setKS_value
	; Calling storevariable
	sta localVariable_YM2151_SetKS_YM2151_data
	jsr YM2151_SetKS
	rts
	; ***********  Defining procedure : setAR
	;    Procedure type : User-defined procedure
localVariable_setAR_op	dc.b	
localVariable_setAR_value	dc.b	
setAR_block586
setAR
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_AR
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setAR_op ; optimized, look out for bugs
	lda localVariable_setAR_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_AR,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$4
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setAR_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_opr
	lda localVariable_setAR_op
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetAR_YM2151_data
	lda localVariable_setAR_value
	; Calling storevariable
	sta localVariable_YM2151_SetAR_YM2151_data
	jsr YM2151_SetAR
	rts
	; ***********  Defining procedure : setD1R
	;    Procedure type : User-defined procedure
localVariable_setD1R_op	dc.b	
localVariable_setD1R_value	dc.b	
setD1R_block589
setD1R
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D1R
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setD1R_op ; optimized, look out for bugs
	lda localVariable_setD1R_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D1R,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$5
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setD1R_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_opr
	lda localVariable_setD1R_op
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetD1R_YM2151_data
	lda localVariable_setD1R_value
	; Calling storevariable
	sta localVariable_YM2151_SetD1R_YM2151_data
	jsr YM2151_SetD1R
	rts
	; ***********  Defining procedure : setDT2
	;    Procedure type : User-defined procedure
localVariable_setDT2_op	dc.b	
localVariable_setDT2_value	dc.b	
setDT2_block592
setDT2
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_DT2
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setDT2_op ; optimized, look out for bugs
	lda localVariable_setDT2_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_DT2,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$6
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setDT2_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_opr
	lda localVariable_setDT2_op
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetDT2_YM2151_data
	lda localVariable_setDT2_value
	; Calling storevariable
	sta localVariable_YM2151_SetDT2_YM2151_data
	jsr YM2151_SetDT2
	rts
	; ***********  Defining procedure : setD2R
	;    Procedure type : User-defined procedure
localVariable_setD2R_op	dc.b	
localVariable_setD2R_value	dc.b	
setD2R_block595
setD2R
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D2R
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setD2R_op ; optimized, look out for bugs
	lda localVariable_setD2R_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D2R,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$7
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setD2R_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_opr
	lda localVariable_setD2R_op
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetD2R_YM2151_data
	lda localVariable_setD2R_value
	; Calling storevariable
	sta localVariable_YM2151_SetD2R_YM2151_data
	jsr YM2151_SetD2R
	rts
	; ***********  Defining procedure : setD1L
	;    Procedure type : User-defined procedure
localVariable_setD1L_op	dc.b	
localVariable_setD1L_value	dc.b	
setD1L_block598
setD1L
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D1L
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setD1L_op ; optimized, look out for bugs
	lda localVariable_setD1L_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_D1L,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$8
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setD1L_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_opr
	lda localVariable_setD1L_op
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetD1L_YM2151_data
	lda localVariable_setD1L_value
	; Calling storevariable
	sta localVariable_YM2151_SetD1L_YM2151_data
	jsr YM2151_SetD1L
	rts
	; ***********  Defining procedure : setRR
	;    Procedure type : User-defined procedure
localVariable_setRR_op	dc.b	
localVariable_setRR_value	dc.b	
setRR_block601
setRR
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_RR
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setRR_op ; optimized, look out for bugs
	lda localVariable_setRR_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_RR,x
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$9
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setRR_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_opr
	lda localVariable_setRR_op
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetRR_YM2151_data
	lda localVariable_setRR_value
	; Calling storevariable
	sta localVariable_YM2151_SetRR_YM2151_data
	jsr YM2151_SetRR
	rts
	; ***********  Defining procedure : setAMSEN
	;    Procedure type : User-defined procedure
localVariable_setAMSEN_op	dc.b	
localVariable_setAMSEN_value	dc.b	
setAMSEN_block604
setAMSEN
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_AMSEN
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setAMSEN_op ; optimized, look out for bugs
	lda localVariable_setAMSEN_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_AMSEN,x
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_cbID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$0
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_value
	lda localVariable_setAMSEN_value
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_value
	jsr CheckBox_setValue
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_opr
	lda localVariable_setAMSEN_op
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetAMSEN_YM2151_data
	lda localVariable_setAMSEN_value
	; Calling storevariable
	sta localVariable_YM2151_SetAMSEN_YM2151_data
	jsr YM2151_SetAMSEN
	rts
	; ***********  Defining procedure : setKEYON
	;    Procedure type : User-defined procedure
localVariable_setKEYON_op	dc.b	
localVariable_setKEYON_value	dc.b	
setKEYON_block607
setKEYON
	; Assigning single variable : YM2151OpStats_tYM2151OpStat_tYM2151OpStat_KEYON
	; Store Variable simplified optimization : right-hand term is pure
	ldx localVariable_setKEYON_op ; optimized, look out for bugs
	lda localVariable_setKEYON_value
	sta YM2151OpStats_tYM2151OpStat_tYM2151OpStat_KEYON,x
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_cbID
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_value
	lda localVariable_setKEYON_value
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_value
	jsr CheckBox_setValue
	; Assigning single variable : localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	lda localVariable_setKEYON_op
	; Calling storevariable
	sta localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_opr
	; Assigning single variable : localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_data
	lda localVariable_setKEYON_value
	; Calling storevariable
	sta localVariable_YM2151_SetAtKeyOnOperatorEnabled_YM2151_data
	jsr YM2151_SetAtKeyOnOperatorEnabled
	rts
	; ***********  Defining procedure : setFB
	;    Procedure type : User-defined procedure
localVariable_setFB_value	dc.b	
setFB_block610
setFB
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_FB
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setFB_value
	sta YM2151State_tYM2151State_tYM2151State_FB + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$28
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setFB_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetFB_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetFB_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetFB_YM2151_data
	lda localVariable_setFB_value
	; Calling storevariable
	sta localVariable_YM2151_SetFB_YM2151_data
	jsr YM2151_SetFB
	rts
	; ***********  Defining procedure : setCON
	;    Procedure type : User-defined procedure
localVariable_setCON_value	dc.b	
setCON_block611
setCON
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_CON
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setCON_value
	sta YM2151State_tYM2151State_tYM2151State_CON + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$29
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setCON_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetCON_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetCON_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetCON_YM2151_data
	lda localVariable_setCON_value
	; Calling storevariable
	sta localVariable_YM2151_SetCON_YM2151_data
	jsr YM2151_SetCON
	; Assigning single variable : localVariable_Conn_Show_Conn_con
	lda localVariable_setCON_value
	; Calling storevariable
	sta localVariable_Conn_Show_Conn_con
	jsr Conn_Show
	rts
	; ***********  Defining procedure : setPMS
	;    Procedure type : User-defined procedure
localVariable_setPMS_value	dc.b	
setPMS_block612
setPMS
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_PMS
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setPMS_value
	sta YM2151State_tYM2151State_tYM2151State_PMS + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$2a
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setPMS_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetPMS_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetPMS_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetPMS_YM2151_data
	lda localVariable_setPMS_value
	; Calling storevariable
	sta localVariable_YM2151_SetPMS_YM2151_data
	jsr YM2151_SetPMS
	rts
	; ***********  Defining procedure : setAMS
	;    Procedure type : User-defined procedure
localVariable_setAMS_value	dc.b	
setAMS_block613
setAMS
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_AMS
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setAMS_value
	sta YM2151State_tYM2151State_tYM2151State_AMS + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$2b
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setAMS_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetAMS_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetAMS_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetAMS_YM2151_data
	lda localVariable_setAMS_value
	; Calling storevariable
	sta localVariable_YM2151_SetAMS_YM2151_data
	jsr YM2151_SetAMS
	rts
	; ***********  Defining procedure : setLFRQ
	;    Procedure type : User-defined procedure
localVariable_setLFRQ_value	dc.b	
setLFRQ_block614
setLFRQ
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_LFRQ
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setLFRQ_value
	sta YM2151State_tYM2151State_tYM2151State_LFRQ + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$2c
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setLFRQ_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetLFRQ_YM2151_data
	lda localVariable_setLFRQ_value
	; Calling storevariable
	sta localVariable_YM2151_SetLFRQ_YM2151_data
	jsr YM2151_SetLFRQ
	rts
	; ***********  Defining procedure : setPMDAMD
	;    Procedure type : User-defined procedure
localVariable_setPMDAMD_value	dc.b	
setPMDAMD_block615
setPMDAMD
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_PMDAMD
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setPMDAMD_value
	sta YM2151State_tYM2151State_tYM2151State_PMDAMD + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$2d
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setPMDAMD_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetPMDAMD_YM2151_data
	lda localVariable_setPMDAMD_value
	; Calling storevariable
	sta localVariable_YM2151_SetPMDAMD_YM2151_data
	jsr YM2151_SetPMDAMD
	rts
	; ***********  Defining procedure : setW
	;    Procedure type : User-defined procedure
localVariable_setW_value	dc.b	
setW_block616
setW
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_W
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setW_value
	sta YM2151State_tYM2151State_tYM2151State_W + $00
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$2e
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setW_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : localVariable_YM2151_SetW_YM2151_data
	lda localVariable_setW_value
	; Calling storevariable
	sta localVariable_YM2151_SetW_YM2151_data
	jsr YM2151_SetW
	rts
	; ***********  Defining procedure : setR
	;    Procedure type : User-defined procedure
localVariable_setR_value	dc.b	
setR_block617
setR
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_R
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setR_value
	sta YM2151State_tYM2151State_tYM2151State_R + $00
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_cbID
	lda #$28
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_value
	lda localVariable_setR_value
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_value
	jsr CheckBox_setValue
	; Assigning single variable : localVariable_YM2151_SetR_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetR_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetR_YM2151_data
	lda localVariable_setR_value
	; Calling storevariable
	sta localVariable_YM2151_SetR_YM2151_data
	jsr YM2151_SetR
	rts
	; ***********  Defining procedure : setL
	;    Procedure type : User-defined procedure
localVariable_setL_value	dc.b	
setL_block618
setL
	; Assigning single variable : YM2151State_tYM2151State_tYM2151State_L
	; Store Variable is pure numeric and not pointer - store directly!
	lda localVariable_setL_value
	sta YM2151State_tYM2151State_tYM2151State_L + $00
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_cbID
	lda #$29
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_value
	lda localVariable_setL_value
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_value
	jsr CheckBox_setValue
	; Assigning single variable : localVariable_YM2151_SetL_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetL_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetL_YM2151_data
	lda localVariable_setL_value
	; Calling storevariable
	sta localVariable_YM2151_SetL_YM2151_data
	jsr YM2151_SetL
	rts
	; ***********  Defining procedure : setHOLDKEY
	;    Procedure type : User-defined procedure
localVariable_setHOLDKEY_value	dc.b	
setHOLDKEY_block619
setHOLDKEY
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_cbID
	lda #$32
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_setValue_CheckBox_value
	lda localVariable_setHOLDKEY_value
	; Calling storevariable
	sta localVariable_CheckBox_setValue_CheckBox_value
	jsr CheckBox_setValue
	; Assigning single variable : holdkey
	lda localVariable_setHOLDKEY_value
	; Calling storevariable
	sta holdkey
	rts
	; ***********  Defining procedure : setTRANSPOSE
	;    Procedure type : User-defined procedure
localVariable_setTRANSPOSE_value	dc.b	
setTRANSPOSE_block620
setTRANSPOSE
	; Assigning single variable : localVariable_Slider_setValue_Slider_slID
	lda #$32
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_slID
	; Assigning single variable : localVariable_Slider_setValue_Slider_value
	lda localVariable_setTRANSPOSE_value
	; Calling storevariable
	sta localVariable_Slider_setValue_Slider_value
	jsr Slider_setValue
	; Assigning single variable : transpose
	lda localVariable_setTRANSPOSE_value
	; Calling storevariable
	sta transpose
	rts
	; ***********  Defining procedure : dumpRegs
	;    Procedure type : User-defined procedure
localVariable_dumpRegs_y	dc.b	
localVariable_dumpRegs_x	dc.b	
dumpRegs_block621
dumpRegs
	; Assigning single variable : localVariable_dumpRegs_x
	lda #$0
	; Calling storevariable
	sta localVariable_dumpRegs_x
dumpRegs_forloop622
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	ldx localVariable_dumpRegs_x ; optimized, look out for bugs
	; Load right hand side
	lda #$3
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$4
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$2a
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	lda localVariable_dumpRegs_x
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$3
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; IS ONPAGE
	inc localVariable_dumpRegs_x
	lda #$f
	cmp localVariable_dumpRegs_x ;keep
	bcs dumpRegs_forloop622
dumpRegs_loopdone629: ;keep
	; Assigning single variable : localVariable_dumpRegs_y
	lda #$0
	; Calling storevariable
	sta localVariable_dumpRegs_y
dumpRegs_forloop630
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	; Optimizer: a = a +/- b
	lda localVariable_dumpRegs_y
	clc
	adc #$2b
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	lda localVariable_dumpRegs_y
	asl
	asl
	asl
	asl
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$3
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Assigning single variable : localVariable_dumpRegs_x
	lda #$0
	; Calling storevariable
	sta localVariable_dumpRegs_x
dumpRegs_forloop632
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	ldx localVariable_dumpRegs_x ; optimized, look out for bugs
	; Load right hand side
	lda #$3
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	clc
	adc #$4
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	; Optimizer: a = a +/- b
	lda localVariable_dumpRegs_y
	clc
	adc #$2b
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	; Load Byte array
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	lda localVariable_dumpRegs_y
	asl
	asl
	asl
	asl
	clc
	adc localVariable_dumpRegs_x
	 ; end add / sub var with constant
	tax
	lda YM2151_YMLastState,x
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$2
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; IS ONPAGE
	inc localVariable_dumpRegs_x
	lda #$f
	cmp localVariable_dumpRegs_x ;keep
	bcs dumpRegs_forloop632
dumpRegs_loopdone639: ;keep
	; IS ONPAGE
	inc localVariable_dumpRegs_y
	lda #$f
	cmp localVariable_dumpRegs_y ;keep
	bcs dumpRegs_forloop630
dumpRegs_loopdone649: ;keep
	rts
	; ***********  Defining procedure : handlebuttonclick
	;    Procedure type : User-defined procedure
localVariable_handlebuttonclick_clickedButton	dc.b	
handlebuttonclick_block650
handlebuttonclick
	; Assigning single variable : localVariable_handlebuttonclick_clickedButton
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posX
	lda X16Mouse_mouseXchposAtClick
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posX
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posY
	lda X16Mouse_mouseYchposAtClick
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posY
	jsr Widget_getMapValue
	; Calling storevariable
	sta localVariable_handlebuttonclick_clickedButton
	; Binary clause Simplified: EQUALS
handlebuttonclick_binary_clause_temp_var657 = $24
	sta handlebuttonclick_binary_clause_temp_var657
handlebuttonclick_binary_clause_temp_2_var658 = $26
	sta handlebuttonclick_binary_clause_temp_2_var658
	lda handlebuttonclick_binary_clause_temp_var657
	cmp handlebuttonclick_binary_clause_temp_2_var658;keep
	bne handlebuttonclick_elsedoneblock654
handlebuttonclick_ConditionalTrueBlock652: ;Main true block ;keep 
handlebuttonclick_caseend660
handlebuttonclick_elsedoneblock654
	rts
	; ***********  Defining procedure : handlesliderchange
	;    Procedure type : User-defined procedure
handlesliderchange
	lda Slider_clickedSlider
	cmp #$28 ;keep
	bne handlesliderchange_casenext663
	
; //SCF::DrawBinByte(40,6,clickedSlider,5);
	; Assigning single variable : localVariable_setFB_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$28
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setFB_value
	jsr setFB
	jmp handlesliderchange_caseend662
handlesliderchange_casenext663
	lda Slider_clickedSlider
	cmp #$29 ;keep
	bne handlesliderchange_casenext665
	; Assigning single variable : localVariable_setCON_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$29
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setCON_value
	jsr setCON
	jmp handlesliderchange_caseend662
handlesliderchange_casenext665
	lda Slider_clickedSlider
	cmp #$2a ;keep
	bne handlesliderchange_casenext667
	; Assigning single variable : localVariable_setPMS_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$2a
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setPMS_value
	jsr setPMS
	jmp handlesliderchange_caseend662
handlesliderchange_casenext667
	lda Slider_clickedSlider
	cmp #$2b ;keep
	bne handlesliderchange_casenext669
	; Assigning single variable : localVariable_setAMS_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$2b
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setAMS_value
	jsr setAMS
	jmp handlesliderchange_caseend662
handlesliderchange_casenext669
	lda Slider_clickedSlider
	cmp #$2c ;keep
	bne handlesliderchange_casenext671
	; Assigning single variable : localVariable_setLFRQ_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$2c
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setLFRQ_value
	jsr setLFRQ
	jmp handlesliderchange_caseend662
handlesliderchange_casenext671
	lda Slider_clickedSlider
	cmp #$2d ;keep
	bne handlesliderchange_casenext673
	; Assigning single variable : localVariable_setPMDAMD_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$2d
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setPMDAMD_value
	jsr setPMDAMD
	jmp handlesliderchange_caseend662
handlesliderchange_casenext673
	lda Slider_clickedSlider
	cmp #$2e ;keep
	bne handlesliderchange_casenext675
	; Assigning single variable : localVariable_setW_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$2e
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setW_value
	jsr setW
	jmp handlesliderchange_caseend662
handlesliderchange_casenext675
	lda Slider_clickedSlider
	cmp #$0 ;keep
	bne handlesliderchange_casenext677
	; Assigning single variable : localVariable_setDT1_op
	lda #$0
	; Calling storevariable
	sta localVariable_setDT1_op
	; Assigning single variable : localVariable_setDT1_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT1_value
	jsr setDT1
	jmp handlesliderchange_caseend662
handlesliderchange_casenext677
	lda Slider_clickedSlider
	cmp #$a ;keep
	bne handlesliderchange_casenext679
	; Assigning single variable : localVariable_setDT1_op
	lda #$1
	; Calling storevariable
	sta localVariable_setDT1_op
	; Assigning single variable : localVariable_setDT1_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$a
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT1_value
	jsr setDT1
	jmp handlesliderchange_caseend662
handlesliderchange_casenext679
	lda Slider_clickedSlider
	cmp #$14 ;keep
	bne handlesliderchange_casenext681
	; Assigning single variable : localVariable_setDT1_op
	lda #$2
	; Calling storevariable
	sta localVariable_setDT1_op
	; Assigning single variable : localVariable_setDT1_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$14
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT1_value
	jsr setDT1
	jmp handlesliderchange_caseend662
handlesliderchange_casenext681
	lda Slider_clickedSlider
	cmp #$1e ;keep
	bne handlesliderchange_casenext683
	; Assigning single variable : localVariable_setDT1_op
	lda #$3
	; Calling storevariable
	sta localVariable_setDT1_op
	; Assigning single variable : localVariable_setDT1_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1e
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT1_value
	jsr setDT1
	jmp handlesliderchange_caseend662
handlesliderchange_casenext683
	lda Slider_clickedSlider
	cmp #$1 ;keep
	bne handlesliderchange_casenext685
	; Assigning single variable : localVariable_setMUL_op
	lda #$0
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext685
	lda Slider_clickedSlider
	cmp #$b ;keep
	bne handlesliderchange_casenext687
	; Assigning single variable : localVariable_setMUL_op
	lda #$1
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$b
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext687
	lda Slider_clickedSlider
	cmp #$15 ;keep
	bne handlesliderchange_casenext689
	; Assigning single variable : localVariable_setMUL_op
	lda #$2
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$15
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext689
	lda Slider_clickedSlider
	cmp #$1f ;keep
	bne handlesliderchange_casenext691
	; Assigning single variable : localVariable_setMUL_op
	lda #$3
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1f
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext691
	lda Slider_clickedSlider
	cmp #$2 ;keep
	bne handlesliderchange_casenext693
	; Assigning single variable : localVariable_setTL_op
	lda #$0
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$2
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext693
	lda Slider_clickedSlider
	cmp #$c ;keep
	bne handlesliderchange_casenext695
	; Assigning single variable : localVariable_setTL_op
	lda #$1
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$c
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext695
	lda Slider_clickedSlider
	cmp #$16 ;keep
	bne handlesliderchange_casenext697
	; Assigning single variable : localVariable_setTL_op
	lda #$2
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$16
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext697
	lda Slider_clickedSlider
	cmp #$20 ;keep
	bne handlesliderchange_casenext699
	; Assigning single variable : localVariable_setTL_op
	lda #$3
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$20
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	jmp handlesliderchange_caseend662
handlesliderchange_casenext699
	lda Slider_clickedSlider
	cmp #$3 ;keep
	bne handlesliderchange_casenext701
	; Assigning single variable : localVariable_setKS_op
	lda #$0
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$3
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	jmp handlesliderchange_caseend662
handlesliderchange_casenext701
	lda Slider_clickedSlider
	cmp #$d ;keep
	bne handlesliderchange_casenext703
	; Assigning single variable : localVariable_setKS_op
	lda #$1
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$d
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	jmp handlesliderchange_caseend662
handlesliderchange_casenext703
	lda Slider_clickedSlider
	cmp #$17 ;keep
	bne handlesliderchange_casenext705
	; Assigning single variable : localVariable_setKS_op
	lda #$2
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$17
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	jmp handlesliderchange_caseend662
handlesliderchange_casenext705
	lda Slider_clickedSlider
	cmp #$21 ;keep
	bne handlesliderchange_casenext707
	; Assigning single variable : localVariable_setKS_op
	lda #$3
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$21
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	jmp handlesliderchange_caseend662
handlesliderchange_casenext707
	lda Slider_clickedSlider
	cmp #$4 ;keep
	bne handlesliderchange_casenext709
	; Assigning single variable : localVariable_setAR_op
	lda #$0
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$4
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext709
	lda Slider_clickedSlider
	cmp #$e ;keep
	bne handlesliderchange_casenext711
	; Assigning single variable : localVariable_setAR_op
	lda #$1
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$e
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext711
	lda Slider_clickedSlider
	cmp #$18 ;keep
	bne handlesliderchange_casenext713
	; Assigning single variable : localVariable_setAR_op
	lda #$2
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$18
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext713
	lda Slider_clickedSlider
	cmp #$22 ;keep
	bne handlesliderchange_casenext715
	; Assigning single variable : localVariable_setAR_op
	lda #$3
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$22
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext715
	lda Slider_clickedSlider
	cmp #$5 ;keep
	bne handlesliderchange_casenext717
	; Assigning single variable : localVariable_setD1R_op
	lda #$0
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$5
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext717
	lda Slider_clickedSlider
	cmp #$f ;keep
	bne handlesliderchange_casenext719
	; Assigning single variable : localVariable_setD1R_op
	lda #$1
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$f
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext719
	lda Slider_clickedSlider
	cmp #$19 ;keep
	bne handlesliderchange_casenext721
	; Assigning single variable : localVariable_setD1R_op
	lda #$2
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$19
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext721
	lda Slider_clickedSlider
	cmp #$23 ;keep
	bne handlesliderchange_casenext723
	; Assigning single variable : localVariable_setD1R_op
	lda #$3
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$23
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext723
	lda Slider_clickedSlider
	cmp #$6 ;keep
	bne handlesliderchange_casenext725
	; Assigning single variable : localVariable_setDT2_op
	lda #$0
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$6
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	jmp handlesliderchange_caseend662
handlesliderchange_casenext725
	lda Slider_clickedSlider
	cmp #$10 ;keep
	bne handlesliderchange_casenext727
	; Assigning single variable : localVariable_setDT2_op
	lda #$1
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$10
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	jmp handlesliderchange_caseend662
handlesliderchange_casenext727
	lda Slider_clickedSlider
	cmp #$1a ;keep
	bne handlesliderchange_casenext729
	; Assigning single variable : localVariable_setDT2_op
	lda #$2
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1a
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	jmp handlesliderchange_caseend662
handlesliderchange_casenext729
	lda Slider_clickedSlider
	cmp #$24 ;keep
	bne handlesliderchange_casenext731
	; Assigning single variable : localVariable_setDT2_op
	lda #$3
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$24
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	jmp handlesliderchange_caseend662
handlesliderchange_casenext731
	lda Slider_clickedSlider
	cmp #$7 ;keep
	bne handlesliderchange_casenext733
	; Assigning single variable : localVariable_setD2R_op
	lda #$0
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$7
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext733
	lda Slider_clickedSlider
	cmp #$11 ;keep
	bne handlesliderchange_casenext735
	; Assigning single variable : localVariable_setD2R_op
	lda #$1
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$11
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext735
	lda Slider_clickedSlider
	cmp #$1b ;keep
	bne handlesliderchange_casenext737
	; Assigning single variable : localVariable_setD2R_op
	lda #$2
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1b
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext737
	lda Slider_clickedSlider
	cmp #$25 ;keep
	bne handlesliderchange_casenext739
	; Assigning single variable : localVariable_setD2R_op
	lda #$3
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$25
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	jmp handlesliderchange_caseend662
handlesliderchange_casenext739
	lda Slider_clickedSlider
	cmp #$8 ;keep
	bne handlesliderchange_casenext741
	; Assigning single variable : localVariable_setD1L_op
	lda #$0
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$8
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	jmp handlesliderchange_caseend662
handlesliderchange_casenext741
	lda Slider_clickedSlider
	cmp #$12 ;keep
	bne handlesliderchange_casenext743
	; Assigning single variable : localVariable_setD1L_op
	lda #$1
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$12
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	jmp handlesliderchange_caseend662
handlesliderchange_casenext743
	lda Slider_clickedSlider
	cmp #$1c ;keep
	bne handlesliderchange_casenext745
	; Assigning single variable : localVariable_setD1L_op
	lda #$2
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1c
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	jmp handlesliderchange_caseend662
handlesliderchange_casenext745
	lda Slider_clickedSlider
	cmp #$26 ;keep
	bne handlesliderchange_casenext747
	; Assigning single variable : localVariable_setD1L_op
	lda #$3
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$26
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	jmp handlesliderchange_caseend662
handlesliderchange_casenext747
	lda Slider_clickedSlider
	cmp #$9 ;keep
	bne handlesliderchange_casenext749
	; Assigning single variable : localVariable_setRR_op
	lda #$0
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$9
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext749
	lda Slider_clickedSlider
	cmp #$13 ;keep
	bne handlesliderchange_casenext751
	; Assigning single variable : localVariable_setRR_op
	lda #$1
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$13
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext751
	lda Slider_clickedSlider
	cmp #$1d ;keep
	bne handlesliderchange_casenext753
	; Assigning single variable : localVariable_setRR_op
	lda #$2
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$1d
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext753
	lda Slider_clickedSlider
	cmp #$27 ;keep
	bne handlesliderchange_casenext755
	; Assigning single variable : localVariable_setRR_op
	lda #$3
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$27
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	jmp handlesliderchange_caseend662
handlesliderchange_casenext755
	lda Slider_clickedSlider
	cmp #$32 ;keep
	bne handlesliderchange_casenext757
	; Assigning single variable : localVariable_setTRANSPOSE_value
	; Assigning single variable : localVariable_Slider_getValue_Slider_slID
	lda #$32
	; Calling storevariable
	sta localVariable_Slider_getValue_Slider_slID
	jsr Slider_getValue
	; Calling storevariable
	sta localVariable_setTRANSPOSE_value
	jsr setTRANSPOSE
	jmp handlesliderchange_caseend662
handlesliderchange_casenext757
handlesliderchange_caseend662
	rts
	; ***********  Defining procedure : handlecheckboxchange
	;    Procedure type : User-defined procedure
handlecheckboxchange
	lda CheckBox_clickedcheckbox
	cmp #$0 ;keep
	bne handlecheckboxchange_casenext761
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$0
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext761
	lda CheckBox_clickedcheckbox
	cmp #$a ;keep
	bne handlecheckboxchange_casenext763
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$1
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$a
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext763
	lda CheckBox_clickedcheckbox
	cmp #$14 ;keep
	bne handlecheckboxchange_casenext765
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$2
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$14
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext765
	lda CheckBox_clickedcheckbox
	cmp #$1e ;keep
	bne handlecheckboxchange_casenext767
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$3
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$1e
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext767
	lda CheckBox_clickedcheckbox
	cmp #$1 ;keep
	bne handlecheckboxchange_casenext769
	; Assigning single variable : localVariable_setKEYON_op
	lda #$0
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$1
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext769
	lda CheckBox_clickedcheckbox
	cmp #$b ;keep
	bne handlecheckboxchange_casenext771
	; Assigning single variable : localVariable_setKEYON_op
	lda #$1
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$b
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext771
	lda CheckBox_clickedcheckbox
	cmp #$15 ;keep
	bne handlecheckboxchange_casenext773
	; Assigning single variable : localVariable_setKEYON_op
	lda #$2
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$15
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext773
	lda CheckBox_clickedcheckbox
	cmp #$1f ;keep
	bne handlecheckboxchange_casenext775
	; Assigning single variable : localVariable_setKEYON_op
	lda #$3
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$1f
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext775
	lda CheckBox_clickedcheckbox
	cmp #$29 ;keep
	bne handlecheckboxchange_casenext777
	; Assigning single variable : localVariable_setL_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$29
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setL_value
	jsr setL
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext777
	lda CheckBox_clickedcheckbox
	cmp #$28 ;keep
	bne handlecheckboxchange_casenext779
	; Assigning single variable : localVariable_setR_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$28
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setR_value
	jsr setR
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext779
	lda CheckBox_clickedcheckbox
	cmp #$32 ;keep
	bne handlecheckboxchange_casenext781
	; Assigning single variable : localVariable_setHOLDKEY_value
	; Assigning single variable : localVariable_CheckBox_getValue_CheckBox_cbID
	lda #$32
	; Calling storevariable
	sta localVariable_CheckBox_getValue_CheckBox_cbID
	jsr CheckBox_getValue
	; Calling storevariable
	sta localVariable_setHOLDKEY_value
	jsr setHOLDKEY
	jmp handlecheckboxchange_caseend760
handlecheckboxchange_casenext781
handlecheckboxchange_caseend760
	; Assigning single variable : CheckBox_clickedcheckbox
	lda #$ff
	; Calling storevariable
	sta CheckBox_clickedcheckbox
	rts
	; ***********  Defining procedure : handlemouse
	;    Procedure type : User-defined procedure
handlemouse
	jsr X16Mouse_GetState
	jsr X16Mouse_CalcChPos
	
; //	X16Mouse::Xch:=(X16Mouse::X>>3);
; //	X16Mouse::Ych:=(X16Mouse::Y>>3);
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$4b
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$38
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	lda X16Mouse_Buttons
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_X
	lda #$46
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Y
	lda #$39
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Number
	; integer assignment NodeVar
	ldy X16Mouse_X+1 ; Next one ; optimized, look out for bugs
	lda X16Mouse_X
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Number
	sty localVariable_SCF_DrawHexInt_SCF_Number+1
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Col
	lda #$4
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Col
	jsr SCF_DrawHexInt
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_X
	lda #$46
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Y
	lda #$3a
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Number
	; integer assignment NodeVar
	ldy X16Mouse_Y+1 ; Next one ; optimized, look out for bugs
	lda X16Mouse_Y
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Number
	sty localVariable_SCF_DrawHexInt_SCF_Number+1
	; Assigning single variable : localVariable_SCF_DrawHexInt_SCF_Col
	lda #$5
	; Calling storevariable
	sta localVariable_SCF_DrawHexInt_SCF_Col
	jsr SCF_DrawHexInt
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$4b
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$39
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	lda X16Mouse_Xch
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$4
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$4b
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$3a
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	lda X16Mouse_Ych
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$5
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda #$4b
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda #$3b
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posX
	lda X16Mouse_Xch
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posX
	; Assigning single variable : localVariable_Widget_getMapValue_Widget_posY
	lda X16Mouse_Ych
	; Calling storevariable
	sta localVariable_Widget_getMapValue_Widget_posY
	jsr Widget_getMapValue
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda #$7
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Binary clause Simplified: EQUALS
	lda X16Mouse_Buttons
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne handlemouse_elsedoneblock787
handlemouse_ConditionalTrueBlock785: ;Main true block ;keep 
	jsr Slider_HandleClick
	jsr handlesliderchange
	; Binary clause Simplified: EQUALS
	lda X16Mouse_mouseClicked
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne handlemouse_elsedoneblock799
handlemouse_ConditionalTrueBlock797: ;Main true block ;keep 
	; Assigning single variable : X16Mouse_mouseXchposAtClick
	lda X16Mouse_Xch
	; Calling storevariable
	sta X16Mouse_mouseXchposAtClick
	; Assigning single variable : X16Mouse_mouseYchposAtClick
	lda X16Mouse_Ych
	; Calling storevariable
	sta X16Mouse_mouseYchposAtClick
	; Assigning single variable : X16Mouse_mouseClicked
	lda #$1
	; Calling storevariable
	sta X16Mouse_mouseClicked
handlemouse_elsedoneblock799
handlemouse_elsedoneblock787
	; Binary clause Simplified: EQUALS
	lda X16Mouse_Buttons
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne handlemouse_elsedoneblock805
handlemouse_ConditionalTrueBlock803: ;Main true block ;keep 
	; Binary clause Simplified: EQUALS
	lda X16Mouse_mouseClicked
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne handlemouse_elsedoneblock817
handlemouse_ConditionalTrueBlock815: ;Main true block ;keep 
	jsr handlebuttonclick
	jsr CheckBox_HandleClick
	jsr handlecheckboxchange
	; Assigning single variable : X16Mouse_mouseClicked
	lda #$0
	; Calling storevariable
	sta X16Mouse_mouseClicked
	; Assigning single variable : Slider_clickedSlider
	lda #$ff
	; Calling storevariable
	sta Slider_clickedSlider
handlemouse_elsedoneblock817
handlemouse_elsedoneblock805
	rts
	; ***********  Defining procedure : createOPBlock
	;    Procedure type : User-defined procedure
localVariable_createOPBlock_opmult	dc.b	
localVariable_createOPBlock_color	dc.b	
localVariable_createOPBlock_op	dc.b	
localVariable_createOPBlock_Xpos	dc.b	
localVariable_createOPBlock_Ypos	dc.b	
createOPBlock_block820
createOPBlock
	; Assigning single variable : localVariable_createOPBlock_opmult
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul
	ldx localVariable_createOPBlock_op ; optimized, look out for bugs
	; Load right hand side
	lda #$a
	jsr multiply_eightbit
	txa
	ldy #0 ; ::EightbitMul
	; Calling storevariable
	sta localVariable_createOPBlock_opmult
	; Assigning single variable : localVariable_createOPBlock_color
	lda #$1
	; Calling storevariable
	sta localVariable_createOPBlock_color
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_X
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_X
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Y
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Y
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda localVariable_createOPBlock_op
	clc
	adc #$1
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Number
	; Assigning single variable : localVariable_SCF_DrawHexByte_SCF_Col
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_SCF_DrawHexByte_SCF_Col
	jsr SCF_DrawHexByte
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_cbID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$1
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posX
	; Optimizer: a = a +/- b
	lda localVariable_createOPBlock_Xpos
	clc
	adc #$3
	sta localVariable_CheckBox_Create_CheckBox_posX
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posY
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posY
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Width
	lda #$3
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Width
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Height
	lda #$1
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Height
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOn
	lda #$5
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOn
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOff
	lda #$2
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOff
	jsr CheckBox_Create
	inc localVariable_createOPBlock_Ypos
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$4
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$1f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr825
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr825
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$5
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$1f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr828
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr828
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$7
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$1f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr831
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr831
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$8
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr834
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr834
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$9
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr837
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr837
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$2
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$20
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$7f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr840
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr840
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	; Assigning single variable : localVariable_createOPBlock_color
	lda #$1
	; Calling storevariable
	sta localVariable_createOPBlock_color
	; Assigning single variable : localVariable_createOPBlock_Ypos
	; Optimizer: a = a +/- b
	lda localVariable_createOPBlock_Ypos
	sec
	sbc #$5
	sta localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_createOPBlock_Xpos
	; Optimizer: a = a +/- b
	lda localVariable_createOPBlock_Xpos
	clc
	adc #$16
	sta localVariable_createOPBlock_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$1
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr842
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr842
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$0
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$7
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr845
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr845
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$6
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr848
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr848
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$3
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	lda #$a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #<createOPBlock_stringassignstr851
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption
	lda #>createOPBlock_stringassignstr851
	sta localVariable_CommonUI_CreateStdHorizontalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdHorizontalSlider
	inc localVariable_createOPBlock_Ypos
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<createOPBlock_stringassignstr854
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>createOPBlock_stringassignstr854
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_createOPBlock_color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_cbID
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$0
	clc
	adc localVariable_createOPBlock_opmult
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posX
	; Optimizer: a = a +/- b
	lda localVariable_createOPBlock_Xpos
	clc
	adc #$7
	sta localVariable_CheckBox_Create_CheckBox_posX
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posY
	lda localVariable_createOPBlock_Ypos
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posY
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Width
	lda #$3
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Width
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Height
	lda #$1
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Height
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOn
	lda #$5
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOn
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOff
	lda #$2
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOff
	jsr CheckBox_Create
	rts
	; ***********  Defining procedure : createUI
	;    Procedure type : User-defined procedure
localVariable_createUI_Ypos	dc.b	
localVariable_createUI_color	dc.b	
createUI_block856
createUI
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<createUI_stringassignstr857
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>createUI_stringassignstr857
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda #$1
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_createUI_Ypos
	lda #$3
	; Calling storevariable
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_createOPBlock_op
	lda #$0
	; Calling storevariable
	sta localVariable_createOPBlock_op
	; Assigning single variable : localVariable_createOPBlock_Xpos
	lda #$1
	; Calling storevariable
	sta localVariable_createOPBlock_Xpos
	; Assigning single variable : localVariable_createOPBlock_Ypos
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_createOPBlock_Ypos
	jsr createOPBlock
	; Assigning single variable : localVariable_createUI_Ypos
	; Optimizer: a = a +/- b
	lda localVariable_createUI_Ypos
	clc
	adc #$a
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_createOPBlock_op
	lda #$1
	; Calling storevariable
	sta localVariable_createOPBlock_op
	; Assigning single variable : localVariable_createOPBlock_Xpos
	; Calling storevariable
	sta localVariable_createOPBlock_Xpos
	; Assigning single variable : localVariable_createOPBlock_Ypos
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_createOPBlock_Ypos
	jsr createOPBlock
	; Assigning single variable : localVariable_createUI_Ypos
	; Optimizer: a = a +/- b
	lda localVariable_createUI_Ypos
	clc
	adc #$a
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_createOPBlock_op
	lda #$2
	; Calling storevariable
	sta localVariable_createOPBlock_op
	; Assigning single variable : localVariable_createOPBlock_Xpos
	lda #$1
	; Calling storevariable
	sta localVariable_createOPBlock_Xpos
	; Assigning single variable : localVariable_createOPBlock_Ypos
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_createOPBlock_Ypos
	jsr createOPBlock
	; Assigning single variable : localVariable_createUI_Ypos
	; Optimizer: a = a +/- b
	lda localVariable_createUI_Ypos
	clc
	adc #$a
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_createOPBlock_op
	lda #$3
	; Calling storevariable
	sta localVariable_createOPBlock_op
	; Assigning single variable : localVariable_createOPBlock_Xpos
	lda #$1
	; Calling storevariable
	sta localVariable_createOPBlock_Xpos
	; Assigning single variable : localVariable_createOPBlock_Ypos
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_createOPBlock_Ypos
	jsr createOPBlock
	; Assigning single variable : localVariable_createUI_color
	lda #$1
	; Calling storevariable
	sta localVariable_createUI_color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$28
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$2c
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$8
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$7
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr859
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr859
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$29
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$30
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$8
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$7
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr861
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr861
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : Conn_Xpos
	lda #$34
	; Calling storevariable
	sta Conn_Xpos
	; Assigning single variable : Conn_Ypos
	lda #$5
	; Calling storevariable
	sta Conn_Ypos
	
; //Conn::Show(7);
	; Assigning single variable : localVariable_createUI_Ypos
	lda #$11
	; Calling storevariable
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda #$2c
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<createUI_stringassignstr863
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>createUI_stringassignstr863
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_cbID
	lda #$28
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posX
	lda #$32
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posX
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posY
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posY
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Width
	lda #$3
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Width
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Height
	lda #$1
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Height
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOn
	lda #$5
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOn
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOff
	lda #$2
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOff
	jsr CheckBox_Create
	; Assigning single variable : localVariable_createUI_Ypos
	; Optimizer: a = a +/- b
	lda localVariable_createUI_Ypos
	clc
	adc #$2
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda #$2c
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<createUI_stringassignstr865
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>createUI_stringassignstr865
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_cbID
	lda #$29
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posX
	lda #$32
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posX
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posY
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posY
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Width
	lda #$3
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Width
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Height
	lda #$1
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Height
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOn
	lda #$5
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOn
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOff
	lda #$2
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOff
	jsr CheckBox_Create
	; Assigning single variable : localVariable_createUI_color
	lda #$f
	; Calling storevariable
	sta localVariable_createUI_color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$2a
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$32
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$19
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$8
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$7
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr867
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr867
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$2b
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$37
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$19
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$8
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr869
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr869
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$2e
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$3c
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$19
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$8
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr871
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr871
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$2c
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$41
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$2f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$ff
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr873
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr873
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	lda #$2d
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_slID
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	lda #$46
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Xpos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	lda #$3
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Ypos
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	lda #$2f
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Length_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	lda #$ff
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Max_
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Color
	; Assigning single variable : localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #<createUI_stringassignstr875
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption
	lda #>createUI_stringassignstr875
	sta localVariable_CommonUI_CreateStdVerticalSlider_CommonUI_Caption+1
	jsr CommonUI_CreateStdVerticalSlider
	; Assigning single variable : localVariable_createUI_Ypos
	lda #$3b
	; Calling storevariable
	sta localVariable_createUI_Ypos
	; Assigning single variable : localVariable_createUI_color
	lda #$7
	; Calling storevariable
	sta localVariable_createUI_color
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda #$16
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<createUI_stringassignstr877
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>createUI_stringassignstr877
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_cbID
	lda #$32
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_cbID
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posX
	lda #$1e
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posX
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_posY
	lda localVariable_createUI_Ypos
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_posY
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Width
	lda #$3
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Width
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_Height
	lda #$1
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_Height
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOn
	lda #$5
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOn
	; Assigning single variable : localVariable_CheckBox_Create_CheckBox_ColorOff
	lda #$2
	; Calling storevariable
	sta localVariable_CheckBox_Create_CheckBox_ColorOff
	jsr CheckBox_Create
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_X
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_X
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_Y
	lda #$3b
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_Y
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_caption
	lda #<createUI_stringassignstr879
	sta localVariable_SCF_TextAtPos_SCF_caption
	lda #>createUI_stringassignstr879
	sta localVariable_SCF_TextAtPos_SCF_caption+1
	; Assigning single variable : localVariable_SCF_TextAtPos_SCF_color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_SCF_TextAtPos_SCF_color
	jsr SCF_TextAtPos
	; Assigning single variable : localVariable_Label_Create_Label_lbID
	lda #$32
	; Calling storevariable
	sta localVariable_Label_Create_Label_lbID
	; Assigning single variable : localVariable_Label_Create_Label_posX
	lda #$a
	; Calling storevariable
	sta localVariable_Label_Create_Label_posX
	; Assigning single variable : localVariable_Label_Create_Label_posY
	lda #$3b
	; Calling storevariable
	sta localVariable_Label_Create_Label_posY
	; Assigning single variable : localVariable_Label_Create_Label_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_Label_Create_Label_Color
	jsr Label_Create
	; Assigning single variable : localVariable_Slider_Create_Slider_slID
	lda #$32
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_slID
	; Assigning single variable : localVariable_Slider_Create_Slider_posX
	lda #$d
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_posX
	; Assigning single variable : localVariable_Slider_Create_Slider_posY
	lda #$3b
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_posY
	; Assigning single variable : localVariable_Slider_Create_Slider_Length_
	lda #$6
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Length_
	; Assigning single variable : localVariable_Slider_Create_Slider_Color
	lda localVariable_createUI_color
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Color
	; Assigning single variable : localVariable_Slider_Create_Slider_Max_
	lda #$6
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Max_
	; Assigning single variable : localVariable_Slider_Create_Slider_Mode
	lda #$1
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_Mode
	; Assigning single variable : localVariable_Slider_Create_Slider_AttachedLabelID
	lda #$32
	; Calling storevariable
	sta localVariable_Slider_Create_Slider_AttachedLabelID
	jsr Slider_Create
	rts
block1
	
; //	Button::Create(0,13,59,1,1,7,45);
; //	Button::Create(1,16,59,1,1,7,43);
; //MAIN START
	jsr YM2151_Reset
	jsr X16Mouse_CursorOn
	; Assigning single variable : localVariable_SCF_InitScreen_SCF_color
	lda #$0
	; Calling storevariable
	sta localVariable_SCF_InitScreen_SCF_color
	jsr SCF_InitScreen
	jsr Widget_ClearMap
	jsr createUI
	
; //Widget::ShowWidgetMap();
; //return();
	; Assigning single variable : localVariable_setL_value
	lda #$1
	; Calling storevariable
	sta localVariable_setL_value
	jsr setL
	; Assigning single variable : localVariable_setR_value
	lda #$1
	; Calling storevariable
	sta localVariable_setR_value
	jsr setR
	; Assigning single variable : localVariable_setFB_value
	lda #$4
	; Calling storevariable
	sta localVariable_setFB_value
	jsr setFB
	; Assigning single variable : localVariable_setCON_value
	lda #$7
	; Calling storevariable
	sta localVariable_setCON_value
	jsr setCON
	; Assigning single variable : localVariable_setMUL_op
	lda #$0
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	lda #$1
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	; Assigning single variable : localVariable_setMUL_op
	lda #$1
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	lda #$2
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	; Assigning single variable : localVariable_setMUL_op
	lda #$2
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	lda #$3
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	; Assigning single variable : localVariable_setMUL_op
	lda #$3
	; Calling storevariable
	sta localVariable_setMUL_op
	; Assigning single variable : localVariable_setMUL_value
	lda #$0
	; Calling storevariable
	sta localVariable_setMUL_value
	jsr setMUL
	; Assigning single variable : localVariable_setTL_op
	lda #$0
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	lda #$14
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	; Assigning single variable : localVariable_setTL_op
	lda #$1
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	lda #$14
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	; Assigning single variable : localVariable_setTL_op
	lda #$2
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	lda #$14
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	; Assigning single variable : localVariable_setTL_op
	lda #$3
	; Calling storevariable
	sta localVariable_setTL_op
	; Assigning single variable : localVariable_setTL_value
	lda #$14
	; Calling storevariable
	sta localVariable_setTL_value
	jsr setTL
	; Assigning single variable : localVariable_setKS_op
	lda #$0
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	; Assigning single variable : localVariable_setKS_op
	lda #$1
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	lda #$0
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	; Assigning single variable : localVariable_setKS_op
	lda #$2
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	lda #$0
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	; Assigning single variable : localVariable_setKS_op
	lda #$3
	; Calling storevariable
	sta localVariable_setKS_op
	; Assigning single variable : localVariable_setKS_value
	lda #$0
	; Calling storevariable
	sta localVariable_setKS_value
	jsr setKS
	; Assigning single variable : localVariable_setAR_op
	lda #$0
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	; Assigning single variable : localVariable_setAR_op
	lda #$1
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	; Assigning single variable : localVariable_setAR_op
	lda #$2
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	; Assigning single variable : localVariable_setAR_op
	lda #$3
	; Calling storevariable
	sta localVariable_setAR_op
	; Assigning single variable : localVariable_setAR_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setAR_value
	jsr setAR
	; Assigning single variable : localVariable_setD1R_op
	lda #$0
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	; Assigning single variable : localVariable_setD1R_op
	lda #$1
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	; Assigning single variable : localVariable_setD1R_op
	lda #$2
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	; Assigning single variable : localVariable_setD1R_op
	lda #$3
	; Calling storevariable
	sta localVariable_setD1R_op
	; Assigning single variable : localVariable_setD1R_value
	lda #$1f
	; Calling storevariable
	sta localVariable_setD1R_value
	jsr setD1R
	; Assigning single variable : localVariable_setDT2_op
	lda #$0
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	; Assigning single variable : localVariable_setDT2_op
	lda #$1
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	lda #$0
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	; Assigning single variable : localVariable_setDT2_op
	lda #$2
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	lda #$0
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	; Assigning single variable : localVariable_setDT2_op
	lda #$3
	; Calling storevariable
	sta localVariable_setDT2_op
	; Assigning single variable : localVariable_setDT2_value
	lda #$0
	; Calling storevariable
	sta localVariable_setDT2_value
	jsr setDT2
	; Assigning single variable : localVariable_setD2R_op
	lda #$0
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	; Assigning single variable : localVariable_setD2R_op
	lda #$1
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	lda #$0
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	; Assigning single variable : localVariable_setD2R_op
	lda #$2
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	lda #$0
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	; Assigning single variable : localVariable_setD2R_op
	lda #$3
	; Calling storevariable
	sta localVariable_setD2R_op
	; Assigning single variable : localVariable_setD2R_value
	lda #$0
	; Calling storevariable
	sta localVariable_setD2R_value
	jsr setD2R
	; Assigning single variable : localVariable_setD1L_op
	lda #$0
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	; Assigning single variable : localVariable_setD1L_op
	lda #$1
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	lda #$0
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	; Assigning single variable : localVariable_setD1L_op
	lda #$2
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	lda #$0
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	; Assigning single variable : localVariable_setD1L_op
	lda #$3
	; Calling storevariable
	sta localVariable_setD1L_op
	; Assigning single variable : localVariable_setD1L_value
	lda #$0
	; Calling storevariable
	sta localVariable_setD1L_value
	jsr setD1L
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$0
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	lda #$1
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$1
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$2
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	lda #$1
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	; Assigning single variable : localVariable_setAMSEN_op
	lda #$3
	; Calling storevariable
	sta localVariable_setAMSEN_op
	; Assigning single variable : localVariable_setAMSEN_value
	lda #$1
	; Calling storevariable
	sta localVariable_setAMSEN_value
	jsr setAMSEN
	; Assigning single variable : localVariable_setRR_op
	lda #$0
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	lda #$5
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	; Assigning single variable : localVariable_setRR_op
	lda #$1
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	lda #$5
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	; Assigning single variable : localVariable_setRR_op
	lda #$2
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	lda #$5
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	; Assigning single variable : localVariable_setRR_op
	lda #$3
	; Calling storevariable
	sta localVariable_setRR_op
	; Assigning single variable : localVariable_setRR_value
	lda #$5
	; Calling storevariable
	sta localVariable_setRR_value
	jsr setRR
	; Assigning single variable : localVariable_setKEYON_op
	lda #$0
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	lda #$1
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	; Assigning single variable : localVariable_setKEYON_op
	lda #$1
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	; Assigning single variable : localVariable_setKEYON_op
	lda #$2
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	lda #$1
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	; Assigning single variable : localVariable_setKEYON_op
	lda #$3
	; Calling storevariable
	sta localVariable_setKEYON_op
	; Assigning single variable : localVariable_setKEYON_value
	lda #$1
	; Calling storevariable
	sta localVariable_setKEYON_value
	jsr setKEYON
	; Assigning single variable : localVariable_setHOLDKEY_value
	lda #$0
	; Calling storevariable
	sta localVariable_setHOLDKEY_value
	jsr setHOLDKEY
	; Assigning single variable : localVariable_setTRANSPOSE_value
	lda #$3
	; Calling storevariable
	sta localVariable_setTRANSPOSE_value
	jsr setTRANSPOSE
	; Assigning single variable : Input_key
	lda #$0
	; Calling storevariable
	sta Input_key
MainProgram_while881
	; Binary clause Simplified: NOTEQUALS
	lda Input_key
	; Compare with pure num / var optimization
	cmp #$3;keep
	beq MainProgram_localfailed950
	jmp MainProgram_ConditionalTrueBlock882
MainProgram_localfailed950
	jmp MainProgram_elsedoneblock884
MainProgram_ConditionalTrueBlock882: ;Main true block ;keep 
	jsr Input_getin
	; Binary clause Simplified: EQUALS
	lda holdkey
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne MainProgram_elsedoneblock955
MainProgram_ConditionalTrueBlock953: ;Main true block ;keep 
	; Binary clause Simplified: EQUALS
	lda Input_key
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne MainProgram_elsedoneblock968
MainProgram_localsuccess970: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: NOTEQUALS
	lda Input_lastkey
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock968
MainProgram_ConditionalTrueBlock966: ;Main true block ;keep 
	; Assigning single variable : localVariable_YM2151_KeyOff_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_KeyOff_YM2151_chn
	jsr YM2151_KeyOff
MainProgram_elsedoneblock968
MainProgram_elsedoneblock955
	; Binary clause Simplified: NOTEQUALS
	lda Input_key
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock975
MainProgram_ConditionalTrueBlock973: ;Main true block ;keep 
	; Binary clause Simplified: EQUALS
	lda Input_key
	; Compare with pure num / var optimization
	cmp #$d;keep
	bne MainProgram_elsedoneblock1000
MainProgram_ConditionalTrueBlock998: ;Main true block ;keep 
	jsr dumpRegs
MainProgram_elsedoneblock1000
	; Binary clause Simplified: EQUALS
	lda holdkey
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne MainProgram_elsedoneblock1006
MainProgram_localsuccess1008: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	lda Input_key
	; Compare with pure num / var optimization
	cmp #$20;keep
	bne MainProgram_elsedoneblock1006
MainProgram_ConditionalTrueBlock1004: ;Main true block ;keep 
	; Assigning single variable : localVariable_YM2151_KeyOff_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_KeyOff_YM2151_chn
	jsr YM2151_KeyOff
MainProgram_elsedoneblock1006
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
	jsr Input_key2note
	; Binary clause Simplified: NOTEQUALS
	lda Input_note
	; Compare with pure num / var optimization
	cmp #$ff;keep
	beq MainProgram_elsedoneblock1013
MainProgram_ConditionalTrueBlock1011: ;Main true block ;keep 
	; Assigning single variable : localVariable_YM2151_SetNote_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_SetNote_YM2151_chn
	; Assigning single variable : localVariable_YM2151_SetNote_YM2151_octave
	; 8 bit binop
	; Add/sub where right value is constant number
	lda Input_octave
	clc
	adc transpose
	 ; end add / sub var with constant
	; Calling storevariable
	sta localVariable_YM2151_SetNote_YM2151_octave
	; Assigning single variable : localVariable_YM2151_SetNote_YM2151_note
	lda Input_note
	; Calling storevariable
	sta localVariable_YM2151_SetNote_YM2151_note
	jsr YM2151_SetNote
	
; //Transpose
	; Assigning single variable : localVariable_YM2151_KeyOn_YM2151_chn
	lda currentchanel
	; Calling storevariable
	sta localVariable_YM2151_KeyOn_YM2151_chn
	jsr YM2151_KeyOn
MainProgram_elsedoneblock1013
MainProgram_elsedoneblock975
	; Assigning single variable : Input_lastkey
	lda Input_key
	; Calling storevariable
	sta Input_lastkey
	jsr handlemouse
	jmp MainProgram_while881
MainProgram_elsedoneblock884
	jsr X16Mouse_CursorOff
	jsr YM2151_Reset
	rts
EndSymbol
	; End of program
	; Ending memory block
EndBlock309
YM2151_SetAtKeyOnOperatorEnabled_stringassignstr130	.dc "OM",0
createOPBlock_stringassignstr825	.dc "AR",0
createOPBlock_stringassignstr828	.dc "D1R",0
createOPBlock_stringassignstr831	.dc "D2R",0
createOPBlock_stringassignstr834	.dc "D1L",0
createOPBlock_stringassignstr837	.dc "RR",0
createOPBlock_stringassignstr840	.dc "TL",0
createOPBlock_stringassignstr842	.dc "MUL",0
createOPBlock_stringassignstr845	.dc "DT1",0
createOPBlock_stringassignstr848	.dc "DT2",0
createOPBlock_stringassignstr851	.dc "KS",0
createOPBlock_stringassignstr854	.dc "AMSEN",0
createUI_stringassignstr857	.dc "YM2151 SYNTH UI    V0.2",0
createUI_stringassignstr859	.dc "FB",0
createUI_stringassignstr861	.dc "CON",0
createUI_stringassignstr863	.dc "LEFT",0
createUI_stringassignstr865	.dc "RIGHT",0
createUI_stringassignstr867	.dc "PMS",0
createUI_stringassignstr869	.dc "AMS",0
createUI_stringassignstr871	.dc "W",0
createUI_stringassignstr873	.dc "LFRQ",0
createUI_stringassignstr875	.dc "PMDAMD",0
createUI_stringassignstr877	.dc "HOLDKEY",0
createUI_stringassignstr879	.dc "TRANSPOSE",0
