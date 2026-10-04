#include "mpc2k.h"

void __far __fastcall __loadds mono_to_stereo_up(void)
{
	X_02D4A();
	field_edit_disable();
	((void (__far __pascal *)(char __far *, int, int, int, int, int))far_035F2)(((char *)&FP_SND_SECONDARY), 0, 0x8b, 0x1e, 0, 0);
}
