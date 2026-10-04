#include "mpc2kxl.h"

void __near fn_3CED6(int p0, int p1, char far *p2)
{
	int l2;
	int l4;

	draw_erase_rect(p0, p1, 0x1e, 0xe);
	l2 = p0 + 1;
	draw_hline(p0 + 1, p1, 0x1b);
	draw_hline(l2, p1 + 0xc, 0x1c);
	draw_hline(p0 + 2, p1 + 0xd, 0x1b);
	l4 = p1 + 1;
	draw_vline(p0, p1 + 1, 0xb);
	draw_vline(p0 + 0x1c, l4, 0xb);
	draw_vline(p0 + 0x1d, p1 + 2, 0xb);
	draw_string_at(p0 + 3, p1 + 3, p2);
}
