#include "mpc2k.h"

void __far __fastcall __loadds timer_poll_wait_3(void)
{
	char far *v0;

	v0 = ((char __far * (__near __pascal *)(int))track_calc_offset2)(G_PAD_NOTE_BASE);
	disp_list_run(DL_PGM_PARAMS);
	ui_row_request(0x27);
	draw_unsigned_value(0x1a, 2, (long)(PGM_SLOT + 1), 2);
	((void (__far __pascal *)(unsigned char, int, int))timer_value_read_3)(G_PAD_NOTE_BASE, 0x4a, 2);
	timer_value_read_4(*(int far *)(v0 + 2), *(int far *)v0, 0x74, 2);
	draw_unsigned_value(0x2c, 0x16, (long)v0[15], 3);
	draw_unsigned_value(0x2c, 0x1f, (long)v0[16], 3);
	cmd_dispatch_1E(0x2c, 0x28, v0[17] * 6 + TBL_DECAY_MODE_LABELS);
	draw_unsigned_value(0xa4, 0x19, (long)v0[18], 3);
	draw_unsigned_value(0xaa, 0x24, (long)v0[19], 2);
	draw_signed_value(0xdc, 0xc, (long)*(int far *)(v0 + 13), 3);
	cmd_dispatch_1E(0xbe, 0x28, v0[10] * 9 + TBL_VOICE_OVERLAP_LABELS);
	seq_transfer_io(0x4b, 0xf, v0[15], v0[16], v0[17]);
	field_redraw();
	if (*(long far *)v0) (*(long *)&SND_CURRENT) = *(long far *)v0;
}
