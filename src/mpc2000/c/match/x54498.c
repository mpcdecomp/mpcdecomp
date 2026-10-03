#include "mpc2kxl.h"

extern char C2_W_05620[1];

void __far fx_reverb_field5_thunk(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7);
	if (*v0 <= 3) {
		C2_W_FX_REVERB_CURSOR = 5;
		((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_05620, v0 + 5);
		return;
	}
	fx_reverb_field2_thunk();
}
