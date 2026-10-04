#include "mpc2k.h"
#include <conio.h>

long __far __fastcall X_0184A(int reg)
{
	outpw(DMA_CTRL, reg);
	return (unsigned)inpw(DMA_DATA_LO) >> 12 | ((unsigned long)inpw(DMA_ADDR_HI) << 16 | inpw(DMA_DATA_HI)) << 4;
}
