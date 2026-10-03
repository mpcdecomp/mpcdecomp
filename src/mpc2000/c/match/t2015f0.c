#include "mpc2k.h"
#include <conio.h>

int __far L_01610(void)
{
	int bx_;

	bx_ = 0;
X_01612:
	outpw(0x80, bx_ | 0xa00);
	outpw(0x82, 3);
	outpw(0x84, 0);
	bx_++;
	if (bx_ < 0x20) goto X_01612;
	return 0;
}
