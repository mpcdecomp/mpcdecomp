#include "mpc2k.h"

void __far __fastcall __loadds fx_rotary_right(void)
{
	switch (G_UI_MODE) { case 0: goto br_041BC; case 1: case 2: goto L_041C4; default: goto X_041CC; }
	return;
br_041BC:
	G_UI_MODE = 3;
	goto L_041C9;
L_041C4:
	G_UI_MODE += 2;
L_041C9:
	fx_rotary_arm_field();
X_041CC:
	;
}
