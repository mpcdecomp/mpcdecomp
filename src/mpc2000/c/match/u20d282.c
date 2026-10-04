#include "mpc2k.h"

void __far __fastcall __loadds L_0D282(void)
{
	far_0AD74();
	win_keys_merge(TBL_WINKEYS_RECEIVE_MODE);
	voice_trigger_full(B_8CED, 1, 0x73, 0x1c, 7, 0L);
}
