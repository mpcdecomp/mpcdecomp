#include "mpc2k.h"

void __far __fastcall __loadds X_0484C(void)
{
	switch (G_UI_FLAG) { case 0: goto X_04866; case 1: case 2: case 3: goto L_0486C; default: goto X_04874; }
	return;
X_04866:
	G_UI_FLAG++;
	goto L_04871;
L_0486C:
	G_UI_FLAG += 3;
L_04871:
	fx_echo_st_arm_field();
X_04874:
	;
}
