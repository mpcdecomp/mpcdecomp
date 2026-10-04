#include "mpc2kxl.h"

long __far far_42A32(long p0)
{
	int si_;
	int v0;

	if (!(far_3E884(p0) + 1)) {
		v0 = ((int (__far *)(void))disk_last_error)();
		si_ = v0;
	} else {
		si_ = 0;
	}
	return fs_error_msg(si_);
}
