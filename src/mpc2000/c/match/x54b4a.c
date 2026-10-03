#include "mpc2kxl.h"

extern char C2_TBL_05908[1];

void __far L_54B4A(void)
{
	if (!C2_FP_08DAA) goto br_54B70;
	C2_FP_08DAA[2] = ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7)[1];
br_54B70:
	((int (__far *)(void))*(long *)(C2_TBL_05908 + C2_W_MIXER_CURSOR * 42))();
	((void (__far *)(void))disp_request_flush)();
}
