#ifndef VARIABLES_H
#define VARIABLES_H

struct SpriteStruct
{
	unsigned char x;        //x position of sprite
	unsigned char y;        //y position of sprite
	unsigned int logic;     //address of routine for logic
	unsigned char image;    // sprite image
	unsigned char flag;
	unsigned char data1;
	unsigned char data2;
	unsigned char data3;
	unsigned char data4;
	unsigned char data5;
} SpriteStruct[5];// 16 maximum sprites


//UNCONTENDED RAM
unsigned char tom = 2;//
unsigned char dick = 3;//
unsigned char harry = 0;//
unsigned int eve = 11;//
unsigned int bob = 5;//
unsigned char ava = 0;


unsigned int temp1;
unsigned int temp2;
unsigned int temp3;
unsigned int temp4;

unsigned char direction = 1;
unsigned char temp;




#endif
