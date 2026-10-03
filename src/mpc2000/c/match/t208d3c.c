#include "mpc2k.h"

#define S(x) ((long)(char __far *)(x))

void __far __fastcall __loadds X_09124(void)
{
	((void (__far __pascal *)(struct SND __far *, int, int))timer_value_read_4)(SND_CURRENT, 0x1a, 2);
	mode_dispatch_index(0xc7, 1);
	cmd_dispatch_1E(0xd4, 0xc, S(TBL_LEFT_RIGHT_LABELS + SND_EDIT_VIEW * 6));
	if (SND_CURRENT) {
		cmd_dispatch_1E(2, 2, S(sample_check_active(SND_CURRENT) ? STR_ROM_2 : STR_SND_2));
		display_draw_coord(SND_CURRENT->start, 0x1a, 0xc);
		display_draw_coord(SND_CURRENT->end, 0x7a, 0xc);
		cmd_exec_caller(SND_CURRENT->start, SND_CURRENT->end);
	}
	field_redraw();
	cmd_ratio_calc();
}
