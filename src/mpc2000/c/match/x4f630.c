#include "mpc2kxl.h"

void __far far_3F46E(char far *);

void __far __fastcall __loadds init_pad_assign_f5(void)
{
	far_3F46E(((char __far * (__far *)(int))ivt_get_vector)((*(unsigned char *)&C2_B_PAD_DRUM) + 0x60));
	init_pad_assign_open();
}
