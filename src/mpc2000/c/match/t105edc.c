#include "mpc2k.h"

void __far __fastcall __loadds X_05E5C(void)
{
	switch (VELO_FILTER_CURSOR) { case 1: case 2: goto br_05E74; case 3: goto L_05E7C; default: goto br_05E81; }
	goto br_05E81;
br_05E74:
	VELO_FILTER_CURSOR = 4;
	goto br_05E81;
L_05E7C:
	VELO_FILTER_CURSOR = 5;
br_05E81:
	timer_poll_wait_4();
}
