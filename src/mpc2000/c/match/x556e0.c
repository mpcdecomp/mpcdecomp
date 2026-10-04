#include "mpc2kxl.h"

void __far smem_dma_channel_01(unsigned char p0)
{
	if (p0 >= 2) goto br_55708;
	lcd_clear_region_impl(p0, ((char __far * (__far *)(int))pgm_fx_section_ptr)(p0)[69]);
br_55708:
	;
}
