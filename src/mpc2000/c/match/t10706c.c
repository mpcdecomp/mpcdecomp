#include "mpc2k.h"
#include <conio.h>

void __near dma_06FEC(void)
{
	if (inp(0xc03f) & 8) goto L_07007;
	mpc_poll_status();
	W_9D3C = X_0184A(0);
L_07007:
	if (!((char)inpw(0x88) & 0x60)) goto br_0702E;
	outp(0xc031, 3);
	outp(0xc03a, inp(0xc03a) & 0xe3);
dma_0701C:
	if (!(inp(0xc03b) & 8)) goto dma_0701C;
	outpw(0x88, 0);
dma_07028:
	if (inp(0x88) & 0x80) goto dma_07028;
br_0702E:
	;
}
