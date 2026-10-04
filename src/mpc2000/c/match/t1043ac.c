#include "mpc2k.h"

void __far __fastcall __loadds L_04326(void)
{
	switch (G_UI_MODE) { case 0: goto br_04340; case 1: case 2: case 3: goto L_04348; default: goto X_04350; }
	return;
br_04340:
	G_UI_MODE = 4;
	goto L_0434D;
L_04348:
	G_UI_MODE += 3;
L_0434D:
	fx_autopan_arm_field();
X_04350:
	;
}
