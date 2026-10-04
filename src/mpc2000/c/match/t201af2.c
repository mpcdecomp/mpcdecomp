#include "mpc2k.h"

void __far __pascal smem_dma_channel_23(unsigned char p0)
{
	if (p0 >= 4) goto lcd_clear_rect_D35E;
	lcd_clear_rect(p0, ((char __far * (__far *)(int))channel_get_ptr)(p0)[1]);
lcd_clear_rect_D35E:
	;
}
