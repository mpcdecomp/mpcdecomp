#include "mpc2kxl.h"

extern char C0_B_08E70;
extern char C0_TBL_04BB0[1];
extern char C0_TBL_04BB2[1];
extern char C0_W_0506A[1];
extern char C0_W_0508E[1];
extern char C2_SEG[1];
extern char EP_FAR_53504_OFF[1];

void __far __fastcall __loadds fx_pitch_shift_paint(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7);
	((void (__far *)(char __near *, char __near *))far_529AC)(EP_FAR_53504_OFF, C2_SEG);
	((void (__far *)(char __far *))disp_list_run)(C0_W_0506A);
	((void (__far *)(long, int, int))draw_string_at)(0xb0031L, *(int *)(C0_TBL_04BB0 + C0_B_08E70 * 4), *(int *)(C0_TBL_04BB2 + C0_B_08E70 * 4));
	fn_3D198(0x91, 0x15, *(int far *)(v0 + 38));
	fn_3D198(0xbb, 0x15, *(int far *)(v0 + 40));
	if (C0_B_08E70 != 6) goto br_3D065;
	((void (__far *)(char __far *))disp_list_run)(C0_W_0508E);
	((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0x97, 0x1f, (unsigned long)(unsigned)*(int far *)(v0 + 42), 3);
	((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0xc1, 0x1f, (unsigned long)(unsigned)*(int far *)(v0 + 44), 3);
	((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0x9d, 0x29, (unsigned long)(unsigned char)v0[46], 2);
	((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0xc7, 0x29, (unsigned long)(unsigned char)v0[47], 2);
br_3D065:
	((void (__far *)(void))field_engine_redraw)();
}
