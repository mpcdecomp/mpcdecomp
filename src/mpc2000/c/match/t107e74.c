#include "mpc2k.h"

void __far __fastcall __loadds L_07DF4(void)
{
	win_keys_merge(TBL_WINKEYS_ZONE_END_FINE);
	G_PLAY_MODE = 0;
	zone_end_fine_arm_field();
}
