#include "mpc2kxl.h"
#include <conio.h>

int __far far_3E59A(void)
{
	int bx_;

	bx_ = 0;
loop_3E59C:
	outpw(DMA_CTRL, bx_ | 0xa00);
	outpw(DMA_DATA_LO, 3);
	outpw(DMA_DATA_HI, 0);
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto loop_3E59C;
	bx_ = 1;
loop_3E5B7:
	outpw(DMA_CTRL, bx_ | 0xa00);
	outpw(DMA_DATA_LO, 3);
	outpw(DMA_DATA_HI, -0x8000);
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto loop_3E5B7;
	return -0x8000;
}
