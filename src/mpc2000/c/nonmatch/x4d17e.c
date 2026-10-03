#include "mpc2kxl.h"

long __far far_4D17E(void)
{
	C2_W_TS_CURSOR = 2;
	return ui_field_engine(MK_FP(SEG_DATA, 0x26e0), MK_FP(SEG_DATA, -0x7035));
}
