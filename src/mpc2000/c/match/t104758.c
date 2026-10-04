#include "mpc2k.h"

void __far __fastcall __loadds X_046D2(void)
{
	if ((*(char *)&G_UI_FLAG)) goto br_046E7;
	(*(char *)&G_UI_FLAG) = 1;
	fx_echo_arm_field();
br_046E7:
	;
}
