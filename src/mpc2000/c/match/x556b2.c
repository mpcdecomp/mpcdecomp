#include "mpc2kxl.h"

void __far fx_dsp_reload_all(void)
{
	far_5545E();
	smem_dma_channel_01(0);
	smem_dma_channel_01(1);
	smem_dma_channel_23(2);
	smem_dma_channel_23(3);
}
