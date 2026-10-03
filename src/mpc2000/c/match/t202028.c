#include "mpc2k.h"

#pragma intrinsic(memset)

int __far X_020AE(void)
{
	int bx_;
	int cx_;

	bx_ = VOICE_TABLE;
	cx_ = 0x20;
L_020B5:
	((char __near *)bx_)[0] = 0xff;
	bx_ = bx_ + 0x12;
	cx_--;
	if (cx_) goto L_020B5;
	memset(((char *)VOICE_HOLD), 0, 0x100);
	memset(P_9A4E, 0, 0x20);
	if (!B_87E6) goto br_020E2;
	P_9A4E[0] |= 1;
	P_9A5E |= 1;
br_020E2:
	return 0;
}
