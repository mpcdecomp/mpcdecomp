#include "mpc2kxl.h"

extern char C2_W_03972[1];

void __far velocity_mod_field2_thunk(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x5c) + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a;
	C2_W_VELOCITY_MOD_CURSOR = 2;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_03972, v0 + 0x14);
}
