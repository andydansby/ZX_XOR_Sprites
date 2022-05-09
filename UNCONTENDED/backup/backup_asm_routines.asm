


PUBLIC _Main_program
_Main_program:

    halt
    call _deletesprite	;we need to delete the old position of the sprite
    call _movesprite		;move the sprite! Could be based on player key input or baddy AI
    call _drawsprite		;get correct preshifted graphic, and draw it on the screen
jr _Main_program			;loop!


;this can be replaced with a function in Z88dk
PUBLIC _movesprite
_movesprite:
	;very simple routine that just increases the x coordinate
	ld a,(_x_coordinate)
	inc a
	ld (_x_coordinate), a
	cp 232			;check if the sprite has moved all the way to the right (256-24)
	ret c			;return if not
	ld a,0			;if yes then back to left
	ld (_x_coordinate),a
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



PUBLIC _deletesprite
_deletesprite:
	;we need to delete the old sprite
	;before we draw the new one.
	;The sprite is 3 bytes wide & 16 pixels high

	;make C=xcor and B=ycor
	ld a,(_x_coordinate)
	ld c,a
	ld a,(_y_coordinate)
	ld b,a

	;point DE at the corresponding screen address
	call _yx2pix

	ld b,16			;sprite is 16 lines high

deleteloop:
	ld a,0			;empty A to delete
	ld (de),a		;repeat a total of 3 times
	inc e			;next column along
	ld (de),a
	inc e
	ld (de),a
	dec e
	dec e			;move DE back to start of line
	call _nextlinedown	;move DE down one line
	djnz deleteloop		;repeat 16 times

	;attention, just to check the speed
	;ld a, 2; border red
    ;out (254),a
ret