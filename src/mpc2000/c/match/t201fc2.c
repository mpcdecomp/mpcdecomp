#include "mpc2k.h"

void __far __pascal pad_event_dispatch(unsigned char __far *e)
{
	if ((unsigned)(e[1] - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1) {
		if (!e[3]) {
			if (G_NOTE_CAPTURE) {
				G_NOTE_IN[0] = e[1];
				G_VELOCITY_IN = e[2];
			}
			if (PAD_INPUT_MODE == PADIN_ON || PAD_INPUT_MODE == PADIN_LOCAL && MIDI_LOCAL_MODE)
				pad_note_trigger(e);
		} else {
			G_NOTE_IN[0] = e[1];
			G_VELOCITY_IN = e[2];
			pad_note_trigger(e);
		}
	}
}
