#include "mpc2k.h"

#pragma intrinsic(outpw, inpw)

void __far __pascal lcd_write_data(unsigned a, unsigned b, unsigned n)
{
#if FW_VERSION == 172
	if (!B_87E6) return;
#endif
	n <<= 2; n--;
	do {
		outpw(0xa2, 0x182);
		outpw(0xa0, 0);
		outpw(0xa2, 0x185);
		outpw(0xa0, b);
		outpw(0xa2, 0x186);
		outpw(0xa0, n);
		outpw(0xa2, 0x182);
		outpw(0xa0, a);
		do {
			if (G_PENDING_DMA_MASK & (1 << G_DSP_CHAN)) {
				outpw(0xa2, 0x182);
				outpw(0xa0, 0);
				_longjmp(P_89F8, 1);
			}
			outpw(0xa2, 0x180);
		} while (inpw(0xa0) & 1);
		outpw(0xa2, 0x182);
		outpw(0xa0, 0);
		n >>= 4;
	} while (n > 4);
}
