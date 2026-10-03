#include "mpc2kxl.h"

void __far __fastcall __loadds snd_debug_re_id(void)
{
	long t1;
	long t2;
	int t3;

	t1 = ((long (__far *)(void __far *, int, int))disp_message_window)(MK_FP(0x4e16 /* C2_SEG */, 0x72ba), -0x1df6, 0x3e19);
	t2 = sound_list_renumber();
	field_handler_nop();
	return;
}
