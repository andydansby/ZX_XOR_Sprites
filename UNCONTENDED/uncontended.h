#ifndef UNCONTENDED_H
#define UNCONTENDED_H

//UNCONTENDED RAM

unsigned char multiply2numbers (unsigned char A, unsigned char B)
{
	return A * B;
}

void checkBoundries (void)
{
    if (y_coordinate > 176)
    {
        y_coordinate = 176;
    }
    if (y_coordinate < 2)
    {
        y_coordinate = 2;
    }
    if (x_coordinate > 238)
    {
        x_coordinate = 238;
    }
    if (x_coordinate < 2)
    {
        x_coordinate = 2;
    }
}

void clearSpriteStruct (void)
{
    for (temp1 = 0; temp1 < 5; temp1++)
    {
        SpriteStruct[temp1].x       = 0;
        SpriteStruct[temp1].y       = 0;
        SpriteStruct[temp1].logic   = 0;
        SpriteStruct[temp1].image   = 0;
        SpriteStruct[temp1].flag    = 0;
        SpriteStruct[temp1].data1   = 0;
        SpriteStruct[temp1].data2   = 0;
        SpriteStruct[temp1].data3   = 0;
        SpriteStruct[temp1].data4   = 0;
        SpriteStruct[temp1].data5   = 0;
    }
}

void initSpriteStruct (void)
{
    temp3 = 8;
    //set the first time variables
    for (temp1 = 0; temp1 < 5; temp1++)
    {
        xorshift_prng ();
        random_number_16 = random_number_16 % (176 + 1 - 0) + 0;

        //SpriteStruct[temp1].image   = *Sprite_Bubble;

        SpriteStruct[temp1].x       = temp2;
        SpriteStruct[temp1].y       = temp3;
        SpriteStruct[temp1].logic   = 0;

        SpriteStruct[temp1].flag    = 0;
        SpriteStruct[temp1].data1   = 0;
        SpriteStruct[temp1].data2   = 0;
        SpriteStruct[temp1].data3   = 0;
        SpriteStruct[temp1].data4   = 0;
        SpriteStruct[temp1].data5   = 0;

        temp3 = temp3 + 16;
    }
    intrinsic_label(initSpriteStruct_end);
}



#endif
