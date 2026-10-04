#include "mpc2k.h"

void __far __fastcall __loadds t1_copy_pgm_cancel(void)
{
	if (P_2522 == 3) goto X_064CD;
	P_2522 = 3;
	program_arm_field();
X_064CD:
	;
}
