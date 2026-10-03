#include "mpc2k.h"

void __far __fastcall __loadds X_04B0C(void)
{
	if ((*(char *)&G_UI_SUBMODE) == 3) goto X_04B27;
	if ((*(char *)&G_UI_SUBMODE) == 6) goto X_04B27;
	(*(char *)&G_UI_SUBMODE)++;
	fx_reverb_arm_field();
X_04B27:
	;
}
