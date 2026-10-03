#include "mpc2k.h"

void __far __fastcall __loadds program_paint(void)
{
	disp_list_run(DL_PROGRAM);
	cmd_dispatch_1E(0x73, 0x13, ((char __far *)PGM_CURRENT) + 2);
	draw_unsigned_value(0xa9, 0x25, (long)(((char __far *)PGM_CURRENT)[28] + 1), 3);
	if ((*(char *)&PROGRAM_CURSOR)) goto X_064B1;
	cmd_dispatch_1E(0x3d, 0x1c, PTR_STR_PRESS_ENTER);
X_064B1:
	field_redraw();
}
