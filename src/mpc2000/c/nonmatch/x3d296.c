/* differs: XL v1.20 +B, 151 bytes */
#include <conio.h>
extern char C0_B_08FC4;
extern char C0_B_09602;
extern unsigned char C0_B_0D760;
extern char EP_FX_DSP_UPDATE_ISR_OFF[1];
extern char EP_FX_DSP_UPDATE_ISR_SEG[1];
void __far L_3E7EC(void);
int __near fn_3D356(void);
void __far ivt_set_vector(int, char __near *, char __near *);

int __far tgt_3D296(void)
{
	unsigned bx_;
	int v0;

	v0 = fn_3D356();
	C0_B_0D760 = (char)v0;
	if (!(char)v0) goto br_3D34A;
	C0_B_08FC4 = 2;
	outpw(0xa2, 0x180);
	outpw(0xa0, 2);
	outpw(0xa2, 0x181);
	outpw(0xa0, 0);
	C0_B_09602 = 0;
	outpw(0xa2, 0x182);
	outpw(0xa0, 0);
	bx_ = 0;
loop_3D2CC:
	outpw(0xa2, bx_);
	outpw(0xa0, 0);
	bx_++;
	if (bx_ < 0x120) goto loop_3D2CC;
	bx_ = 0x200;
loop_3D2DE:
	outpw(0xa2, bx_);
	outpw(0xa0, 0);
	bx_++;
	if (bx_ < 0x280) goto loop_3D2DE;
	outpw(0xa2, 0xc8);
	outpw(0xa0, 0);
	outpw(0xa2, 0xc9);
	outpw(0xa0, 0);
	outpw(0xa2, 0x26e);
	outpw(0xa0, 0);
	outpw(0xa2, 0xf6);
	outpw(0xa0, 0x4000);
	outpw(0xa2, 0xf2);
	outpw(0xa0, 0x7fff);
	outpw(0xa2, 0xf0);
	outpw(0xa0, 0x64);
	outpw(0xa2, 0x27e);
	outpw(0xa0, 0x100);
	outpw(0xa2, 0x264);
	outpw(0xa0, 0x100);
	ivt_set_vector(0x49, EP_FX_DSP_UPDATE_ISR_OFF, EP_FX_DSP_UPDATE_ISR_SEG);
br_3D34A:
	L_3E7EC();
	return C0_B_0D760;
}
