#include "mpc2kxl.h"
#include <conio.h>

int __far asic_reg1_bank_clear(void)
{
	int bx_;

	bx_ = 0;
loop_5544C:
	outpw(0xa2, bx_ | 0x100);
	outpw(0xa0, 0);
	bx_++;
	if (bx_ < 0x20) goto loop_5544C;
	return 0;
}
