#include "mpc2k.h"

void __far __fastcall __loadds X_07B36(void)
{
	switch (LOOP_CURSOR) { case 2: case 3: goto br_07B4E; case 4: goto L_07B56; default: goto X_07B5E; }
	return;
br_07B4E:
	LOOP_CURSOR = 0;
	goto L_07B5B;
L_07B56:
	LOOP_CURSOR = 1;
L_07B5B:
	string_byte_scan();
X_07B5E:
	;
}
