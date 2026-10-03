#include "mpc2k.h"

void __far L_050AA(void)
{
	*(int far *)P_A724 = voice_ratio_calc(*(int far *)WIN_FIELD_VAR);
	fx_redraw();
}
