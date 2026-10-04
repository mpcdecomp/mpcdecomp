#include "mpc2k.h"
#include <conio.h>

void __near dma_06FEC(void)
{
	if (inp(ASIC_DMA_C03F) & 8) goto L_07007;
	mpc_poll_status();
	W_9D3C = X_0184A(0);
L_07007:
	if (!((char)inpw(DMA_STATUS) & 0x60)) goto br_0702E;
	outp(ASIC_DMA_C031, 3);
	outp(ASIC_DMA_C03A, inp(ASIC_DMA_C03A) & 0xe3);
dma_0701C:
	if (!(inp(ASIC_DMA_STATUS) & 8)) goto dma_0701C;
	outpw(DMA_STATUS, 0);
dma_07028:
	if (inp(DMA_STATUS) & 0x80) goto dma_07028;
br_0702E:
	;
}
