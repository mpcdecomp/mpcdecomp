#include "mpc2kxl.h"

void __far __fastcall __loadds mixer_setup_f3(void)
{
	C2_B_PAD_DRUM = 2;
	far_50EE2();
}
