#include "mpc2k.h"

void __far __fastcall __loadds mixer_indiv_page(void)
{
	voice_block_copy(P_2B8A);
	win_keys_merge(P_2BA2);
	disp_list_run(P_2BBC);
}
