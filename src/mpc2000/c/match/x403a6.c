#include "mpc2kxl.h"

void __far far_403A6(char far *p0, long p2, long p4)
{
	((void (__far *)(long, int, long))far_3E32A)(*(long far *)(p0 + 10) + p2, 0, p4);
	if (!p0[37]) goto br_4040E;
	((void (__far *)(long, int, long))far_3E32A)(*(long far *)(p0 + 14) / 2L + *(long far *)(p0 + 10) + p2, 0, p4);
br_4040E:
	;
}
