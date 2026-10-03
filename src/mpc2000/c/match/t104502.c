#include "mpc2k.h"

void __far __fastcall __loadds fx_pitch_shift_down(void)
{
	if (!G_UI_MODE) {
		G_UI_MODE = 1;
	} else {
		if (G_FX_EFFECT_SEL != 6) goto X_044A6;
		if (G_UI_MODE >= 5) goto X_044A6;
		G_UI_MODE += 2;
	}
	fx_pitch_arm_field();
X_044A6:
	;
}
