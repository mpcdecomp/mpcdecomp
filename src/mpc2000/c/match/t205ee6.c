#include "mpc2k.h"

void __far __fastcall __loadds note_release_latched(void)
{
	if ((unsigned)(G_LATCHED_PLAY_NOTE - 0x23) > 0x3f) goto br_062E5;
	pad_note_release(G_LATCHED_PLAY_NOTE);
	G_LATCHED_PLAY_NOTE = 0;
br_062E5:
	;
}
