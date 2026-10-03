#include "mpc2k.h"

void __far __fastcall __loadds X_08A52(void)
{
	if (G_TRACK_MODE >= 4) goto X_08A66;
	G_TRACK_MODE++;
	trim_arm_field();
X_08A66:
	;
}
