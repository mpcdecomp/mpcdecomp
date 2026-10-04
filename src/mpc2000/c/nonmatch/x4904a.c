/* differs: XL v1.20 +B, 37 bytes */
#include <conio.h>
extern int C0_W_0989E;
void __far far_4EE54(int);

void __far far_4904A(void)
{
	int si_;

	outp(0xc0, C0_W_0989E & 0xff3f | 8);
	si_ = C0_W_0989E & 0xff3f | 8;
	C0_W_0989E = si_;
	si_ &= -9;
	outp(0xc0, si_);
	C0_W_0989E = si_;
	far_4EE54(0x5d);
}
