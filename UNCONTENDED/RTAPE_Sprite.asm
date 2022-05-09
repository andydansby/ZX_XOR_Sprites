;;;;;;;;;;;;;;;;;;;;;;
SECTION code_user
;;;;;;;;;;;;;;;;;;;;;;
;takes 6408 T cycles to draw 1 complete sprite
;;;;;;;;;;;;;;;;;;;;;;
;externs
;;;;;;;;;;;;;;;;;;;;;;
extern _RTUNES_yx2pix
extern _yx2pix
extern _nextlinedown
extern _getsprite


;;;;;;;;;;;;;;;;;;;;;;
;variables
;;;;;;;;;;;;;;;;;;;;;;
PUBLIC _x_coordinate
_x_coordinate:
    defb $00

PUBLIC _y_coordinate
_y_coordinate:
	defb $00

PUBLIC _Collision_detected_TF
_Collision_detected_TF:
	defb $00


;;;;;;;;;;;;;;;;;;;;;;
;60 bytes / 311 - 316 t-states
PUBLIC _drawsprite
_drawsprite:
    ld a, (_x_coordinate)  ;make C=xcor and B=ycor
    ld c, a
    ld a, (_y_coordinate)
    ld b, a
    ;call _yx2pix  ;point DE at corresponding screen position
    call _RTUNES_yx2pix

    ld a, (_x_coordinate)
;but we still need to find
;which preshifted sprite to draw

    and 00000111b  ;we have 8 preshifted graphics to choose from, cycled 0-7 in the right hand 3 bits of the x coordinate
    call _getsprite  ;point HL at the correct graphic
    ld b, 16  ;sprite is 16 lines high

;    ld (_save_A_reg), a

;by default, no collision
    ld a, 0
    ld (_Collision_detected_TF), a


drawloop:

    ld a, (de)  ; load byte from screen

    call _collision

    xor (hl)  ; merge with Sprite
    ld (de), a  ;and put it on the screen
    inc hl  ;next byte of graphic
    inc e  ;next column on screen
;;;;;;;;;;;
    ld a, (de)

    call _collision

    xor (hl)
    ld (de), a
    inc hl
    inc e
;;;;;;;;;;;
    ld a, (de)

    call _collision

    xor (hl)
    ld (de), a
    inc hl
    dec e
    dec e  ;move DE back to left hand side of sprite
    call _nextlinedown
    djnz drawloop  ;repeat for all 16 lines
ret

;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _collision
_collision:
    ;entering with A having the current screen byte
    push BC     ; save the BC register
    ld b, a     ; save screen byte

checkBit:
    AND (hl)    ; AND the two bits together
    ;if 0, nothing touched
    ;if != 0, something touched
    jr nz, Collision_detected

finishCollision:
    ld a, b     ;restore the altered A register
    pop BC
ret
;;;;;;;;;;;;;;;;;;;;;;
Collision_detected:
    ld a, 1
    ld (_Collision_detected_TF), a
    jp finishCollision

;;;;;;;;;;;;;;;;;;;;;;
