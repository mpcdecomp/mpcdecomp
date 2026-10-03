#include "mpc2k.h"

void __far __fastcall __loadds copy_pgm_paint(void)
{
	disp_list_run(DL_COPY_PROGRAM);
	sequence_get_info(G_COPY_SRC_PGM, 0x61, 0x10);
	sequence_get_info(G_COPY_DST_PGM, 0x61, 0x28);
	field_redraw();
}
