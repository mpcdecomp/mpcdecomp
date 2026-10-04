#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_select_pgm_setup(void)
{
	long t1;

	if (C2_W_DRUM_SELECT_HOOK_OFF != 0x2d82) {
		goto L1;
	}
	if (C2_W_DRUM_SELECT_HOOK_SEG != 0x4e16 /* C2_SEG */) {
		goto L1;
	}
	t1 = fx_not_installed_f5();
L1:
	return;
}
