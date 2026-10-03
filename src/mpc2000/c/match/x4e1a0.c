#include "mpc2kxl.h"

void __far PGM_ASSIGN_FOCUS_PGM(void)
{
	long t1;

	C2_W_PGM_ASSIGN_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2cb8), MK_FP(SEG_DATA, -0x283f));
	return;
}
