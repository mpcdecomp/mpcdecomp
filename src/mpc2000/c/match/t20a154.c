#include "mpc2k.h"

void __far __pascal range_proc_setup(int p0)
{
	int si_;

	si_ = p0;
	if (!si_) goto br_0A557;
loop_0A54B:
	if (int2F_call_fn5() < 0) goto br_0A557;
	si_--;
	if (si_) goto loop_0A54B;
br_0A557:
	;
}
