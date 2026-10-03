#include "mpc2kxl.h"

void __far L_54130(void)
{
	C2_B_09604 &= 0xfc;
	C2_B_09606 = C0_B_0D7C7 >= 2 ? ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7)[1] : ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69];
	far_54172();
}
