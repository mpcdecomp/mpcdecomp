/* differs: XL v1.20 +6, 25 bytes */
#include <conio.h>
extern char ASIC_DMA_C03F[1];
extern unsigned C0_W_0989E;
extern int C2_W_08B58;

void __far far_491A8(void)
{
	if (!C2_W_08B58) goto br_491BC;
	outp(ASIC_DMA_C03F, inp(ASIC_DMA_C03F) | 4);
br_491BC:
	outp(0xc0, C0_W_0989E & 0xff3b | 8);
	C0_W_0989E = C0_W_0989E & 0xff3b | 8;
	C2_W_08B58 = 0;
}
