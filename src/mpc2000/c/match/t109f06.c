#include "mpc2k.h"

void __far __pascal seq_prev_track(long p0)
{
	if (!*(char far * far *)(*(char far * far *)((*(char __far **)&PTR_SEQ_LIST_HEAD) + 40) + 40)) goto br_0A196;
	(*(char __far **)&PTR_SEQ_LIST_HEAD) = *(char far * far *)((*(char __far **)&PTR_SEQ_LIST_HEAD) + 40);
br_0A196:
	seq_common_handler(p0);
}
