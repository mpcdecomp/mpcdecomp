#include "mpc2k.h"

#if FW_VERSION == 150
#include <conio.h>

int __far L_01872(void)
{
	unsigned bx_;

	bx_ = 0;
L_0188C:
	outpw(0x80, bx_ | 0xa00);
	outpw(0x82, 0);
	bx_++;
	if (bx_ < 0x20) goto L_0188C;
	return 0;
}
#else
#include <conio.h>

int __far L_01872(void)
{
	unsigned bx_;

	bx_ = 0;
L_01874:
	outpw(0x80, bx_ | 0xa00);
	outpw(0x84, 0);
	outpw(0x82, 0);
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto L_01874;
	bx_ = 1;
L_0188C:
	outpw(0x80, bx_ | 0xa00);
	outpw(0x84, -0x8000);
	outpw(0x82, 0);
	bx_ = bx_ + 2;
	if (bx_ < 0x20) goto L_0188C;
	return 0;
}
#endif
