#include "mpc2k.h"

void __far __fastcall __loadds mono_to_stereo_down(void)
{
	((void (__far __pascal *)(char __far *, int, int))far_call_wrapper_1)(TBL_SOUND_NAMES, 0x8b, 0x28);
}
