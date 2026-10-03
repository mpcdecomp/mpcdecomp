#include "mpc2k.h"

int __far __setjmp(char far *);

void __far __pascal lcd_clear_rect(unsigned char p1, char p0)
{
	if (p1 >= 4) goto br_01BED;
	G_PENDING_DMA_MASK &= ~(1 << p1);
	if (__setjmp(P_89F8)) goto br_01BED;
	G_DSP_CHAN = p1;
	B_8972 = p0;
	if (p0 & 2) goto br_01BE8;
	if (!(B_8972 & 1)) {
		lcd_write_block_D3B2();
		return;
	}
br_01BE8:
	L_01D18();
br_01BED:
	;
}
