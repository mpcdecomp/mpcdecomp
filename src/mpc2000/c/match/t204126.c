#include "mpc2k.h"

void __far __fastcall __loadds L_04270(void)
{
	if (G_STATE_9D8B < FX_MULTI_COUNT) {
		audio_dispatch_table(0, 0);
		return;
	}
	ui_screen_enter_edit(0, 0);
}
