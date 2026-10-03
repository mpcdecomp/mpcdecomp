#include "mpc2k.h"

void __far __pascal voice_buf_helper_2(int p0)
{
	int bx_;

	if (p0 != 0x10) goto X_02120;
	bx_ = 0;
loop_02113:
	P_9A4E[bx_] &= 0xfd;
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto loop_02113;
X_02120:
	;
}
