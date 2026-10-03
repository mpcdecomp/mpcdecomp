#include "mpc2k.h"
#include <conio.h>

int __far L_018D0(void)
{
	int bx_;

	bx_ = 0;
L_018D2:
	outpw(0xa2, bx_ | 0x100);
	outpw(0xa0, 0);
	bx_++;
	if (bx_ < 0x20) goto L_018D2;
	return 0;
}
