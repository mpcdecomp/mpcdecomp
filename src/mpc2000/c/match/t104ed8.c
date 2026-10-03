#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_lr_left(void)
{
	if (!(*(char *)&FX_MIXER_CURSOR)) goto X_04E6D;
	(*(char *)&FX_MIXER_CURSOR) = 0;
	fx_mixer_arm_field();
X_04E6D:
	;
}
