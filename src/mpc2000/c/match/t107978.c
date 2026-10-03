#include "mpc2k.h"

void __far __fastcall __loadds X_078F8(void)
{
	if (TRIM_CURSOR >= 4) goto X_0790C;
	TRIM_CURSOR++;
	trim_start_fine_arm_field();
X_0790C:
	;
}
