#include "mpc2k.h"

void __far __fastcall __loadds filter4_down(void)
{
	switch (FILTER4_CURSOR) {
	default:
		FILTER4_CURSOR += 5;
		break;
	case 0: case 1:
		FILTER4_CURSOR += 2;
		break;
	case 9: case 10: case 11:
		FILTER4_CURSOR = 0xd;
		break;
	case 12: case 13:
		return;
	}
	midi_note_handler();
}
