#include "mpc2k.h"

void __far __fastcall __loadds X_04696(void)
{
	if (!G_UI_FLAG) {
		G_UI_FLAG = 2;
	} else {
		if (G_UI_FLAG >= 4) goto X_046B8;
		G_UI_FLAG++;
	}
	fx_echo_arm_field();
X_046B8:
	;
}
