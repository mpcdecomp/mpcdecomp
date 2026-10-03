#include "mpc2kxl.h"

void __far L_528D4(void)
{
	C2_B_09604 &= 0xfc;
	C2_B_09606 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69];
	((int (__far *)(void))*(long *)(((char *)&C2_W_04804) + C2_W_DIST_RINGMOD_CURSOR * 42))();
	((void (__far *)(void))disp_request_flush)();
}
