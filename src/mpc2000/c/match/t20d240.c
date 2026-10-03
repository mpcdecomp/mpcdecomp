#include "mpc2k.h"

void __far __fastcall __loadds stereo_to_mono_up(void)
{
	((void (__far __pascal *)(char __far *, int, int))far_call_wrapper_1)(TBL_SOUND_NAMES, 0x8b, 0x1e);
}
