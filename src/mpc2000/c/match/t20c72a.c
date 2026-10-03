#include "mpc2k.h"

#define bcd_display_calc ((int (__far __pascal *)(void __far *, int))bcd_display_calc)

int __far __pascal envelope_process_2(char __far *p)
{
	unsigned d, a, b, c;

	a = 0x48;
	b = 4;
	c = 0xc;
	if (bcd_display_calc(&d, d = 2) && bcd_display_calc(&a, 2) && bcd_display_calc(p + 0x91e, d * a)
	    && bcd_display_calc(&b, 2) && bcd_display_calc(&c, 2) && bcd_display_calc(p + 0x9ae, c * b)) return 1;
	return 0;
}
