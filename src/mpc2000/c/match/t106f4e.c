#include "mpc2k.h"

void __near fn_06ECE(void)
{
	int si_;

	X_01806(0x15);
	X_01806(0x17);
	si_ = 1;
loop_06EE2:
	X_01806(si_);
	si_++;
	if (si_ <= 8) goto loop_06EE2;
}
