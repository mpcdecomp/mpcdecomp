#include "mpc2k.h"

void __far __fastcall __loadds X_08A24(void)
{
	if (G_TRACK_MODE >= 3) goto X_08A39;
	G_TRACK_MODE += 2;
	trim_arm_field();
X_08A39:
	;
}
