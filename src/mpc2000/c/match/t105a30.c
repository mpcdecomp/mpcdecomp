#include "mpc2k.h"

void __far __fastcall __loadds pad_note_select(int a0)
{
	char l1;

	if (!(char)a0) goto br_059F1;
	l1 = PTR_TRACK_DATA[(pad_bank_get() << 4) + (unsigned char)(char)(a0 >> 8)];
	if ((unsigned)(l1 - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) goto br_059F1;
	(*(char *)&G_PAD_NOTE_BASE) = l1;
	timer_dma_sync();
br_059F1:
	;
}
