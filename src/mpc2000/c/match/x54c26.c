#include "mpc2kxl.h"

extern long C0_W_00738;
extern int C0_W_0073A;
extern char __far far_54852[];
extern char __far far_54E32[];

void __far __fastcall __loadds build_info_paint(void)
{
	disp_clear_all();
	draw_shadow_box(0, 0, 0xf7, 0x31);
	((void (__far *)(long, char __far *))draw_string_at)(0x20003L, far_54E32);
	((void (__far *)(long, char __far *))draw_string_at)(0xc0003L, C0_W_00738);
	((void (__far *)(long, char __far *))draw_string_at)(0xc006aL, far_54852);
	((void (__far *)(int, int, long))L_3ECCC)(0x82, 0xc, ((long (__far *)(long))far_to_dma_linear)((*(long *)&C2_FP_PGM_ARRAY)) + 0xe6d0L);
}
