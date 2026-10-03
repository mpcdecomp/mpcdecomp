#include "mpc2k.h"

int __far __setjmp(char far *);

void __far __pascal lcd_clear_region_impl(unsigned char p1, char p0)
{
	if (p1 >= 2) goto br_01B68;
	G_PENDING_DMA_MASK &= ~(1 << p1);
	if (__setjmp(P_89F8)) goto br_01B68;
	G_DSP_CHAN = p1;
	B_8972 = p0;
	if (p0 & 1) {
		dsp_chan_reg_clear();
		return;
	}
	far_01B6C();
	lcd_write_block_D3B2();
br_01B68:
	;
}
