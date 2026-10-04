#include "mpc2k.h"

void __far __fastcall __loadds zone_start_fine_right(void)
{
	if (ZONE_START_FINE_CURSOR >= 4) goto X_07D42;
	ZONE_START_FINE_CURSOR++;
	zone_start_fine_arm_field();
X_07D42:
	;
}
