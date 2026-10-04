#include "mpc2k.h"

void __far __fastcall __loadds pgm_midi_down(void)
{
	if (P_2522 == 3) {
		P_2522 = 1;
	} else {
		if (P_2522 >= 2) goto X_0649E;
		P_2522++;
	}
	program_arm_field();
X_0649E:
	;
}
