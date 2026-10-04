#include "mpc2k.h"

void __far __fastcall __loadds X_0790E(void)
{
	if (TRIM_CURSOR <= 0) goto X_07922;
	TRIM_CURSOR--;
	trim_start_fine_arm_field();
X_07922:
	;
}
