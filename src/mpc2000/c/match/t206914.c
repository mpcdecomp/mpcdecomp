#include "mpc2k.h"

void __far __fastcall __loadds mixer_fxsend_page(void)
{
	voice_block_copy(P_2C3E);
	win_keys_merge(P_2C56);
	disp_list_run(P_2C70);
}
