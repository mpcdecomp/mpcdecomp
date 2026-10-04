#include "mpc2k.h"

void __near fn_06EF2(void)
{
	fn_06ECE();
	delay_ticks(0x32);
	if (!P_9D40) goto br_06F0A;
	dma_06FEC();
	fn_06FB2();
br_06F0A:
	;
}
