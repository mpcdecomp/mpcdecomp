#include "mpc2k.h"

#pragma intrinsic(outpw)

int __far __pascal voice_timer_expire(int v)
{
	if (v < 0x20) {
		outpw(DMA_CTRL, v | 0x400);
		outpw(DMA_DATA_LO, *(int *)(P_9A7A + v * 0x12));
		outpw(DMA_DATA_HI, 0x8000);
	} else if (v < 0x40)
		voice_release(v - 0x20);
	else if (v < 0x60) {
		v -= 0x40;
		outpw(DMA_CTRL, v | 0x600);
		outpw(DMA_DATA_LO, *(int *)(P_9A7C + v * 0x12));
		outpw(DMA_DATA_HI, *(int *)(P_9A7E + v * 0x12));
	} else
		voice_release_full(v - 0x60);
}
