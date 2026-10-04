/* differs: XL v1.20 +0, 112 bytes */
#include <conio.h>
extern char C0_B_DSP_CHAN;
extern char C2_B_FX_BOARD_PRESENT;
extern char C2_B_FX_UPDATE_MASK;
extern char C2_W_09888[1];
void __far _longjmp(char far *, int);

void __far lcd_write_data(int p0, int p1, unsigned p2)
{
	int si_;
	int di_;

	if (!C2_B_FX_BOARD_PRESENT) goto br_5557F;
	si_ = p2;
	si_ -= 4 - 1;
	di_ = p1;
	p2 = si_;
	si_ = p0;
loop_55514:
	outpw(0xa2, 0x182);
	outpw(0xa0, 0);
	outpw(0xa2, 0x185);
	outpw(0xa0, di_);
	outpw(0xa2, 0x186);
	outpw(0xa0, p2);
	outpw(0xa2, 0x182);
	outpw(0xa0, si_);
loop_55539:
	if (!(C2_B_FX_UPDATE_MASK & 1 << C0_B_DSP_CHAN)) goto br_55561;
	outpw(0xa2, 0x182);
	outpw(0xa0, 0);
	_longjmp(C2_W_09888, 1);
br_55561:
	outpw(0xa2, 0x180);
	if ((char)inpw(0xa0) & 1) goto loop_55539;
	outpw(0xa2, 0x182);
	outpw(0xa0, 0);
	p2 >>= 4;
	if (p2 > 4) goto loop_55514;
br_5557F:
	;
}
