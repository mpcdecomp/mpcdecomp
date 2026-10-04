#include "mpc2k.h"

void __far __fastcall __loadds X_06540(void)
{
	if (!(*(char *)&PROGRAM_CURSOR)) goto X_06555;
	(*(char *)&PROGRAM_CURSOR) = 0;
	L_064F4();
X_06555:
	;
}
