#include "mpc2k.h"

#pragma intrinsic(outpw, inpw)

void __far __pascal lcd_write_data(unsigned a, unsigned b, unsigned n)
{
#if FW_VERSION == 172
	if (!B_87E6) return;
#endif
	n <<= 2; n--;
	do {
		outpw(ASIC_REG, 0x182);
		outpw(ASIC_DATA, 0);
		outpw(ASIC_REG, 0x185);
		outpw(ASIC_DATA, b);
		outpw(ASIC_REG, 0x186);
		outpw(ASIC_DATA, n);
		outpw(ASIC_REG, 0x182);
		outpw(ASIC_DATA, a);
		do {
			if (G_PENDING_DMA_MASK & (1 << G_DSP_CHAN)) {
				outpw(ASIC_REG, 0x182);
				outpw(ASIC_DATA, 0);
				_longjmp(P_89F8, ERR_NO_MEMORY);
			}
			outpw(ASIC_REG, 0x180);
		} while (inpw(ASIC_DATA) & 1);
		outpw(ASIC_REG, 0x182);
		outpw(ASIC_DATA, 0);
		n >>= 4;
	} while (n > 4);
}
