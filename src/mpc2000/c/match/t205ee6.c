#include "mpc2k.h"

void __far __fastcall __loadds note_release_latched(void)
{
	if ((unsigned)(G_LATCHED_PLAY_NOTE - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) goto br_062E5;
	pad_note_release(G_LATCHED_PLAY_NOTE);
	G_LATCHED_PLAY_NOTE = 0;
br_062E5:
	;
}
