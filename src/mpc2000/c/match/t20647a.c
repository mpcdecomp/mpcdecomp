#include "mpc2k.h"

void __far __fastcall __loadds mixer_stereo_page(void)
{
	voice_block_copy(P_2AEA);
	win_keys_merge(P_2B02);
	disp_list_run(P_2B1C);
}
