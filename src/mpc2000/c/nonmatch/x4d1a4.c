#include "mpc2kxl.h"

long __far far_4D1A4(void)
{
	C2_W_TS_CURSOR = 3;
	return ui_field_engine(MK_FP(SEG_DATA, 0x270a), MK_FP(SEG_DATA, -0x2822));
}
