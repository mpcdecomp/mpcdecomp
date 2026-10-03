#include "mpc2kxl.h"

void __far L_540DC(void)
{
	if (((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7)[48] < 3) {
		fx_delay_field1_thunk();
		return;
	}
	fx_delay_field5_thunk();
}
