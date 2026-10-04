#include "mpc2k.h"

void __far __fastcall __loadds fx_rotary_left(void)
{
	switch (G_UI_MODE) { case 3: goto br_04190; case 4: case 5: goto L_04198; default: goto L_041A0; }
	return;
br_04190:
	G_UI_MODE = 1;
	goto L_0419D;
L_04198:
	G_UI_MODE = 2;
L_0419D:
	fx_rotary_arm_field();
L_041A0:
	;
}
