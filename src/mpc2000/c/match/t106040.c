#include "mpc2k.h"

void __far __fastcall __loadds L_05FC0(void)
{
	note_release_latched();
	win_keys_merge(P_2380);
	if ((*(unsigned char *)&G_VELOCITY_MAX) <= 0x7f) goto br_05FE0;
	(*(unsigned char *)&G_VELOCITY_MAX) = 0x7f;
br_05FE0:
	timer_poll_wait_4();
}
