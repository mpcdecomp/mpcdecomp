#include "mpc2kxl.h"

extern char C2_W_03C3A[1];

void __far far_4FCA0(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x5c) + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a;
	C2_W_VELO_PITCH_CURSOR = 2;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_03C3A, v0 + 0x17);
}
