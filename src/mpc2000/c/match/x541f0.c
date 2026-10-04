#include "mpc2kxl.h"

extern char C2_SEG[1];
extern char C2_W_054EC[1];
extern char C2_W_0551C[1];
extern char EP_L_5455E_OFF[1];

void __far __fastcall __loadds fx_reverb_paint(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7);
	((void (__far *)(char __near *, char __near *))far_529AC)(EP_L_5455E_OFF, C2_SEG);
	((void (__far *)(char __far *))disp_list_run)(C2_W_054EC);
	((void (__far *)(long, int, int))draw_string_at)(0xb0031L, *(int *)(((char *)&C2_W_0549E) + *v0 * 4), *(int *)(((char *)&C2_W_054A0) + *v0 * 4));
	((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x15, (unsigned long)(unsigned)*(int far *)(v0 + 2), 2);
	((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x29, (unsigned long)(unsigned char)v0[8], 2);
	if (*v0 <= 3) {
		((void (__far *)(char __far *))disp_list_run)(C2_W_0551C);
		((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x1f, (unsigned long)(unsigned char)v0[7], 2);
		((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0xc7, 0x15, (unsigned long)(unsigned char)v0[4], 2);
		far_530E8(0xc7, 0x1f, v0[5]);
		far_530E8(0xc7, 0x29, v0[6]);
	} else {
		((void (__far *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x1f, (unsigned long)(unsigned char)v0[9], 2);
	}
	((void (__far *)(void))field_engine_redraw)();
}
