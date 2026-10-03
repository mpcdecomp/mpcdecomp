#include "mpc2k.h"

void __far __fastcall __loadds fx_pitch_shift_left(void)
{
	switch (G_UI_MODE) { case 0: goto L_044D0; case 1: case 3: case 5: goto br_044C8; }
	G_UI_MODE--;
	goto L_044CD;
br_044C8:
	G_UI_MODE = 0;
L_044CD:
	fx_pitch_arm_field();
L_044D0:
	;
}
