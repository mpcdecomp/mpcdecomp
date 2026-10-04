#include "mpc2kxl.h"

extern long C0_B_098B8;
extern char C1_W_08FCB[1];
extern char C2_W_03D94[1];
extern int C2_W_098BA;
extern char __far L_5052A[];
extern char __far L_50554[];
extern char __far L_50566[];
extern char __far br_50EA4[];
void __far L_50574(void);

void __far __fastcall __loadds auto_chromatic_paint(void)
{
	((void (__far *)(char __far *))smem_proc_wrapper)(L_5052A);
	((void (__far *)(char __far *))disp_list_run)(C2_W_03D94);
	((void (__far *)(long, char __far *))draw_string_at)(0xb0015L, br_50EA4);
	((void (__far *)(long, int, char __far *))far_47CB4)(0xb003fL, (*(unsigned char *)&C2_B_PAD_NOTE), ((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x60));
	((void (__far *)(long, long))far_47D5E)(0xb0069L, C0_B_098B8);
	((void (__far *)(long, char __far *))draw_string_at)(0x15001bL, L_50554);
	((void (__far *)(int, int, long, int))draw_unsigned_value)(0x69, 0x15, (long)(*(char *)C2_W_08D84), 2);
	draw_char_at(0x7b, 0x15, ((*(char *)C2_W_08D84) - 0x23) / 0x10 + 0x41);
	draw_char_at(0x81, 0x15, (((*(char *)C2_W_08D84) - 0x23) % 0x10 + 1) / 0xa + 0x30);
	draw_char_at(0x87, 0x15, (((*(char *)C2_W_08D84) - 0x23) % 0x10 + 1) % 0xa + 0x30);
	((void (__far *)(long, char __far *))draw_string_at)(0x1f001bL, L_50566);
	draw_signed_value(0x69, 0x1f, (long)(*(int *)C2_W_08D82), 3);
	((void (__far *)(long, char __far *))draw_string_at)(0x29001bL, L_50574);
	((void (__far *)(long, char __far *))draw_string_at)(0x290069L, C1_W_08FCB);
	((void (__far *)(void))field_engine_redraw)();
}
