#include "mpc2k.h"

/* a program's number and name in the list at (x, y) */
void __far __pascal sequence_get_info(int n, int x, int y)
{
	struct PGM __far *p;

	p = ((struct PGM __far * __near *)PGM_TABLE)[n];
	draw_unsigned_value(x, y, (long)(n + 1), 2);
	cmd_ratio_setup(x + 0xc, y, '-');
	((void (__far __pascal *)())cmd_dispatch_1E)(x + 0x12, y, p->blk_para != PGM_BLK_FREE ? p->name : (char __far *)STR_NO_PROGRAM);
}
