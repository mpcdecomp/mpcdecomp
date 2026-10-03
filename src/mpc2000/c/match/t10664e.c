#include "mpc2k.h"

void __far __fastcall __loadds X_065CE(void)
{
	if (!COPY_PGM_CURSOR) goto X_065E3;
	COPY_PGM_CURSOR = 0;
	copy_program_arm_field();
X_065E3:
	;
}
