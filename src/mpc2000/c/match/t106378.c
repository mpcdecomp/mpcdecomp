#include "mpc2k.h"

void __far __fastcall __loadds track_calc_multi_2(void)
{
	char far *v0;
	char far *v1;
	char far *v2;

	v0 = ((char __far * (__near __pascal *)(int))track_calc_offset2)(G_PAD_NOTE_BASE);
	disp_list_run(DL_MUTE_ASSIGN);
	timer_value_read_3(G_PAD_NOTE_BASE, 0x37, 0xb);
	((void (__far __pascal *)(char __far *, int, int))timer_value_read_4)(*(long far *)v0, 0x61, 0xb);
	timer_value_read_3(v0[11], 0x37, 0x1e);
	if ((unsigned char)v0[11] < 0x23) v1 = 0; else v1 = *(long far *)((char __far * (__near __pascal *)(int))track_calc_offset2)((unsigned char)v0[11]);
	((void (__far __pascal *)(char __far *, int, int))timer_value_read_4)(v1, 0x61, 0x1e);
	timer_value_read_3(v0[12], 0x37, 0x27);
	if ((unsigned char)v0[12] < 0x23) v2 = 0; else v2 = *(long far *)((char __far * (__near __pascal *)(int))track_calc_offset2)((unsigned char)v0[12]);
	((void (__far __pascal *)(char __far *, int, int))timer_value_read_4)(v2, 0x61, 0x27);
	field_redraw();
	if (!*(char far * far *)v0) goto L_063D9;
	(*(long *)&SND_CURRENT) = *(long far *)v0;
L_063D9:
	;
}
