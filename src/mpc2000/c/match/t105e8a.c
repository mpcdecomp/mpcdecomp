#include "mpc2k.h"

void __far __fastcall __loadds X_05E0A(void)
{
	if (VELO_FILTER_CURSOR == 4) {
		VELO_FILTER_CURSOR = 0;
	} else {
		if (VELO_FILTER_CURSOR <= 0) goto X_05E29;
		VELO_FILTER_CURSOR--;
	}
X_05E29:
	timer_poll_wait_4();
}
