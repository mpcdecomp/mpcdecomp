#include "mpc2kxl.h"

extern char C2_TBL_0408C[1];

void __far __fastcall __loadds mixer_setup_open(void)
{
	char far *l4;

	l4 = *(long *)(C2_TBL_0408C + C2_W_MIXER_SETUP_CURSOR * 42);
	if (!l4) goto br_5187C;
	((int (__far *)(void))l4)();
br_5187C:
	;
}
