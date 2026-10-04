#include "mpc2kxl.h"

void __far mute_assign_field0_thunk(void)
{
	long t1;

	C2_W_MUTE_ASSIGN_CURSOR = 0;
	t1 = ui_field_engine((unsigned char far *)MUTE_FIELDS, MK_FP(SEG_DATA, -0x2840));
	return;
}
