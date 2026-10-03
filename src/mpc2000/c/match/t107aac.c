#include "mpc2k.h"

void __far __fastcall __loadds X_07A2C(void)
{
	if (END_FINE_CURSOR <= 0) goto X_07A3D;
	END_FINE_CURSOR--;
X_07A3D:
	end_fine_arm_field();
}
