#include "mpc2k.h"

void __near __pascal status_poll_delay2(long p1, int p0)
{
	int si_;

	si_ = p0;
	if (((int (__far *)(long, int))int2F_call_fn6)(p1, si_) == si_) goto br_0A512;
	_longjmp(P_9D42, 2);
br_0A512:
	;
}
