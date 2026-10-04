#include "mpc2k.h"

void __far __fastcall __loadds L_0620E(void)
{
	note_release_latched();
	win_keys_merge(P_243E);
	if ((*(unsigned char *)&G_VELOCITY_MAX) <= 0x7f) goto br_0622E;
	(*(unsigned char *)&G_VELOCITY_MAX) = 0x7f;
br_0622E:
	velo_pitch_arm_field();
}
