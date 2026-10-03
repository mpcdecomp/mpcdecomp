#include "mpc2k.h"

void __far __fastcall __loadds L_0666A(void)
{
	disp_list_run(DL_CREATE_NEW_PROGRAM);
	cmd_dispatch_1E(0x7f, 0x13, TBL_SOUND_NAMES);
	draw_unsigned_value(0xc1, 0x25, (long)(COPY_PGM_TO[0] + 1), 3);
	if (COPY_PGM_CURSOR) goto L_066B2;
	cmd_dispatch_1E(0x49, 0x1c, PTR_STR_PRESS_ENTER);
L_066B2:
	field_redraw();
}
