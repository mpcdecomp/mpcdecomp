#include "mpc2k.h"

void __far __pascal timer_value_read_2(char p2, long p0)
{
	if ((unsigned)(p2 - 0x23) <= 0x3f) {
		((void (__far __pascal *)(long, long, int))draw_unsigned_value)(p0, (long)p2, 2);
		return;
	}
	((void (__far __pascal *)(long, char __far *))cmd_dispatch_1E)(p0, STR_DOUBLE_DASH);
}
