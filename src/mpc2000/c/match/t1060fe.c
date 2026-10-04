#include "mpc2k.h"

void __far __fastcall __loadds T1_L_0607E(void)
{
	VELO_PITCH_CURSOR = P_23C2[VELO_PITCH_CURSOR];
	velo_pitch_arm_field();
}
