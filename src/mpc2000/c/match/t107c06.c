#include "mpc2k.h"

void __far __fastcall __loadds X_07B86(void)
{
	if (LOOP_CURSOR <= 0) goto X_07B9A;
	LOOP_CURSOR--;
	string_byte_scan();
X_07B9A:
	;
}
