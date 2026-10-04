#include "mpc2kxl.h"

void __far auto_chromatic_field2_thunk(void)
{
	long t1;
	long t2;

	C2_W_AUTO_CHROMATIC_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3dfc), (unsigned char far *)C2_W_08D84);
	t2 = handler_install_one(55, 0x29a2, 0x4e16);
	return;
}
