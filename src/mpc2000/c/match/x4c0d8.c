#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char far *C2_FP_02128;
extern char C2_W_02096[1];

void __far far_4C0D8(long p0)
{
	(*(long *)&C2_W_08D2E) = p0;
	if (!((int (__far *)(char __far *))sound_list_contains)(C0_W_0D7C2)) {
		sound_spec_open();
		return;
	}
	((void (__far *)(char __far *))handler_set_install)(C2_W_02096);
	if (C0_W_0D7C2[13] & 1) goto br_4C11D;
	((int (__far *)(void))C2_FP_02128)();
br_4C11D:
	;
}
