#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_f6(void)
{
	char far *v0;
	char far *v1;

	if (C0_B_0D7C7 >= 2) {
		v0 = ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(C0_B_0D7C7);
		v0[1] ^= C2_B_08D90;
		((void (__far *)(char))far_5575E)(C0_B_0D7C7);
		return;
	}
	v1 = ((char __far * (__far *)(int))pgm_fx_section_ptr)(C0_B_0D7C7);
	v1[69] ^= C2_B_08D90;
	((void (__far *)(char))far_556E0)(C0_B_0D7C7);
}
