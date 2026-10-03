#include "mpc2kxl.h"

long __far far_4D166(void)
{
	C2_W_TS_CURSOR = 1;
	return ui_field_engine(MK_FP(SEG_DATA, 0x26b6), (unsigned char far *)C2_W_08D4E);
}
