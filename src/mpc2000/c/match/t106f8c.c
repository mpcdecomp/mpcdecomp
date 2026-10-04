#include "mpc2k.h"
#include <conio.h>

int __near dma_06F0C(void)
{
	int m;
	int v;

	m = TBL_2E30[G_REC_MODE];
	if (inpw(DMA_STATUS) & 0x60) outpw(DMA_STATUS, 0x80);
	mpc_poll_data(0xc);
	outp(ASIC_DMA_C031, 2);
	smem_poll_ready(FP_SEG(BUF_XFER), (unsigned)BUF_XFER);
	outpw(ASIC_DMA_COUNT, 0x3ff);
	outp(ASIC_DMA_C03A, 0x55);
	if (SAMPLE_INPUT) {
		v = port_c0_read() & 0xffa7 | 0x24;
		port_c0_write(v);
		timer_loop_io();
		v = m |= v;
		delay_ticks(0x14);
		if (L_00106()) {
			P_9D40 = 0;
			return 0;
		}
	} else {
		far_000DE();
		v = port_c0_read() & 0xffe3;
		port_c0_write(v);
		v = m |= v;
	}
	mpc_poll_data2(4);
	port_c0_write(v);
	P_9D40 = 1;
	return 1;
}
