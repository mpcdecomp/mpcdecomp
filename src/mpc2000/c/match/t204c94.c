#include "mpc2k.h"

void __far L_04DE4(void)
{
	char far *v0;

	v0 = channel_validate(G_STATE_9D8B);
	if (G_FX_EFFECT_SEL <= 2) {
		v0[22] = 0;
		v0[23] = G_FX_EFFECT_SEL;
	} else {
		v0[22] = G_FX_EFFECT_SEL - 2;
	}
	far_04D46();
	fx_redraw();
}
