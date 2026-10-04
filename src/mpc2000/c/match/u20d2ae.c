#include "mpc2k.h"

void __far __fastcall __loadds receive_mode_paint(void)
{
	disp_list_run(P_438C);
	cmd_dispatch_1E(0x73, 0x1c, B_8CED[0] * 7 + P_4360);
	field_redraw();
}
