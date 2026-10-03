#include "mpc2k.h"

void __far __fastcall __loadds fit_to_length_cancel(void)
{
	far_08010();
	disp_list_run(P_364E);
	win_keys_merge(P_3680);
	G_SND_EDIT_PAGE = 1;
	zone_range_clamp();
	string_byte_scan();
}
