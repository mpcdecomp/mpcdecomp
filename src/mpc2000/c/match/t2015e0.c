#include "mpc2k.h"
#include <conio.h>

int __far __fastcall dma_01600(int a0)
{
	G_DMA_STATUS2_SHADOW = a0;
	outpw(DMA_STATUS2, a0);
	return a0;
}
