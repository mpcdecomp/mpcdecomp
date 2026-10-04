#include "mpc2k.h"

void __far __pascal voice_process_setup(char k)
{
	char __far *p;

	if (G_STATE_9D8B < FX_MULTI_COUNT) p = (char __far *)channel_validate(G_STATE_9D8B) + 0x45;
	else p = (char __far *)channel_get_ptr(G_STATE_9D8B) + 1;
	*p ^= k;
	if (G_STATE_9D8B >= FX_MULTI_COUNT) smem_dma_channel_23(G_STATE_9D8B);
	else smem_dma_channel_01(G_STATE_9D8B);
}
