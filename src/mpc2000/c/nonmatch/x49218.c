/* differs: XL v1.20 +7, 64 bytes */
#include <conio.h>
extern char ASIC_DMA_C031[1];
extern char ASIC_DMA_C03A[1];
extern char ASIC_DMA_C03F[1];
extern char ASIC_DMA_STATUS[1];
extern long C2_W_08B5A;
long __far L_3DE94(void);
void __far far_491F2(void);

void __far far_49218(void)
{
	int bx_;

	if (inp(ASIC_DMA_C03F) & 8) goto br_49233;
	far_491F2();
	C2_W_08B5A = L_3DE94();
br_49233:
	if (!((char)inpw(0x88) & 0x60)) goto br_49264;
	outp(ASIC_DMA_C031, 3);
	outp(ASIC_DMA_C03A, inp(ASIC_DMA_C03A) & 0xe3);
	bx_ = 0;
loop_4924A:
	if (inp(ASIC_DMA_STATUS) & 8) goto br_49255;
	bx_--;
	if (bx_) goto loop_4924A;
br_49255:
	outpw(0x88, 0);
	bx_ = 0;
loop_4925B:
	if (!(inp(0x88) & 0x80)) goto br_49264;
	bx_--;
	if (bx_) goto loop_4925B;
br_49264:
	;
}
