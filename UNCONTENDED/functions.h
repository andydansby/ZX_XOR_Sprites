
#ifndef FUNCTIONS_H
#define FUNCTIONS_H

//UNCONTENDED RAM

void call_Fill_Attr (unsigned char startX, unsigned char startY, unsigned char endX, unsigned char endY, unsigned char paper, unsigned char ink)
{
    //temp to get the compiler to stop complaining
    temp3 = endX;
    temp3 = endY;
    temp3 = paper;
    temp3 = ink;

    temp1 = startY << 8;
    temp2 = startX;
    character_address = (temp1 | temp2);
    attribute_color = 0b00110001;
    attribute_Box();
}


void use_random_number_generator (int maxNumber, int minNumber)
{
    xorshift_prng ();
    random_number_16 = random_number_16 % (maxNumber + 1 - minNumber) + minNumber;
    //printf ("random number = %d\n", random_number_16);
    //return random_number_16;
}



#endif

