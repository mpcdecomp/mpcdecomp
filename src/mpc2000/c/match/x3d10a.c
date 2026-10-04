#include "mpc2kxl.h"

void __far L_3D10A(int p0)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7);
	*(int far *)(v0 + 40) = ((int (__near *)(int))voice_ratio_calc)(p0);
	fx_section_field_notify();
}
