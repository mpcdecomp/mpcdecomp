#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_f1(void)
{
	mixer_refresh();
	C2_B_PAD_DRUM = 0;
	far_50EE2();
}
