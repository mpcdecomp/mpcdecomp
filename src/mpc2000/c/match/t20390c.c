#include "mpc2k.h"

void __far __pascal timer_value_read_3(char p2, int p1, int p0)
{
	int si_;
	int di_;

	di_ = p1;
	si_ = p0;
	((void (__far __pascal *)(char, int, int))timer_value_read_2)(p2, di_, si_);
	((void (__far __pascal *)(int, int, int))cmd_ratio_setup)(di_ + 0xc, si_, 0x2f);
	cmd_dispatch_wrapper(timer_io_setup(p2), di_ + 0x12, si_);
}
