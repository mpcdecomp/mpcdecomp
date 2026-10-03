#include "mpc2k.h"

void __far __fastcall __loadds stereo_to_mono_paint(void)
{
	disp_list_run(DL_STEREO_TO_MONO);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x8b, 0xf, (*(long *)&SND_CURRENT));
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x8b, 0x1e, TBL_SOUND_NAMES);
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(0x8b, 0x28, P_8FCD);
	field_redraw();
}
