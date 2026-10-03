#include "mpc2k.h"

void __far __fastcall __loadds zone_start_fine_left(void)
{
	if (ZONE_START_FINE_CURSOR <= 0) goto X_07D58;
	ZONE_START_FINE_CURSOR--;
	zone_start_fine_arm_field();
X_07D58:
	;
}
