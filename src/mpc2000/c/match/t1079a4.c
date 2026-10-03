#include "mpc2k.h"

void __far __fastcall __loadds trim_screen_enter(void)
{
	far_08010();
	disp_list_run(DL_TRIM);
	win_keys_merge(TBL_WINKEYS_TRIM);
	G_SND_EDIT_PAGE = 0;
	zone_range_clamp();
	trim_start_fine_arm_field();
}
