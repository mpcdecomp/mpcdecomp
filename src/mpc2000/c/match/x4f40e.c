#include "mpc2kxl.h"

extern char C0_B_098B8;
extern char C1_W_08FCB[1];
extern char C2_W_03558[1];
extern char EP_L_4EB2C_OFF[1];
extern char EP_L_4EB2C_SEG[1];

void __far __fastcall __loadds new_pgm_paint(void)
{
	((void (__far *)(char __near *, char __near *))draw_confirm_window)(EP_L_4EB2C_OFF, EP_L_4EB2C_SEG);
	((void (__far *)(char __far *))disp_list_run)(C2_W_03558);
	((void (__far *)(long, char __far *))draw_string_at)(0x13007fL, C1_W_08FCB);
	((void (__far *)(int, int, long, int))draw_unsigned_value)(0xc1, 0x25, (long)(C0_B_098B8 + 1), 3);
	((void (__far *)(void))field_engine_redraw)();
}
