#include "mpc2k.h"

void __far __fastcall __loadds L_05E02(void)
{
	note_release_latched();
	win_keys_merge(TBL_WINKEYS_INIT_PAD_ASSIGN);
	P_1DD3[0] = B_9D77;
	voice_trigger_full(P_1DD3, 1, 0xa9, 0x17, 8, 0, 0);
}
