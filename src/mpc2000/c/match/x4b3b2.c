#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_TBL_01AAE[1];
extern char C2_W_01A16[1];

void __far L_4B3B2(void)
{
	((void (__far *)(char __far *))handler_set_install)(C2_W_01A16);
	if (C2_W_END_FINE_CURSOR < 0) goto br_4B3CC;
	if ((unsigned)C2_W_END_FINE_CURSOR < 3) goto br_4B3D2;
br_4B3CC:
	C2_W_END_FINE_CURSOR = 0;
br_4B3D2:
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
	((int (__far *)(void))*(long *)(C2_TBL_01AAE + C2_W_END_FINE_CURSOR * 42))();
}
