#include "mpc2kxl.h"

extern char C1_B_0D7BF;

void __far __fastcall __loadds far_4F2A4(void)
{
	int si_;

	si_ = 0;
loop_4F2AD:
	pgm_delete_slot(si_);
	si_++;
	if (si_ <= 0x17) goto loop_4F2AD;
	C1_B_0D7BF = 0;
	far_4F296();
}
