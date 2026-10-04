#include "mpc2kxl.h"

extern char C0_TBL_09160[1];

void __far far_4E182(void)
{
	((void (__far *)(void (__far *)(void), char))far_4EFFA)((void (far *)(void))pgm_assign_screen_draw, C0_TBL_09160[(*(unsigned char *)&C2_B_PAD_DRUM) * 388]);
}
