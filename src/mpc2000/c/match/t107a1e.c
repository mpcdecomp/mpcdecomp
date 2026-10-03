#include "mpc2k.h"

void __far __fastcall __loadds X_0799E(void)
{
	if (START_FINE_CURSOR <= 0) goto X_079AF;
	START_FINE_CURSOR--;
X_079AF:
	start_fine_arm_field();
}
