#include "mpc2k.h"

void __far __fastcall __loadds L_060C6(void)
{
	VELO_PITCH_CURSOR = P_23CE[VELO_PITCH_CURSOR];
	velo_pitch_arm_field();
}
