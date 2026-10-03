#include "mpc2k.h"

void __far __fastcall __loadds X_08A0C(void)
{
	if (G_TRACK_MODE <= 1) goto X_08A21;
	G_TRACK_MODE -= 2;
	trim_arm_field();
X_08A21:
	;
}
