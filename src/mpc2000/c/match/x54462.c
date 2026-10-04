#include "mpc2kxl.h"

extern char C2_W_055F6[1];

void __far fx_reverb_field4_thunk(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7);
	if (*v0 <= 3) {
		C2_W_FX_REVERB_CURSOR = 4;
		((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_055F6, v0 + 4);
		return;
	}
	fx_reverb_field1_thunk();
}
