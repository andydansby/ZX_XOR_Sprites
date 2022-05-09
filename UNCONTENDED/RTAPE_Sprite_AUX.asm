;;;;;;;;;;;;;;;;;;;;;;
SECTION code_user
;;;;;;;;;;;;;;;;;;;;;;
;takes 6408 T cycles to draw 1 complete sprite
;;;;;;;;;;;;;;;;;;;;;;
;externs

;in RTAPE_Sprite_Data
extern _sprite_table_addresses
extern _spritegraphic0
extern _spritegraphic1
extern _spritegraphic2
extern _spritegraphic3
extern _spritegraphic4
extern _spritegraphic5
extern _spritegraphic6
extern _spritegraphic7

;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _wait_for_scanline
_wait_for_scanline:
    halt
ret

;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;
;15 bytes / 65 - 77 t-states
PUBLIC _nextlinedown
_nextlinedown:  ;don't worry about how this works yet!
    inc d       ;just arrive with DE in the display file
    ld a, d     ;and it gets moved down one line
    and 7
    ret nz
    ld a, e
    add a, 32
    ld e, a
    ret c
    ld a, d
    sub 8
    ld d, a
ret

;input 	bc = $2f80 = $2f = 47	$80 = 128
;output	de = $47B0 = 18352
;;;;;;;;;;;;;;;;;;;;;;
;25 bytes / 101 t-states
PUBLIC _yx2pix
_yx2pix:
;don't worry about how this works yet!
;just arrive with arrive with B=y 0-192, C=x 0-255
    ld a, b
;return with DE at corresponding place on the screen
    rra
    rra
    rra
    and 24
    or 64
    ld d, a
    ld a, b
    and 7
    or d
    ld d, a
    ld a, b
    rla
    rla
    and 224
    ld e, a
    ld a, c
    rra
    rra
    rra
    and 31
    or e
    ld e, a
ret

;;;;;;;;;;;;;;;;;;;;;;
PUBLIC _RTUNES_yx2pix
_RTUNES_yx2pix:
;;faster by 8 cycles
    ld a, b  ;4 T
    and a  ;4 T
    rra  ;4 T
    scf  ;4 T
    rra  ;4 T
    and a  ;4 T
    rra  ;4 T
    xor b  ;4 T
    and 11111000b  ;7 T

    xor b  ;4 T
    ld d, a  ;4 T
    ld a, c  ;4 T
    rlca  ;4 T
    rlca  ;4 T
    rlca  ;4 T
    xor b  ;4 T
    and 11000111b  ;7 T
    xor b  ;4 T
    rlca  ;4 T
    rlca  ;4 T
    ld e, a  ;4 T
ret
;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;24 bytes / 153 t-states
PUBLIC _getsprite
_getsprite:
;don't worry much about how this works!
;for an alternative method that
;uses a table see 'getsprite_alternativemethod'
;Arrive A holding which pixel within a byte (0-7),
;point HL at correct graphic
    ld h, 0  ;we need to multiply A by 48, do it in HL
    ld l, a
    add hl, hl  ;x2
    add hl, hl  ;x4
    add hl, hl  ;x8
    add hl, hl  ;x16
    ld b, h
    ld c, l  ;BC = x 16
    add hl, hl  ;x32
    add hl, bc  ;x48
    ld bc, _spritegraphic0
    add hl, bc  ;HL now pointing at correct sprite frame
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


getsprite_alternativemethod:
	;arrive A holding which sprite position 0 - 7
	;this method uses a table to find the correct graphic

	add a,a		;multiplay a by 2, this converts a single byte number 0-7 into a 2 byte table entry
	ld h,0
	ld l,a
	ld bc, _sprite_table_addresses
	add hl,bc	;HL is now pointing at the correct table entry
	ld c,(hl)
	inc hl
	ld b,(hl)	;get table address spritegraphic0, spritegraphic1 etc in BC
	ld l,c
	ld h,b		;now HL is pointing at the correct sprite graphic
ret
	;









