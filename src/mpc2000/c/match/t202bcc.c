#include "mpc2k.h"

void __far __pascal midi_note_io(long p0)
{
	if (!p0) goto br_02C62;
	voice_release_all();
br_02C62:
	;
}
