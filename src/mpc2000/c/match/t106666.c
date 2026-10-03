#include "mpc2k.h"

void __far __fastcall __loadds L_065E6(void)
{
	if (COPY_PGM_CURSOR) goto X_065FB;
	COPY_PGM_CURSOR = 1;
	copy_program_arm_field();
X_065FB:
	;
}
