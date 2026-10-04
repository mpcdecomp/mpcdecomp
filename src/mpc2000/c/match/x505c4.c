#include "mpc2kxl.h"

extern char C2_W_03C10[1];

void __far velo_pitch_field1_thunk(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x5c) + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a;
	C2_W_VELO_PITCH_CURSOR = 1;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_03C10, v0 + 8);
}
