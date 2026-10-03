#include "mpc2kxl.h"

extern char C2_W_0564A[1];

void __far fx_reverb_field6_thunk(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7);
	if (*v0 <= 3) {
		C2_W_FX_REVERB_CURSOR = 6;
		((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_0564A, v0 + 6);
		return;
	}
	fx_reverb_field3_thunk();
}
