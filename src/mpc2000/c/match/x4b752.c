#include "mpc2kxl.h"

extern char C2_W_01BA8[1];

void __far L_4B752(void)
{
	C2_W_LOOP_FINE_CURSOR = 0;
	((void (__far *)(char __far *))far_4A9DE)(C2_W_01BA8);
}
