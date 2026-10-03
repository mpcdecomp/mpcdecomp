#include "mpc2k.h"

void __far __fastcall __loadds L_05DD6(void)
{
	disp_list_run(DL_INIT_PAD_ASSIGN);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0xa9, 0x17, P_1DD3[0] * 8 + TBL_PGM_MASTER_LABELS);
	field_redraw();
}
