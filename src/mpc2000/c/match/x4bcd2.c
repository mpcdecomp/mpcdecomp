#include "mpc2kxl.h"

extern char C2_W_01E6A[1];

void __far loop_focus_to(void)
{
	C2_W_LOOP_CURSOR = 2;
	((void (__far *)(char __far *))far_4A9DE)(C2_W_01E6A);
}
