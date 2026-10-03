#include "mpc2k.h"

void __far __fastcall __loadds X_04680(void)
{
	if (G_UI_FLAG <= 1) goto X_04694;
	G_UI_FLAG--;
	fx_echo_arm_field();
X_04694:
	;
}
