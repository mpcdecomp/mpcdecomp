#include "mpc2k.h"

void __far __fastcall __loadds filter4_left(void)
{
	switch (FILTER4_CURSOR) { case 12: case 0: case 2: case 7: goto X_03ECD; }
	FILTER4_CURSOR--;
	midi_note_handler();
X_03ECD:
	;
}
