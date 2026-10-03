#include "mpc2k.h"
#include <conio.h>

int __near dsp_0292A(void)
{
	int bx_;
	unsigned cx_;

	cx_ = 0x100;
	bx_ = 0;
dsp_0292F:
	outpw(0xa2, cx_);
	outpw(0xa0, bx_);
	bx_ = bx_ + 0x3333;
	cx_++;
	if (cx_ < 0x120) goto dsp_0292F;
	cx_ = 0x100;
	bx_ = 0;
	do {
		outpw(0xa2, cx_);
		if (inpw(0xa0) != bx_) return 0;
		bx_ = bx_ + 0x3333;
		cx_++;
	} while (cx_ < 0x120);
	return 1;
}
