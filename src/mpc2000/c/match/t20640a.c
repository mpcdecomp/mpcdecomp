#include "mpc2k.h"

void __far __fastcall __loadds X_067E8(void)
{
	disp_list_run(DL_COPY_NOTE_PARAMS);
	sequence_get_info(G_COPY_SRC_PGM, 0x55, 0xb);
	timer_value_read_3(G_COPY_SRC_NOTE[0], 0x55, 0x14);
	sequence_get_info(G_COPY_DST_PGM, 0x55, 0x20);
	timer_value_read_3(G_COPY_DST_NOTE[0], 0x55, 0x29);
	field_redraw();
}
