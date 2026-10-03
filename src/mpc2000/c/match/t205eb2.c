#include "mpc2k.h"

void __far __fastcall __loadds seq_port_io2(void)
{
	char l6[6];

	l6[0] = 0x90;
	l6[2] = 0x7f;
	l6[3] = 1;
	l6[4] = 0;
	l6[5] = 0x40;
	l6[1] = (*(char *)&G_PAD_NOTE_BASE);
	G_LATCHED_PLAY_NOTE = (*(char *)&G_PAD_NOTE_BASE);
	pad_note_trigger(l6);
}
