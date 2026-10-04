#include "mpc2k.h"

void __far __fastcall __loadds L_06096(void)
{
	VELO_PITCH_CURSOR = P_23C2[VELO_PITCH_CURSOR + 4];
	velo_pitch_arm_field();
}
