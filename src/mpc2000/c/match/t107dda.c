#include "mpc2k.h"

void __far __fastcall __loadds zone_screen_enter(void)
{
	far_08010();
	disp_list_run(P_389C);
	win_keys_merge(P_38CE);
	G_SND_EDIT_PAGE = 2;
	zone_range_clamp();
	zone_start_fine_arm_field();
}
