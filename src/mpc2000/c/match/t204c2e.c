#include "mpc2k.h"

void __far __fastcall __loadds L_04D7E(void)
{
	char far *v0;

	v0 = channel_validate(G_STATE_9D8B);
	G_FX_EFFECT_SEL = !v0[22] ? v0[23] : v0[22] + 2;
	far_04D46();
}
