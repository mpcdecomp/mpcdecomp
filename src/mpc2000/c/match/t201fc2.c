#include "mpc2k.h"

void __far __pascal pad_event_dispatch(unsigned char __far *e)
{
	if ((unsigned)(e[1] - 0x23) <= 0x3f) {
		if (!e[3]) {
			if (G_NOTE_CAPTURE) {
				G_NOTE_IN[0] = e[1];
				G_VELOCITY_IN = e[2];
			}
			if (PAD_INPUT_MODE == 1 || PAD_INPUT_MODE == 2 && MIDI_LOCAL_MODE)
				pad_note_trigger(e);
		} else {
			G_NOTE_IN[0] = e[1];
			G_VELOCITY_IN = e[2];
			pad_note_trigger(e);
		}
	}
}
