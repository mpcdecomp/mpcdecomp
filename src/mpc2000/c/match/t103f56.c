#include "mpc2k.h"

void __far __fastcall __loadds filter4_right(void)
{
	switch (FILTER4_CURSOR) { case 13: goto L_03EFC; case 1: goto br_03EF4; case 6: case 11: goto br_03F04; }
	FILTER4_CURSOR++;
	goto br_03F01;
br_03EF4:
	FILTER4_CURSOR = 4;
	goto br_03F01;
L_03EFC:
	FILTER4_CURSOR = 9;
br_03F01:
	midi_note_handler();
br_03F04:
	;
}
