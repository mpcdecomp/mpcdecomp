#include "mpc2k.h"
#include <conio.h>

int __far mpc_config_rate(void)
{
	register unsigned v;

	PUSHF();
	_disable();
	outp(ASIC_DMA_C031, 2);
	v = inpw(ASIC_DMA_ADDR);
	POPF();
	return (v - (FP_SEG(BUF_XFER) << 4) - (unsigned)BUF_XFER) >> 1;
}
