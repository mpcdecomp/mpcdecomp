#include "mpc2kxl.h"

extern char C0_B_09604;

void __far far_52C04(void)
{
	C0_B_09604 &= 0xfc;
	C2_B_09606 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69];
	far_52C28();
}
