#include "mpc2kxl.h"

void __far pad_bank_b(void)
{
	A0_B_PAD_BANK = (char)16;
	return;
}
