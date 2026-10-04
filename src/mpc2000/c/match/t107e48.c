#include "mpc2k.h"

void __far __fastcall __loadds X_07DC8(void)
{
	if (G_PLAY_MODE <= 0) goto X_07DD9;
	G_PLAY_MODE--;
X_07DD9:
	zone_end_fine_arm_field();
}
