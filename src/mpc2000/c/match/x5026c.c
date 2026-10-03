#include "mpc2kxl.h"

extern char C2_W_03ACC[1];

void __far velo_env_filter_field2_thunk(void)
{
	char far *v0;

	v0 = ((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x5c) + 0x18 * (unsigned char)C2_B_PAD_NOTE - 0x32a;
	C2_W_VELO_ENV_FILTER_CURSOR = 2;
	((void (__far *)(char __far *, char __far *))ui_field_engine)(C2_W_03ACC, v0 + 0x10);
}
