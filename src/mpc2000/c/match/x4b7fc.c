#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C2_TBL_01CE8[1];
extern char C2_W_01C50[1];

void __far far_4A8C2(void)
{
	((void (__far *)(char __far *))handler_set_install)(C2_W_01C50);
	if (C2_W_LOOP_END_FINE_CURSOR < 0) goto br_4B816;
	if ((unsigned)C2_W_LOOP_END_FINE_CURSOR < 4) goto br_4B81C;
br_4B816:
	C2_W_LOOP_END_FINE_CURSOR = 0;
br_4B81C:
	((void (__far *)(char __far *, long))far_4B16C)(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
	((int (__far *)(void))*(long *)(C2_TBL_01CE8 + C2_W_LOOP_END_FINE_CURSOR * 42))();
}
