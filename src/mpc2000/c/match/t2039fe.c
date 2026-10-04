#include "mpc2k.h"

void __far __pascal timer_value_read_5(int p2, long p0)
{
	if (*(int *)&p0 <= 0) goto br_03AA8;
	if (*(int *)&p0 >= 0x2710) goto br_03AA8;
	((void (__far __pascal *)(int, long, int))ratio_calc_divide)(p2, p0, 4);
	return;
br_03AA8:
	((void (__far __pascal *)(int, int, char __far *))cmd_dispatch_1E)(p2, ((int *)&p0)[1], STR_BLANK_VALUE);
}
