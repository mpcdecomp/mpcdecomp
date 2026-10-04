#include "mpc2k.h"

void __far __fastcall __loadds X_05E44(void)
{
	if (VELO_FILTER_CURSOR <= 3) goto X_05E56;
	VELO_FILTER_CURSOR -= 2;
X_05E56:
	timer_poll_wait_4();
}
