#include "mpc2k.h"

void __far __pascal smem_dma_channel_01(unsigned char p0)
{
	if (p0 >= 2) goto lcd_clear_region_impl_D2DC;
	lcd_clear_region_impl(p0, ((char __far * (__far *)(int))channel_validate)(p0)[69]);
lcd_clear_region_impl_D2DC:
	;
}
