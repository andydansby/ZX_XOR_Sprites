// using sdcc_iy 1.99c
//moving over to sdcc


//Using advise from Stefan
//moved Stack pointer from $BFFF to $C000 as
//Stack automatically decrements before useage
// see zpragma.inc in Uncontended

#include <arch/zx.h>
#include <stdio.h>//standard input output
#include <input.h>//used for detecting key inputs
#include <intrinsic.h>//temp to place labels
//powerful troubleshooting tool
        //intrinsic_label(border_start);
        //intrinsic_label(border_end);

#include "externs.h"    //references to asm functions
#include "variables.h"

#include "uncontended.h"
#include "functions.h"

void main ()
{
    //new
    SETUP_IM2();// set up for the interrupt MODE 2
    // this will point the I register to IM2 Vector

	printf ("Hello World\n");


    xorshift_prng ();//generate a Pseudo Random number
    random_number_16 = random_number_16 % (255 + 1 - 0) + 0;
    printf("\x16\x01\x02");
    printf ("random number =  %d \n", random_number_16);

    printf ("01234567890123456789012345678901\n\n\n");

    printf ("     _____\n");
    printf ("     |   |\n");
    printf ("     |   |\n");


    x_coordinate = 128;

    //72 below the line
    //40 on line
    //46 at top of head
    //47 just below head
    y_coordinate = 47;

    intrinsic_label(drawsprite_start);
    drawsprite ();
    intrinsic_label(drawsprite_end);

    direction = 1;

    for (temp1 = 0; temp1 < 1000; temp1++)
    {
        wait_for_scanline();

        drawsprite ();

        if (direction == 1)
        {
            x_coordinate ++;
        }
        if (direction == 2)
        {
            x_coordinate --;
        }
        if (x_coordinate > 238)
        {
            direction = 2;
        }
        if (x_coordinate < 2)
        {
            direction = 1;
        }
        /*if (Collision_detected_TF == 0)
        {
            border_Change_uncontended(0);
        }
        if (Collision_detected_TF == 1)
        {
            border_Change_uncontended(2);
        }*/

        drawsprite ();

    }

    while(1)
    {
        Read_Controls();

        wait_for_scanline();

        switch (keypress)//only for controls
        {
            case 1:
            {//left
                drawsprite ();
                checkBoundries ();
                x_coordinate --;
                drawsprite ();
                break;
            }
            case 2:
            {//right
                drawsprite ();
                checkBoundries ();
                x_coordinate ++;
                drawsprite ();
                break;
            }
            case 4:
            {//up
                drawsprite ();
                y_coordinate --;
                checkBoundries ();
                drawsprite ();
                break;
            }
            case 8:
            {//down
                drawsprite ();
                y_coordinate ++;
                checkBoundries ();
                drawsprite ();
                break;
            }
            case 5:
            {//left + up
                drawsprite ();
                y_coordinate --;
                x_coordinate --;
                checkBoundries ();
                drawsprite ();
                break;
            }
            case 6:
            {//right + up
                drawsprite ();
                y_coordinate --;
                x_coordinate ++;
                checkBoundries ();
                drawsprite ();
                break;
            }
            case 9:
            {//left + down
                drawsprite ();
                y_coordinate ++;
                x_coordinate --;
                checkBoundries ();
                drawsprite ();
                break;
            }
            case 10:
            {//right + down
                drawsprite ();
                y_coordinate ++;
                x_coordinate ++;
                checkBoundries ();
                drawsprite ();
                break;
            }
        }//end switch/case

        if (Collision_detected_TF == 0)
        {
            border_Change_uncontended(0);
        }
        if (Collision_detected_TF == 1)
        {
            border_Change_uncontended(2);
        }
    }//end while





}

// must have blank line at end
