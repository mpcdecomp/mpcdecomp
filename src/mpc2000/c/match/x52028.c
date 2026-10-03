#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_drum_2(void)
{
	mixer_refresh();
	C2_B_PAD_DRUM = 1;
	far_50EE2();
}
