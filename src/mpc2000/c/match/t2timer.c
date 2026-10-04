/* MPC2000 SYS text2: ASIC register-window block transfers and the
 * pending-operation mask (../2k/common/sys/text2.asm). */

#include "mpc2k.h"
#include <conio.h>

void L_01A0C(void)
{
	lcd_write_data((*(unsigned char *)&G_DSP_CHAN) ? 8 : 1, (*(unsigned char *)&G_DSP_CHAN) << 13, 0x2000);
}

void timer_system(void)
{
	unsigned char t[4];
	unsigned c;

	t[0] = 0x20;
	t[1] = 4;
	t[2] = 0x10;
	t[3] = 2;
	c = (*(unsigned char *)&G_DSP_CHAN);
	lcd_write_data(t[c], (c + 4) << 12, 0x1000);
}

void __pascal pending_ops_set(char mask)
{
	G_PENDING_DMA_MASK = mask;
}

/* The pending-operation interrupt: each set bit is a channel's DMA. */
void __interrupt __far L_01A70(void)
{
	_enable();
	if (G_PENDING_DMA_MASK && P_0610) {
		dma_018ee();
		if (G_PENDING_DMA_MASK & 1)
			smem_dma_channel_01(0);
		if (G_PENDING_DMA_MASK & 2)
			smem_dma_channel_01(1);
		if (G_PENDING_DMA_MASK & 4)
			smem_dma_channel_23(2);
		if (G_PENDING_DMA_MASK & 8) {
			smem_dma_channel_23(3);
#if FW_VERSION == 172
		}
		G_PENDING_DMA_MASK = 0;
#else
		}
#endif
	}
}

void fx_dsp_reload_all(void)
{
	dma_018ee();
	smem_dma_channel_01(0);
	smem_dma_channel_01(1);
	smem_dma_channel_23(2);
	smem_dma_channel_23(3);
}
