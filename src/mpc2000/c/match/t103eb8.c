#include "mpc2k.h"

void __far __fastcall __loadds filter4_up(void)
{
	switch (FILTER4_CURSOR) { case 0: case 1: goto L_03E6A; case 2: case 3: goto br_03E5A; case 4: case 5: case 6: goto T1_L_03E62; }
	FILTER4_CURSOR -= 5;
	goto br_03E67;
br_03E5A:
	FILTER4_CURSOR -= 2;
	goto br_03E67;
T1_L_03E62:
	FILTER4_CURSOR = 1;
br_03E67:
	midi_note_handler();
L_03E6A:
	;
}
