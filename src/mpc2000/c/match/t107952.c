#include "mpc2k.h"

void __far __fastcall __loadds X_078D2(void)
{
	switch (TRIM_CURSOR) { case 0: goto br_078E6; case 1: goto L_078EE; }
	return;
br_078E6:
	TRIM_CURSOR = 2;
	goto X_078F3;
L_078EE:
	TRIM_CURSOR = 4;
X_078F3:
	trim_start_fine_arm_field();
}
