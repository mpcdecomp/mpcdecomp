#include "mpc2k.h"
#include <conio.h>

void __far dma_status_rearm(void)
{
	outpw(0x88, inpw(0x88) & 0xff7f | 0x100);
}
