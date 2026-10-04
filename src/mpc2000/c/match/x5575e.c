#include "mpc2kxl.h"

void __far smem_dma_channel_23(unsigned char p0)
{
	if (p0 >= 4) goto br_55786;
	lcd_clear_rect(p0, ((char __far * (__far *)(int))pgm_fx_reverb_ptr)(p0)[1]);
br_55786:
	;
}
