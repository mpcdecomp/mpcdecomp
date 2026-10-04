#include "mpc2k.h"

void __far __fastcall __loadds zone_start_fine_up(void)
{
	switch (ZONE_START_FINE_CURSOR) { case 2: case 3: goto br_t1_07CF6; case 4: goto L_07CFE; default: goto L_07D06; }
	return;
br_t1_07CF6:
	ZONE_START_FINE_CURSOR = 0;
	goto L_07D03;
L_07CFE:
	ZONE_START_FINE_CURSOR = 1;
L_07D03:
	zone_start_fine_arm_field();
L_07D06:
	;
}
