#include "mpc2k.h"

void __far __fastcall __loadds L_05D2A(void)
{
	note_release_latched();
	win_keys_merge(P_22C6);
	if ((*(unsigned char *)&G_VELOCITY_MAX) <= 0x7f) goto br_05D4A;
	(*(unsigned char *)&G_VELOCITY_MAX) = 0x7f;
br_05D4A:
	velo_mod_arm_field();
}
