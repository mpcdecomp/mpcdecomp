#include "mpc2k.h"

void __far __fastcall __loadds X_04CC2(void)
{
	if (G_STATE_9D8B < 2) {
		((void (__far __pascal *)(long))audio_dispatch_table)(FP_UI_RETURN_SCREEN);
		return;
	}
	((void (__far __pascal *)(long))ui_screen_enter_edit)(FP_UI_RETURN_SCREEN);
}
