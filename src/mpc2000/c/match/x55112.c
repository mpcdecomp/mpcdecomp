#include "mpc2kxl.h"

extern long C0_W_0D7C2;
extern char C2_W_06366[1];

void __far far_55112(long p0)
{
	(*(long *)&C2_W_08DBE) = p0;
	((void (__far *)(char __far *))handler_set_install)(C2_W_06366);
	if (((int (__far *)(long))sound_list_contains)(C0_W_0D7C2)) goto br_5514E;
	C0_W_0D7C2 = (*(long *)&C0_W_098DC);
br_5514E:
	if (C2_W_SND_DEBUG_CURSOR < 0) goto br_5515C;
	if ((unsigned)C2_W_SND_DEBUG_CURSOR < 1) goto br_55162;
br_5515C:
	C2_W_SND_DEBUG_CURSOR = 0;
br_55162:
	((int (__far *)(void))*(long *)(((char *)&C2_W_06458) + C2_W_SND_DEBUG_CURSOR * 42))();
}
