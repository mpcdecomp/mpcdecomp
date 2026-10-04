#include "mpc2k.h"
#include <conio.h>

void __far L_0162A(void)
{
	int si_;

	si_ = 0;
dma_0162D:
	dma_field_write(si_, P_05E4, DSPV_ALL_FIELDS);
	si_++;
	if (si_ < 0x20) goto dma_0162D;
	outpw(DMA_STATUS, 0);
lcd_write_cmd_CE04:
	if (inp(DMA_STATUS) & 0x80) goto lcd_write_cmd_CE04;
	L_01610();
}
