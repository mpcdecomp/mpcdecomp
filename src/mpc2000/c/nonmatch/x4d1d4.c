#include "mpc2kxl.h"

long __far far_4D1D4(void)
{
	C2_W_TS_CURSOR = 5;
	return ui_field_engine(MK_FP(SEG_DATA, 0x275e), MK_FP(SEG_DATA, 0x2602));
}
