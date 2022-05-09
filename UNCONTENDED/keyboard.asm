;
; Title:	ZX Spectrum Keyboard Routines
; Author:	Dean Belfield
; Created:	29/07/2011
; Last Updated:	29/07/2011
;
; Requires:
;
; Modinfo:
;
SECTION code_user

PUBLIC _keypress
_keypress:
defw $0000

; Read the in-game controls
; HL: The control map
; Returns:
;  A: Input flags - 000UDLRF (Up, Down, Left, Right, Fire)
; Zero flag set if no key pressed
PUBLIC _Read_Controls
_Read_Controls:
    ld hl, _Input_Custom
	LD D, 5				        ; Number of controls to check
	LD E, 0				        ; The output flags
	LD C,0xFE			        ; Low is always 0xFE for reading keyboard

_Read_Controls1:
	LD B,(HL)			        ; Get the keyboard port address
	INC HL
	IN A,(C)			        ; Read the rows in
	AND (HL)			        ; And with the mask
	JR NZ, _Read_Controls2		; Skip if not pressed (bit is 0)

	SCF				            ; Set C flag

_Read_Controls2:
	RL E				        ; Rotate the carry flag into E
	INC HL
	DEC D
	JR NZ, _Read_Controls1		; Loop
	LD A,E				        ; Fetch the key flags
	ld (_keypress), de
	AND A				        ; Check for 0
RET



_Input_Custom:
   ;kybd matrix     mask
    defb 0x7F,      %00000001   ; Space (Fire)  16
    defb 0xFD,      %00000001   ; A (Down)      04
	defb 0xFB,      %00000001   ; Q (Up)        08
	defb 0xDF,      %00000001   ; P (Right)     02
	defb 0xDF,      %00000010   ; O (Left)      01



_Keyboard_Map:
	defb 0xFE,"#","Z","X","C","V"
	defb 0xFD,"A","S","D","F","G"
	defb 0xFB,"Q","W","E","R","T"
	defb 0xF7,"1","2","3","4","5"
	defb 0xEF,"0","9","8","7","6"
	defb 0xDF,"P","O","I","U","Y"
	defb 0xBF,"#","L","K","J","H"
	defb 0x7F," ","#","M","N","B"
