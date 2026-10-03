#include "mpc2k.h"

void __far __fastcall __loadds pgm_midi_left(void)
{
	if (P_2522 != 3) goto X_064B5;
	P_2522 = 0;
	program_arm_field();
X_064B5:
	;
}
