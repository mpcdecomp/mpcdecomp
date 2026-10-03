#include "mpc2k.h"

void __far __fastcall __loadds mono_to_stereo_paint(void)
{
	disp_list_run(DL_MONO_TO_STEREO);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x8b, 0xf, (*(long *)&SND_CURRENT));
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x8b, 0x1e, FP_SND_SECONDARY);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x8b, 0x28, TBL_SOUND_NAMES);
	field_redraw();
}
