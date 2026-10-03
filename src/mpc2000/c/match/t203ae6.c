#include "mpc2k.h"

void __far __fastcall __loadds show_dev_credits_scroll(int a0)
{
	int l2;
	int si_;
	int di_;

	l2 = 1;
	if ((unsigned)(a0 - CREDITS_SCROLL_TICK) <= 0x1f4) goto L_03C2B;
	CREDITS_SCROLL_TICK = a0;
	CREDITS_SCROLL_PHASE--;
	if (CREDITS_SCROLL_PHASE) goto br_03BAD;
	CREDITS_SCROLL_PHASE = 9;
	CREDITS_SCROLL_LINE++;
	if (CREDITS_SCROLL_LINE <= 0x1d) goto br_03BAD;
	CREDITS_SCROLL_LINE = 0;
br_03BAD:
	disp_list_run(&l2);
	di_ = 0;
	if ((CREDITS_SCROLL_PHASE > 6 ? 5 : 6) <= 0) goto br_03C06;
	si_ = 0;
loop_03BCF:
	((void (__far __pascal *)(int, unsigned, long))cmd_dispatch_1E)(1, CREDITS_SCROLL_PHASE + si_ + 1, ((long *)CREDITS_TABLE)[CREDITS_SCROLL_LINE + di_]);
	si_ += 9;
	di_++;
	if ((CREDITS_SCROLL_PHASE > 6 ? 5 : 6) > di_) goto loop_03BCF;
br_03C06:
	cmd_build_params(0x13, 0, 0, 0xf8, 8);
	cmd_build_params(0x13, 0, 0x34, 0xf8, 8);
	cmd_far_stub2();
L_03C2B:
	;
}
