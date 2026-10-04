#include "mpc2k.h"

void __far __fastcall __loadds X_07A42(void)
{
	if (END_FINE_CURSOR >= 2) goto L_07A53;
	END_FINE_CURSOR++;
L_07A53:
	end_fine_arm_field();
}
