#include "mpc2k.h"

void __far __fastcall __loadds X_04820(void)
{
	switch (G_UI_FLAG) { case 0: goto X_0484A; case 4: case 5: case 6: goto L_04842; }
	G_UI_FLAG = 0;
	goto L_04847;
L_04842:
	G_UI_FLAG -= 3;
L_04847:
	fx_echo_st_arm_field();
X_0484A:
	;
}
