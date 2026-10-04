#include "mpc2k.h"

void __far __fastcall __loadds X_079B4(void)
{
	if (START_FINE_CURSOR >= 2) goto L_079C5;
	START_FINE_CURSOR++;
L_079C5:
	start_fine_arm_field();
}
