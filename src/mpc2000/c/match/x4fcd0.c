#include "mpc2kxl.h"

void __far copy_note_field2_thunk(void)
{
	long t1;

	C2_W_COPY_NOTE_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3842), MK_FP(SEG_DATA, -0x6747));
	return;
}
