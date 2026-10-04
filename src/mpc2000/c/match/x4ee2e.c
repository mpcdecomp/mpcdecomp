#include "mpc2kxl.h"

void __far pgm_midi_focus_pgm(void)
{
	long t1;

	C2_W_PGM_MIDI_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x319c), MK_FP(SEG_DATA, -0x2842));
	return;
}
