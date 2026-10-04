#include "mpc2k.h"
#include <conio.h>

void __far dma_status_rearm(void)
{
	outpw(DMA_STATUS, inpw(DMA_STATUS) & 0xff7f | 0x100);
}
