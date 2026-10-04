#include "mpc2k.h"

void __far __fastcall __loadds fx_rotary_up(void)
{
	switch (G_UI_MODE) { case 0: goto X_04156; case 3: goto L_0414E; }
	G_UI_MODE--;
	goto L_04153;
L_0414E:
	G_UI_MODE = 0;
L_04153:
	fx_rotary_arm_field();
X_04156:
	;
}
