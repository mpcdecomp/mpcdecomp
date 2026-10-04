#include "mpc2k.h"
#include <conio.h>

int __far asic_reg1_bank_clear(void)
{
	int bx_;

	bx_ = 0;
L_018D2:
	outpw(ASIC_REG, bx_ | 0x100);
	outpw(ASIC_DATA, 0);
	bx_++;
	if (bx_ < 0x20) goto L_018D2;
	return 0;
}
