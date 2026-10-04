#include "mpc2kxl.h"

void __far L_547A0(void)
{
	if (!C2_FP_08DA0) goto br_547C6;
	C2_FP_08DA0[2] = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[69];
br_547C6:
	((int (__far *)(void))*(long *)(((char *)&C2_W_05726) + C2_W_MIXER_CURSOR * 42))();
	((void (__far *)(void))disp_request_flush)();
}
