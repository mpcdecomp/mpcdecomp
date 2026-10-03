#include "mpc2k.h"

#define S(x) ((long)(char __far *)(x))

void __far __fastcall __loadds X_0991C(void)
{
	((void (__far __pascal *)(struct SND __far *, int, int))timer_value_read_4)(SND_CURRENT, 0x1a, 2);
	mode_dispatch_index(0xc7, 1);
	if (SND_CURRENT) {
		cmd_dispatch_1E(2, 2, S(sample_check_active(SND_CURRENT) ? STR_ROM_3 : STR_SND_3));
		display_draw_coord(SND_CURRENT->end - SND_CURRENT->loop, 0x14, 0xc);
		display_draw_coord(SND_CURRENT->loop, 0x7a, 0xc);
		cmd_dispatch_1E(0xda, 0xc, S(TBL_OFF_ON_LABELS + SND_CURRENT->field_24 * 4));
		cmd_exec_caller(SND_CURRENT->end - SND_CURRENT->loop, SND_CURRENT->end);
	}
	field_redraw();
	cmd_ratio_calc();
}
