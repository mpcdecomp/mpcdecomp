#include "mpc2k.h"

void __far __pascal ui_screen_enter_chan(long p0)
{
	if (((char __far * (__far *)(int))channel_validate)(G_STATE_9D8B)[48] != 3) {
		((void (__near __pascal *)(char __far *, void (__far *)(void), long))ui_screen_enter)(TBL_WINKEYS_01968, L_051EE, p0);
		fx_echo_arm_field();
		return;
	}
	((void (__near __pascal *)(char __far *, void (__far *)(void), long))ui_screen_enter)(TBL_WINKEYS_01990, L_051EE, p0);
	fx_echo_st_arm_field();
}
