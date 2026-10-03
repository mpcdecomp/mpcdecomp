#include <conio.h>
extern char C1_W_00418[1];
void __far dma_field_write(int, char far *, int);
void __far far_3E59A(void);

void __far dma_0162d(void)
{
	int si_;

	si_ = 0;
loop_3E5D5:
	dma_field_write(si_, C1_W_00418, 0x7fff);
	si_++;
	if (si_ < 0x20) goto loop_3E5D5;
	outpw(0x88, 0);
L_3DCBF:
	if (inp(0x88) & 0x80) goto L_3DCBF;
	far_3E59A();
}
