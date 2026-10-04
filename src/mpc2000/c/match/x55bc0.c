#include "mpc2kxl.h"

extern char C2_W_065DE[1];

void __far sample_dump_field1_thunk(void)
{
	C2_W_SAMPLE_DUMP_CURSOR = 1;
	ui_field_engine(C2_W_065DE, C2_FP_MIDI_IN_BLOCK + 2);
}
