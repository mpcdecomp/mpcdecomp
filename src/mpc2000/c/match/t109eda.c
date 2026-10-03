#include "mpc2k.h"

void __far __pascal seq_next_track(long p0)
{
	if (!*(char far * far *)(*(char far * far *)((*(char __far **)&PTR_SEQ_LIST_HEAD) + 44) + 44)) goto X_0A16A;
	(*(char __far **)&PTR_SEQ_LIST_HEAD) = *(char far * far *)((*(char __far **)&PTR_SEQ_LIST_HEAD) + 44);
X_0A16A:
	seq_common_handler(p0);
}
