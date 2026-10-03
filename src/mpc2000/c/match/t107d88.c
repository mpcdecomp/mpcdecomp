#include "mpc2k.h"

void __far __fastcall __loadds zone_start_fine_down(void)
{
	switch (ZONE_START_FINE_CURSOR) { case 0: goto br_07D1C; case 1: goto L_07D24; }
	return;
br_07D1C:
	ZONE_START_FINE_CURSOR = 2;
	goto X_07D29;
L_07D24:
	ZONE_START_FINE_CURSOR = 4;
X_07D29:
	zone_start_fine_arm_field();
}
