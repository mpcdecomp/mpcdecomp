#include "mpc2k.h"

void __far __fastcall __loadds X_08A3C(void)
{
	if (G_TRACK_MODE <= 0) goto X_08A50;
	G_TRACK_MODE--;
	trim_arm_field();
X_08A50:
	;
}
