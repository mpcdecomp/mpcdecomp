#include "mpc2kxl.h"

void __far pgm_assign_focus_note(void)
{
	long t1;

	C2_W_PGM_ASSIGN_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2d36), MK_FP(SEG_DATA, -0x2840));
	return;
}
