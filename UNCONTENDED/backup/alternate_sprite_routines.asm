;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _drawsprite
_drawsprite:
	ld a,(_x_coordinate)		;make C=xcor and B=ycor
	ld c,a
	ld a,(_y_coordinate)
	ld b,a
	call _yx2pix		;point DE at corresponding screen position
	ld a,(_x_coordinate)
	;but we still need to find
	;which preshifted sprite to draw

	and 00000111b   ;we have 8 preshifted graphics to choose from, cycled 0-7 in the right hand 3 bits of the x coordinate
	call _getsprite  ;point HL at the correct graphic
	ld b,16			;sprite is 16 lines high

drawloop:
	ld a,(hl)		;take a byte of graphic
	ld (de),a		;and put it on the screen
	inc hl			;next byte of graphic
	inc e			;next column on screen
	ld a,(hl)		;repeat for 3 bytes across
	ld (de),a
	inc hl
	inc e
	ld a,(hl)
	ld (de),a
	inc hl
	dec e
	dec e			;move DE back to left hand side of sprite
	call _nextlinedown
	djnz drawloop		;repeat for all 16 lines

	;attention, just to check the speed
	ld a, 1;border blue
    out (254),a
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



drawloop:
	;ld a,(hl)		;take a byte of graphic
	ld a, (de)
	xor (hl)
	ld (de),a		;and put it on the screen
	inc hl			;next byte of graphic
	inc e			;next column on screen
	;;;;;;;;;;;
	;ld a,(hl)		;repeat for 3 bytes across
	ld a, (de)
	xor (hl)
	ld (de),a
	inc hl
	inc e
	;;;;;;;;;;;
	;ld a,(hl)
	ld a, (de)
	xor (hl)
	ld (de),a
	inc hl
	dec e
	dec e			;move DE back to left hand side of sprite
	call _nextlinedown
	djnz drawloop		;repeat for all 16 lines

	;attention, just to check the speed
	ld a, 1;border blue
    out (254),a
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;