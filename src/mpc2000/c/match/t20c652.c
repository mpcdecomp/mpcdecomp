#include "mpc2k.h"

#define bcd_display_calc ((int (__far __pascal *)(void __far *, int))bcd_display_calc)

int __far __pascal ctrl_port_48_B8_3(char __far *p)
{
	int b;
	int a;
	char __far *q;
	unsigned i;

	a = 0x40;
	b = 0x19;
	if (bcd_display_calc(&a, 2) && bcd_display_calc(&b, 2)) {
		for (i = 0, q = p + 0x22; i < 0x40; i++, q += 0x1d)
			if (!bcd_display_calc(q, b)) return 0;
		return 1;
	}
	return 0;
}
