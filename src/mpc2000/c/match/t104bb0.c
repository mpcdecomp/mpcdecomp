#include "mpc2k.h"

void __far __fastcall __loadds L_04B2A(void)
{
	if (G_UI_SUBMODE < 4) goto L_04B3F;
	G_UI_SUBMODE -= 3;
	fx_reverb_arm_field();
L_04B3F:
	;
}
