#include "mpc2k.h"

void __far __fastcall __loadds X_05E2E(void)
{
	if (VELO_FILTER_CURSOR >= 5) goto X_05E3F;
	VELO_FILTER_CURSOR++;
X_05E3F:
	timer_poll_wait_4();
}
