#include "mpc2k.h"

void __far __pascal far_01F00(int x0)
{
	unsigned si_;

	si_ = 0;
loop_01F07:
	if (!*(int __near *)(char __near *)((char *)((char *)VOICE_TIMER) + si_ * 2)) goto br_01F12;
	voice_release(si_);
br_01F12:
	si_++;
	if (si_ < 0x20) goto loop_01F07;
	far_01D98();
}
