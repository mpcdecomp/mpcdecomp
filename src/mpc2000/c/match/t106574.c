#include "mpc2k.h"

void __near L_064F4(void)
{
	if ((*(char *)&PROGRAM_CURSOR)) {
		((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, int, int))timer_dma_ch2)(((char __far *)PGM_CURRENT) + 0x1c, 0, 0x7f, 3, 0xa9, 0x25, 0, 0, 0, 0);
		far_02DD2();
		X_02D4A();
		return;
	}
	far_call_wrapper_1(((char __far *)PGM_CURRENT) + 2, 0x73, 0x13);
}
