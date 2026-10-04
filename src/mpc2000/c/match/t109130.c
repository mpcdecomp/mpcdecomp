#include "mpc2k.h"

int __near __pascal lcd_ratio_calc(int v)
{
	int d;
	int r;

	d = v / 256;
	r = v % 256;
	if (d > 12) return 120;
	if (d < -12) return -120;
	r *= 100;
	r = r > 0 ? r + 128 : r - 128;
	r /= 256;
	r = r > 0 ? r + 5 : r - 5;
	r /= 10;
	d *= 10;
	return r + d;
}
