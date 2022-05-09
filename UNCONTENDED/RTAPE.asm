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

PUBLIC _x_coordinate
_x_coordinate:
    defb $00

PUBLIC _y_coordinate
_y_coordinate:
	defb $00

_save_A_reg:      defb 0

PUBLIC _Collision_detected_TF
_Collision_detected_TF:
	defb $00

PUBLIC _wait_for_scanline
_wait_for_scanline:
    halt
ret





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




