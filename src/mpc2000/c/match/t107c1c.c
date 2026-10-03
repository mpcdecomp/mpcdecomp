#include "mpc2k.h"

void __far __fastcall __loadds X_07B9C(void)
{
	if (LOOP_CURSOR >= 4) goto X_07BB0;
	LOOP_CURSOR++;
	string_byte_scan();
X_07BB0:
	;
}
