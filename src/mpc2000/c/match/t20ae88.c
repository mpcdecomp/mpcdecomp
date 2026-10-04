#include "mpc2k.h"

void __far __fastcall __loadds X_0B2C0(void)
{
	disp_list_run(DL_LOAD_A_SOUND);
	((void (__far __pascal *)(int, int, int, int))cmd_dispatch_1E)(0x47, 0x15, FP_LOADED_SND_SEG, FP_LOADED_SND);
	timer_value_read_3((*(char *)&G_PAD_NOTE_BASE), 0x83, 0x27);
	field_redraw();
}
