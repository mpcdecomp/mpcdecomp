#include "mpc2k.h"

#if FW_VERSION == 150
#include <conio.h>

int __far L_01872(void)
{
	unsigned bx_;

	bx_ = 0;
L_0188C:
	outpw(DMA_CTRL, bx_ | 0xa00);
	outpw(DMA_DATA_LO, 0);
	bx_++;
	if (bx_ < 0x20) goto L_0188C;
	return 0;
}
#else
#include <conio.h>

int __far L_01872(void)
{
	unsigned bx_;

	bx_ = 0;
L_01874:
	outpw(DMA_CTRL, bx_ | 0xa00);
	outpw(DMA_DATA_HI, 0);
	outpw(DMA_DATA_LO, 0);
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto L_01874;
	bx_ = 1;
L_0188C:
	outpw(DMA_CTRL, bx_ | 0xa00);
	outpw(DMA_DATA_HI, -0x8000);
	outpw(DMA_DATA_LO, 0);
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto L_0188C;
	return 0;
}
#endif
