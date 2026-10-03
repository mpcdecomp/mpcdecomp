#include "mpc2k.h"

void __far __fastcall __loadds pgm_midi_up(void)
{
	if (P_2522 == 3) goto X_06479;
	if (!P_2522) goto X_06479;
	P_2522--;
	program_arm_field();
X_06479:
	;
}
