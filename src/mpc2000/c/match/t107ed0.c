#include "mpc2k.h"

void __far __fastcall __loadds X_07E50(void)
{
	if (G_PLAY_MODE <= 0) goto X_07E61;
	G_PLAY_MODE--;
X_07E61:
	zone_edit_arm_field();
}
