; PRNG Pseudo Random Number Generator
;
SECTION code_user


PUBLIC _random_number_16
_random_number_16:
defw 12345

;;https://gist.github.com/raxoft/c074743ea3f926db0037
public _xorshift_prng
_xorshift_prng:
;seed    equ 23296
    random:
    ld hl, $A280       ; xz -> yw
    ld de, $C0DE       ; yw -> zt
    ld (random+1),de   ; x = y, z = w
    ld a,e             ; w = w ^ ( w << 3 )
    add a,a
    add a,a
    add a,a
    xor e
    ld  e,a
    ld  a,h             ; t = x ^ (x << 1)
    add a,a
    xor h
    ld  d,a
    rra                 ; t = t ^ (t >> 1) ^ w
    xor d
    xor e
    ld h,l             ; y = z
    ld l,a             ; w = t
    ld (random+4),hl
    ld (_random_number_16), hl
ret


