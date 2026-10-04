#include "mpc2kxl.h"

long __far fs_close(void)
{
	int si_;
	int v0;

	if (!(((int (__far *)(void))L_37E7C)() + 1)) {
		v0 = ((int (__far *)(void))disk_last_error)();
		si_ = v0;
	} else {
		si_ = 0;
	}
	return fs_error_msg(si_);
}
