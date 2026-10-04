#include "mpc2kxl.h"

void __far copy_note_field1_thunk(void)
{
	long t1;

	C2_W_COPY_NOTE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3818), MK_FP(SEG_DATA, -0x2840));
	return;
}
