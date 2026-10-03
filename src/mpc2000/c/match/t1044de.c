#include "mpc2k.h"

void __far __fastcall __loadds fx_pitch_shift_up(void)
{
	switch (G_UI_MODE) { case 0: goto X_0447A; case 1: goto L_04472; }
	G_UI_MODE -= 2;
	goto L_04477;
L_04472:
	G_UI_MODE = 0;
L_04477:
	fx_pitch_arm_field();
X_0447A:
	;
}
