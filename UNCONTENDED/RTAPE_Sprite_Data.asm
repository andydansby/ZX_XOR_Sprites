;;;;;;;;;;;;;;;;;;;;;;
SECTION code_user
;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _sprite_table_addresses
_sprite_table_addresses:
	defw	_spritegraphic0
	defw	_spritegraphic1
	defw	_spritegraphic2
	defw	_spritegraphic3
	defw	_spritegraphic4
	defw	_spritegraphic5
	defw	_spritegraphic6
	defw	_spritegraphic7
	;

PUBLIC _spritegraphic0
_spritegraphic0:
    ;8 preshifted graphics, each one 3 bytes wide and 16 pixels high, this one a simple square
	defb 0, 0, 0		;frame 0
	defb 7, 224, 0
	defb 31, 248, 0
	defb 127, 254, 0
	defb 127, 214, 0
	defb 255, 215, 0
	defb 255, 255, 0
	defb 255, 255, 0
	defb 255, 187, 0
	defb 127, 198, 0
	defb 127, 254, 0
	defb 31, 248, 0
	defb 7, 224, 0
	defb 0, 0, 0
	defb 7, 96, 0
	defb 15, 176, 0

PUBLIC _spritegraphic1
_spritegraphic1:
	defb 0, 0, 0		;frame 1
	defb 3, 240, 0
	defb 15, 252, 0
	defb 63, 255, 0
	defb 63, 235, 0
	defb 127, 235, 128
	defb 127, 255, 128
	defb 127, 255, 128
	defb 127, 221, 128
	defb 63, 227, 0
	defb 63, 255, 0
	defb 15, 252, 0
	defb 3, 240, 0
	defb 0, 0, 0
	defb 3, 176, 0
	defb 7, 216, 0

PUBLIC _spritegraphic2
_spritegraphic2:
	defb 0, 0, 0		;frame 2
	defb 1, 248, 0
	defb 7, 254, 0
	defb 31, 255, 128
	defb 31, 245, 128
	defb 63, 245, 192
	defb 63, 255, 192
	defb 63, 255, 192
	defb 63, 238, 192
	defb 31, 241, 128
	defb 31, 255, 128
	defb 7, 254, 0
	defb 1, 248, 0
	defb 0, 0, 0
	defb 7, 158, 0
	defb 3, 204, 0

PUBLIC _spritegraphic3
_spritegraphic3:
	defb 0, 0, 0		;frame 3
	defb 0, 252, 0
	defb 3, 255, 0
	defb 15, 255, 192
	defb 15, 250, 192
	defb 31, 250, 224
	defb 31, 255, 224
	defb 31, 255, 224
	defb 31, 247, 96
	defb 15, 248, 192
	defb 15, 255, 192
	defb 3, 255, 0
	defb 0, 252, 0
	defb 0, 0, 0
	defb 3, 207, 0
	defb 1, 230, 0

PUBLIC _spritegraphic4
_spritegraphic4:
	defb 0, 126, 0		;frame 4
	defb 1, 255, 128
	defb 7, 255, 224
	defb 7, 253, 96
	defb 15, 253, 112
	defb 15, 255, 240
	defb 15, 255, 240
	defb 15, 251, 176
	defb 7, 252, 96
	defb 7, 255, 224
	defb 1, 255, 128
	defb 0, 126, 0
	defb 1, 128, 192
	defb 1, 195, 192
	defb 0, 225, 128
	defb 0, 0, 0

PUBLIC _spritegraphic5
_spritegraphic5:
	defb 0, 63, 0		;frame 5
	defb 0, 255, 192
	defb 3, 255, 240
	defb 3, 254, 176
	defb 7, 254, 184
	defb 7, 255, 248
	defb 7, 255, 248
	defb 7, 253, 216
	defb 3, 254, 48
	defb 3, 255, 240
	defb 0, 255, 192
	defb 0, 63, 0
	defb 0, 192, 96
	defb 0, 225, 224
	defb 0, 112, 192
	defb 0, 0, 0

PUBLIC _spritegraphic6
_spritegraphic6:
	defb 0, 0, 0		;frame 6
	defb 0, 31, 128
	defb 0, 127, 224
	defb 1, 255, 248
	defb 1, 255, 88
	defb 3, 255, 92
	defb 3, 255, 252
	defb 3, 255, 252
	defb 3, 254, 236
	defb 1, 255, 24
	defb 1, 255, 248
	defb 0, 127, 224
	defb 0, 31, 128
	defb 0, 0, 0
	defb 0, 14, 128
	defb 0, 31, 64

PUBLIC _spritegraphic7
_spritegraphic7:
	defb 0, 0, 0		;frame 7
	defb 0, 15, 192
	defb 0, 63, 240
	defb 0, 255, 252
	defb 0, 255, 172
	defb 1, 255, 174
	defb 1, 255, 254
	defb 1, 255, 254
	defb 1, 255, 118
	defb 0, 255, 140
	defb 0, 255, 252
	defb 0, 63, 240
	defb 0, 15, 192
	defb 0, 0, 0
	defb 0, 7, 64
	defb 0, 15, 160
