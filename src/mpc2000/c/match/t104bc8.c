#include "mpc2k.h"

void __far __fastcall __loadds L_04B42(void)
{
	if (G_UI_SUBMODE >= 4) goto br_04B7C;
	if (*((char __far * (__far *)(int))channel_get_ptr)(G_STATE_9D8B) >= 4) goto br_04B7C;
	if (!G_UI_SUBMODE) {
		G_UI_SUBMODE = 4;
	} else {
		G_UI_SUBMODE += 3;
	}
	fx_reverb_arm_field();
br_04B7C:
	;
}
