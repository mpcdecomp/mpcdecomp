#include "mpc2kxl.h"

void __far draw_signed_value(int p0, int p1, long p2, int p4)
{
	int l2;

	l2 = 0x20;
	if (((int *)&p2)[1] >= 0) goto br_3EB9C;
	p2 = -p2;
	l2 = 0x2d;
br_3EB9C:
	draw_char_at(p0, p1, l2);
	draw_unsigned_value(p0 + 6, p1, p2, p4);
}
