#include "mpc2kxl.h"

extern char far *C0_B_098B8;
extern char far *C0_W_0D7C2;
extern char C1_W_08FCB[1];
extern char C2_W_0236E[1];
extern int C2_W_098BA;
extern char __far L_4BD16[];
extern char __far far_47ABE[];

void __far __fastcall __loadds mono_to_stereo_paint(void)
{
	((void (__far *)(char __far *))draw_confirm_window)(L_4BD16);
	((void (__far *)(char __far *))disp_list_run)(C2_W_0236E);
	((void (__far *)(long, char __far *))draw_string_at)(0xf008bL, C0_W_0D7C2 + 0x12);
	((void (__far *)(long, char __far *))draw_string_at)(0x1e008bL, C0_B_098B8 + 0x12);
	((void (__far *)(long, char __far *))draw_string_at)(0x28008bL, C1_W_08FCB);
	if (C0_W_0D7C2[37]) goto br_4C7FF;
	if (C0_B_098B8[37]) goto br_4C7FF;
	((void (__far *)(int, int, char __far *))draw_softkey_label)(5, 1, far_47ABE);
br_4C7FF:
	((void (__far *)(void))field_engine_redraw)();
}
