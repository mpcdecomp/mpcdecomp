#include "mpc2k.h"

void __far __fastcall __loadds timer_status_check_3(void)
{
	int di_;
	char far *v0;

	v0 = ((char __far * (__near __pascal *)(int))track_calc_offset2)(G_PAD_NOTE_BASE);
	disp_list_run(DL_VELO_PITCH);
	timer_value_read_3(G_PAD_NOTE_BASE, 0x37, 0xb);
	timer_value_read_4(*(int far *)(v0 + 2), *(int far *)v0, 0x61, 0xb);
	draw_signed_value(0x61, 0x1c, (long)*(int far *)(v0 + 13), 3);
	draw_signed_value(0xcd, 0x1c, (long)v0[28], 3);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xcd, 0x28, (unsigned long)(*(unsigned char *)&G_VELOCITY_MAX), 3);
	di_ = (*(char far * far *)v0)[18] + *(int far *)(v0 + 13);
	if (di_ <= 0xf0) goto br_061C9;
	di_ = 0xf0;
br_061C9:
	if (di_ >= -0xf0) goto br_061D2;
	di_ = -0xf0;
br_061D2:
	((void (__far __pascal *)(int, int))timer_value_read_5)(0x61, 0x28, ((int (__far __pascal *)(int, int, int))sample_calc_offset)(*(int far *)(v0 + 2), *(int far *)v0, di_));
	field_redraw();
	if (!*(char far * far *)v0) goto L_06208;
	(*(long *)&SND_CURRENT) = *(long far *)v0;
L_06208:
	;
}
