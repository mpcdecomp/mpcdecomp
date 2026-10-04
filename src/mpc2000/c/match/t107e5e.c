#include "mpc2k.h"

void __far __fastcall __loadds X_07DDE(void)
{
	if (G_PLAY_MODE >= 2) goto L_07DEF;
	G_PLAY_MODE++;
L_07DEF:
	zone_end_fine_arm_field();
}
