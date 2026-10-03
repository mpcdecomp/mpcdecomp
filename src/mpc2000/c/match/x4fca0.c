#include "mpc2kxl.h"

void __far copy_note_field0_thunk(void)
{
	long t1;

	C2_W_COPY_NOTE_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x37ee), MK_FP(SEG_DATA, -0x6748));
	return;
}
