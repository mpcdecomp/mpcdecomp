#include "mpc2k.h"

void __far __pascal cmd_exec_1E_ext(int p0)
{
	int cx_;

	cx_ = p0;
	if (cx_ >= -0xd) goto br_057D2;
	cx_ = -0xd;
br_057D2:
	if (cx_ <= 2) goto br_057DA;
	cx_ = 2;
br_057DA:
	(*(char *)P_9D89) = (char)cx_;
	dma_01600(cx_ + 0xd);
}
