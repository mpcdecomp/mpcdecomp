#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_TBL_019A6[1];
extern char C2_W_0190C[1];

void __far L_4AF92(void)
{
	((void (__far *)(char __far *))handler_set_install)(C2_W_0190C);
	if (C2_W_START_FINE_CURSOR < 0) goto L_4A64E;
	if ((unsigned)C2_W_START_FINE_CURSOR < 3) goto br_4AFB2;
L_4A64E:
	C2_W_START_FINE_CURSOR = 0;
br_4AFB2:
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 38));
	((int (__far *)(void))*(long *)(C2_TBL_019A6 + C2_W_START_FINE_CURSOR * 42))();
}
