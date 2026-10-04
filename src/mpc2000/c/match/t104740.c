#include "mpc2k.h"

void __far __fastcall __loadds X_046BA(void)
{
	if (!(*(char *)&G_UI_FLAG)) goto X_046CF;
	(*(char *)&G_UI_FLAG) = 0;
	fx_echo_arm_field();
X_046CF:
	;
}
