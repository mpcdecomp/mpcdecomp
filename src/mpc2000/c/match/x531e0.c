#include "mpc2kxl.h"

void __far far_531E0(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7);
	C2_B_09604 &= 0xfc;
	C2_B_09606 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69];
	C2_B_FX_MOD_TYPE = !v0[22] ? v0[23] : v0[22] + 2;
	far_53236();
}
