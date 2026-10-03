#include "mpc2k.h"

void __far __fastcall __loadds X_07B60(void)
{
	switch (LOOP_CURSOR) { case 0: goto T1_loop_07B74; case 1: goto L_07B7C; }
	return;
T1_loop_07B74:
	LOOP_CURSOR = 2;
	goto X_07B81;
L_07B7C:
	LOOP_CURSOR = 4;
X_07B81:
	string_byte_scan();
}
