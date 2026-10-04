#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_TBL_01BB6[1];
extern char C2_W_01B1E[1];

void __far L_4AF96(void)
{
	long l4;

	l4 = *(long far *)(C0_W_0D7C2 + 42) - *(long far *)(C0_W_0D7C2 + 50);
	((void (__far *)(char __far *))handler_set_install)(C2_W_01B1E);
	if (C2_W_LOOP_FINE_CURSOR < 0) goto br_4B5CE;
	if ((unsigned)C2_W_LOOP_FINE_CURSOR < 4) goto br_4B5D4;
br_4B5CE:
	C2_W_LOOP_FINE_CURSOR = 0;
br_4B5D4:
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, l4);
	((int (__far *)(void))*(long *)(C2_TBL_01BB6 + C2_W_LOOP_FINE_CURSOR * 42))();
}
