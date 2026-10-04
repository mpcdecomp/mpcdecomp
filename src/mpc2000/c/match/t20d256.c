#include "mpc2k.h"

void __far __fastcall __loadds stereo_to_mono_down(void)
{
	far_call_wrapper_1(P_8FCD, 0x8b, 0x28);
}
