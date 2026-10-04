#include "mpc2k.h"

void __far __fastcall __loadds X_078A8(void)
{
	switch (TRIM_CURSOR) { case 2: case 3: goto br_078C0; case 4: goto L_078C8; default: goto X_078D0; }
	return;
br_078C0:
	TRIM_CURSOR = 0;
	goto L_078CD;
L_078C8:
	TRIM_CURSOR = 1;
L_078CD:
	trim_start_fine_arm_field();
X_078D0:
	;
}
