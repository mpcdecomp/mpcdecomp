#include "mpc2k.h"

void __far __pascal ui_screen_enter_chan(long p0)
{
	if (channel_validate(G_STATE_9D8B)[48] != 3) {
		ui_screen_enter((long)TBL_WINKEYS_01968, (long)L_051EE, p0);
		fx_echo_arm_field();
		return;
	}
	ui_screen_enter((long)TBL_WINKEYS_01990, (long)L_051EE, p0);
	fx_echo_st_arm_field();
}
