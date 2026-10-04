#include "mpc2k.h"

void __far __fastcall __loadds L_09E4E(void)
{
	disp_list_run(DL_ZONE_START_FINE);
	cmd_write_caller(G_ZONE_START);
	display_draw_coord(G_ZONE_START, 0xb5, 0xc);
	display_draw_coord(G_ZONE_LEN, 0xb5, 0x15);
	cmd_dispatch_1E(0xcd, 0x1f, ZONE_LEN_FIX * 5 + TBL_LOOP_LEN_MODE_LABELS);
	mode_dispatch_index(0xb5, 0x28);
	field_redraw();
}
