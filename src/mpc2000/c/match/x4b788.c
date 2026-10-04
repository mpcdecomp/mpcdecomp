#include "mpc2kxl.h"

extern char C2_W_01BD2[1];

void __far L_4B788(void)
{
	C2_W_LOOP_FINE_CURSOR = 1;
	((void (__far *)(char __far *))far_4AC96)(C2_W_01BD2);
}
