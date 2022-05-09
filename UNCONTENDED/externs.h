#ifndef EXTERNS_H
#define EXTERNS_H
//UNCONTENDED RAM


//VARIABLES
extern unsigned char Variable_in_contended;//found in ramlow.asm
extern unsigned char Variable_in_Bank0;//found in ram0Z.asm
extern unsigned char ada;//found in IM2.asm  new

//FUNCTIONS
/*
__fastcall__
 Fastcall linkage allows one parameter
 to be passed by register in a subset of DEHL.
 So if the parameter is 8-bit, the value will
 be in L.  If the parameter is 16-bit,
 the value is in HL and if it is
 32-bit the value is in DEHL.
*/


/*SDCC allows to specify preserved registers in
function declarations, to enable further
optimizations on calls to functions implemented
in assembler. Example for the Z80 architecture
specifying that a function will preserve
register pairs bc and iy:*/

//void f(void) __preserves_regs(b, c, iyl, iyh);
//void f (unsigned int) __z88dk_fastcall;

//https://github.com/z88dk/z88dk/wiki/CallingConventions
//https://github.com/z88dk/z88dk/blob/master/doc/overview.md
//found in ramlow > routines.h
//extern unsigned char add_two_numbers (unsigned char a, unsigned char b);

//found in ram0.h
//extern unsigned char subtract2numbers (unsigned char A, unsigned char B);

//found in uncontended_section.asm
extern void border_Change_uncontended(unsigned char color) __z88dk_fastcall;

//found in im2.asm
extern void SETUP_IM2(void) __z88dk_fastcall;

//found in RAM0Z.asm
extern void border_Change_RAM0(unsigned char color) __z88dk_fastcall;



//found in random.asm
extern unsigned int random_number_16;
extern void xorshift_prng (void) __z88dk_fastcall;






//asm CONSTANTS
//in graphics.asm
extern unsigned int screenAddress;
extern unsigned int screenSize;
extern unsigned int attributeSize;
extern unsigned int attribute_address;


//ASM KEYBOARD Variables
//in keyboard.asm
extern unsigned char keypress;


//found in GRAPHICS.asm
extern unsigned char attribute_width;
extern unsigned char attribute_height;

extern unsigned int attribute_address;

//found in GRAPHICS.asm
extern unsigned char character_X;
extern unsigned char character_Y;
extern unsigned int character_address;
extern unsigned int pixel_address;
extern unsigned char pixel_position;


//ASM KEYBOARD routines
extern unsigned char Read_Controls (void) __z88dk_fastcall;
extern unsigned char Read_Keyboard (void);

//found in GRAPHICS.asm
//extern void Clear_Screen (unsigned char color) __z88dk_fastcall;
//extern void Fill_Attr () __z88dk_callee;
//extern unsigned int Get_Char_Address  (unsigned int address) __z88dk_fastcall;
//extern unsigned int Char_Address_Down (unsigned int address) __z88dk_fastcall;
//extern unsigned int Get_Pixel_Address (unsigned long pixel_address) __z88dk_fastcall;
//extern unsigned int Pixel_Address_Down (unsigned int address) __z88dk_fastcall;
//extern unsigned int Pixel_Address_Up (unsigned int address) __z88dk_fastcall;
//extern unsigned int Get_Attribute_Address  (unsigned int address) __z88dk_fastcall;


//found in uncontended.asm
extern void attribute_Box (void) __z88dk_fastcall;
extern unsigned int character_address;
extern unsigned char attribute_color;





//found in RTAPE.asm
extern unsigned char x_coordinate;
extern unsigned char y_coordinate;
extern unsigned char Collision_detected_TF;

extern void Main_program (void) __z88dk_fastcall;
extern void wait_for_scanline (void) __z88dk_fastcall;

extern void Black_border (void) __z88dk_fastcall;
extern void Red_Border (void) __z88dk_fastcall;

extern void deletesprite (void) __z88dk_fastcall;
extern void movesprite (void) __z88dk_fastcall;
extern void drawsprite (void) __z88dk_fastcall;







#endif
