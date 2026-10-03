#include "mpc2k.h"

void __far __fastcall __loadds program_down(void)
{
	if ((*(char *)&PROGRAM_CURSOR)) goto L_0656D;
	(*(char *)&PROGRAM_CURSOR) = 1;
	L_064F4();
L_0656D:
	;
}
