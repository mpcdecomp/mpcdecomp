#include "mpc2kxl.h"

void __far far_53C64(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7);
	if (C2_B_FX_MOD_TYPE <= 2) {
		v0[22] = 0;
		v0[23] = C2_B_FX_MOD_TYPE;
	} else {
		v0[22] = C2_B_FX_MOD_TYPE - 2;
	}
	fx_section_field_notify();
	far_53236();
}
