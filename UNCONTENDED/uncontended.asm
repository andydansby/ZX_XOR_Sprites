;; UNCONTENDED

;SECTION UNCONTENDED

;;uncontended memory from 32768 to 49151
;; 16383 bytes total

;;__fastcall__ fastcall
;; Fastcall linkage allows one parameter
;; to be passed by register in a subset of DEHL.
;; So if the parameter is 8-bit, the value will
;; be in L.  If the parameter is 16-bit,
;; the value is in HL and if it is
;; 32-bit the value is in DEHL.

SECTION code_user
; assign read-only executable code to this section
;----------------------------------
;attention new, we moved
PUBLIC _border_Change_IM2
_border_Change_IM2:
    ld hl, (_ada)   ; loads L of HL with the variable ada
    ld a, l         ;
    and 7           ; mask with 0000 0111
    out ($FE),a
    inc a           ;; increment value
    ld (_ada), a    ; and update variable _ada
ret


PUBLIC _border_Change_uncontended
_border_Change_uncontended:
    ld a, l     ;contents of l are loaded into a
    out (254), a
ret

;;attention, need to move

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _character_address
_character_address: defw $0000

PUBLIC _attribute_color
_attribute_color:   defb %00000000
                       ; %FBPPPIII
;constants
defc screenAddress = $4000
defc screenSize = 6144
defc attributeSize = 767
;defc attribute_address = $5800

;variables
PUBLIC _attribute_address
_attribute_address:
    defw $5800; $5800

;note keep these two together with width on top
PUBLIC _attribute_width
_attribute_width:   defb $00
PUBLIC _attribute_height
_attribute_height:  defb $00

PUBLIC _pixel_address
_pixel_address:     defw $0000
PUBLIC _pixel_position
_pixel_position:     defb $00

PUBLIC _character_X
_character_X: defb $00
PUBLIC _character_Y
_character_Y: defb $00

;Slavo Labsky routine
PUBLIC _attribute_Box
_attribute_Box:

	ld ixh, $C
	ld H, $9    ; Put Y Coord in h   0-22
    ld L, $3    ; Put X Coord in l (always 7)
	ld C, $C    ;height
	ld a,%00100001

	;my original
	;h = Y coord $3
	;l = X coord $9
	;b = width $8
	;c = height $C
	;a = attribute  %00100001

;; Input values:
;; A = attribute value
;; H = position column X
;; L = position row    Y
;; C = horizontal size
;; XH = vertical size
	ex af,af
	ld a,h
	ld h, $02
	add hl,hl
	inc h
	add hl,hl
	inc h
	add hl,hl
	add hl,hl
	add hl,hl
	or l
	ld l,a
	ld a, $20
	sub c
	ld e,a
	ld d, $00
	ex af,af
loop22:
	ld b,c
loop11:
	ld (hl),a
	inc hl
	djnz loop11
	add hl,de
	dec ixh
	jr nz,loop22
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;https://chuntey.wordpress.com/tag/screen/
;calculates the attribute address
;given a character position x,y
;output
;_character_address in hl
;_attribute_color in a
PUBLIC _Get_Attribute_Address
_Get_Attribute_Address:

    ld bc, (_character_address)

    ld a, b              ; x position.
    rrca                ; multiply by 32.
    rrca
    rrca
    ld l, a              ; store away in l.
    and 3               ; mask bits for high byte.
    add a,88            ; 88*256=22528, start of attributes.
    ld h, a              ; high byte done.
    ld a, l              ; get x*32 again.
    and 224             ; mask low byte.
    ld l, a              ; put in l.
    ld a, c              ; get y displacement.
    add a, l             ; add to low byte.
    ld l, a              ; hl=address of attributes.
    ld a,(hl)           ; return attribute in a.

    ld (_character_address), hl
    ld (_attribute_color), a
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









SECTION rodata_user
; assign read-only data to this section
;; Variables
;; define C variables here to force placement in memory
PUBLIC _xyzzy2
_xyzzy2:
    defb 254
;----------------------------------

SECTION smc_user
; assign self-modifying code to this section
;----------------------------------

SECTION data_user
; assign non-zero initial data to this section
;----------------------------------

SECTION bss_user
; assign zero initial data to this section
;----------------------------------
;;attention new moved
PUBLIC _ada
_ada:
defb 0



