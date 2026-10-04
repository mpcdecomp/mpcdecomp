#include "mpc2k.h"

void __far __fastcall __loadds fx_mixer_lr_right(void)
{
	if ((*(char *)&FX_MIXER_CURSOR)) goto X_04E85;
	(*(char *)&FX_MIXER_CURSOR) = 1;
	fx_mixer_arm_field();
X_04E85:
	;
}
