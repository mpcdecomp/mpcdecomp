#include "mpc2k.h"

void __far __fastcall __loadds keep_or_retry_down(void)
{
	if (G_KEEP_RETRY_FOCUS) goto X_0B78C;
	ui_sound_dialog_draw(1);
X_0B78C:
	;
}
