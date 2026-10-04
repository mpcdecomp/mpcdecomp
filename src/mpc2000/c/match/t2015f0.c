#include "mpc2k.h"
#include <conio.h>

int __far L_01610(void)
{
	int bx_;

	bx_ = 0;
X_01612:
	outpw(DMA_CTRL, bx_ | 0xa00);
	outpw(DMA_DATA_LO, 3);
	outpw(DMA_DATA_HI, 0);
	bx_++;
	if (bx_ < 0x20) goto X_01612;
	return 0;
}
