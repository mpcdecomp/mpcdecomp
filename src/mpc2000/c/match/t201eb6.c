#include "mpc2k.h"

struct held { char on; unsigned char n1, n2; };

void __far __pascal pad_note_release(int n)
{
	if (((struct held *)NOTE_HELD)[n].on) {
		((struct held *)NOTE_HELD)[n].on = 0;
		note_off_voices(n);
		note_off_voices(((struct held *)NOTE_HELD)[n].n1);
		note_off_voices(((struct held *)NOTE_HELD)[n].n2);
	}
}
