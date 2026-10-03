#include "mpc2k.h"

#define S(x) ((long)(char __far *)(x))

void __far __fastcall __loadds zone_start_fine_paint(void)
{
	((void (__far __pascal *)(struct SND __far *, int, int))timer_value_read_4)(SND_CURRENT, 0x1a, 2);
	mode_dispatch_index(0xc7, 1);
	if (SND_CURRENT) {
		cmd_dispatch_1E(2, 2, S(sample_check_active(SND_CURRENT) ? STR_ROM_4 : STR_SND_4));
		display_draw_coord(G_ZONE_START, 0x1a, 0xc);
		display_draw_coord(G_ZONE_END, 0x7a, 0xc);
		cmd_exec_caller(G_ZONE_START, G_ZONE_END);
	}
	cmd_dispatch_1E(0xd4, 0xc, S(TBL_LEFT_RIGHT_LABELS + SND_EDIT_VIEW * 6));
	field_redraw();
	cmd_ratio_calc();
}
