#include "mpc2k.h"

void __far __fastcall __loadds keep_or_retry_paint(void)
{
	disp_list_run(DL_KEEP_OR_RETRY);
	((void (__far __pascal *)(int, int, long))cmd_dispatch_1E)(0x85, 0x13, P_5140);
	timer_value_read_3((*(char *)&G_PAD_NOTE_BASE), 0x85, 0x25);
	if (G_KEEP_RETRY_FOCUS) goto X_0D32B;
	((void (__far __pascal *)(int, int, long))cmd_dispatch_1E)(0x49, 0x1c, PTR_STR_PRESS_ENTER);
X_0D32B:
	field_redraw();
}
