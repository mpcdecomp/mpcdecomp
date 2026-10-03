#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_setup_f1(void)
{
	C2_B_PAD_DRUM = 0;
	far_50EE2();
}
