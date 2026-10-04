#include "mpc2k.h"

void __far __pascal voice_param_proc(int kind, int pad, int val)
{
	int note;

	if (val > 100) val = 100;
	if (pad > 0x3f) return;
	note = PTR_TRACK_DATA[pad];
	if ((unsigned)(note - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) return;
	switch (kind) {
	case 1:
		note_clamp_flag(note)[0] = val;
		break;
	case 2:
		note_clamp_flag(note)[1] = val;
		break;
	case 3:
		note_range_clamp(note)[4] = val;
		break;
	case 5:
		note_range_clamp(note)[2] = val;
		break;
	}
}
