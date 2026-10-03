#include "mpc2k.h"

void __far __fastcall __loadds X_07E66(void)
{
	if (G_PLAY_MODE >= 2) goto L_07E77;
	G_PLAY_MODE++;
L_07E77:
	zone_edit_arm_field();
}
