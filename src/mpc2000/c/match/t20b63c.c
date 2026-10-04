#include "mpc2k.h"

void __far __pascal sample_io_handler(long p3, long p1, int p0)
{
	int si_;

	si_ = p0;
	if (((int (__far *)(long, int))int2F_call_fn6)(p1, si_) == si_) goto br_0BA9E;
	((void (__far *)(long, int))_longjmp)(p3, 4);
br_0BA9E:
	;
}
