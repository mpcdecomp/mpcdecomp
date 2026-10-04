#include "mpc2k.h"

void __far __fastcall __loadds delete_pgm_paint(void)
{
	disp_list_run(DL_DELETE_PROGRAM);
	sequence_get_info(PGM_SLOT, 0x61, 0x11);
	field_redraw();
}
