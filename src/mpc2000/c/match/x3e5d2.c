#include "mpc2kxl.h"
#include <conio.h>
extern char C1_W_00418[1];

void __far dma_0162d(void)
{
	int si_;

	si_ = 0;
loop_3E5D5:
	((void (__far *)(int, char __far *, int))dma_field_write)(si_, C1_W_00418, 0x7fff);
	si_++;
	if (si_ < 0x20) goto loop_3E5D5;
	outpw(DMA_STATUS, 0);
L_3DCBF:
	if (inp(DMA_STATUS) & 0x80) goto L_3DCBF;
	((void (__far *)(void))far_3E59A)();
}
