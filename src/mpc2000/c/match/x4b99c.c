#include "mpc2kxl.h"

extern char C2_W_01D04[1];

void __far L_4B99C(void)
{
	C2_W_LOOP_END_FINE_CURSOR = 1;
	((void (__far *)(char __far *))far_4AC96)(C2_W_01D04);
}
