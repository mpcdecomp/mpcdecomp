#include "mpc2k.h"

void __far __fastcall __loadds keep_or_retry_up(void)
{
	if (!G_KEEP_RETRY_FOCUS) goto L_0B778;
	ui_sound_dialog_draw(0);
L_0B778:
	;
}
