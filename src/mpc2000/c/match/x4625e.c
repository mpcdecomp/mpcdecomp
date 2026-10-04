#include "mpc2kxl.h"

extern char far *C0_W_0D7C2;
extern char C1_SEG[1];
extern char C1_W_00D1C[1];
extern char EP_L_46332_OFF[1];

void __far __fastcall __loadds load_sound_paint(void)
{
	((void (__far *)(char __near *, char __near *))far_3ED98)(EP_L_46332_OFF, C1_SEG);
	((void (__far *)(char __far *))disp_list_run)(C1_W_00D1C);
	((void (__far *)(long, char __far *))draw_string_at)(0x150047L, C0_W_0D7C2 + 0x12);
	((void (__far *)(long, int, char __far *))far_47CB4)(0x270083L, (*(unsigned char *)&C2_B_PAD_NOTE), ((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x60));
	((void (__far *)(void))field_engine_redraw)();
}
