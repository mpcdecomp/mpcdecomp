#include "mpc2k.h"

void __far __fastcall __loadds snd_params_screen_enter(void)
{
	win_keys_merge(P_3B84);
	G_SND_EDIT_PAGE = 3;
	zone_range_clamp();
	trim_arm_field();
}
