#include "mpc2k.h"

void __far __fastcall __loadds int2E_read_caller(void)
{
	int di_;
	char far *v0;

	disp_list_run(DL_FX_REVERB);
	fn_03902();
	v0 = ((char __far * (__far *)(int))channel_get_ptr)(G_STATE_9D8B);
	di_ = *v0;
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x31, 0xb, ((long *)FX_REVERB_LABELS)[di_]);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x15, (unsigned long)(unsigned)*(int far *)(v0 + 2), 2);
	((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x29, (unsigned long)(unsigned char)v0[8], 2);
	if (*v0 <= 3) {
		((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x1f, (unsigned long)(unsigned char)v0[7], 2);
		((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0xa9, 0x15, STR_FX_NEAR);
		((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x85, 0x1f, STR_FX_LF_DAMPING);
		((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x85, 0x29, STR_FX_HF_DAMPING);
		((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0xc7, 0x15, (unsigned long)(unsigned char)v0[4], 2);
		cmd_dispatch_caller2(0xc7, 0x1f, v0[5]);
		cmd_dispatch_caller2(0xc7, 0x29, v0[6]);
	} else {
		((void (__far __pascal *)(int, int, unsigned long, int))draw_unsigned_value)(0x61, 0x1f, (unsigned long)(unsigned char)v0[9], 2);
	}
	field_redraw();
}
