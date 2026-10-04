#include "mpc2kxl.h"

void __far auto_chromatic_field3_thunk(void)
{
	long t1;
	long t2;

	C2_W_AUTO_CHROMATIC_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3e26), (unsigned char far *)C2_W_08D82);
	t2 = handler_install_one(55, 0x29a2, 0x4e16);
	return;
}
