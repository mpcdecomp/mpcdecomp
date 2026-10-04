/* differs: 150 size 188, image 192; +B image `jmp +B4` CL `jmp +B1`; 172 size 188, image 192; +B image `jmp +B4` CL `jmp +B1` */
#include <conio.h>
extern char ASIC_REG181_SHADOW;
extern unsigned char B_87E6;
extern char B_8CDF;
void __far L_01A70(void);
void __far L_01872(void);
int __near dsp_0292A(void);
void __far ivt_set_vector(int, void (far *)(void));

int __far X_0286A(void)
{
	unsigned bx_;
	int v0;

	v0 = dsp_0292A();
	B_87E6 = (char)v0;
	if ((char)v0) goto dsp_02877;
	goto br_0291E;
dsp_02877:
	B_8CDF = 2;
	outpw(0xa2, 0x180);
	outpw(0xa0, 2);
	outpw(0xa2, 0x181);
	outpw(0xa0, 0);
	ASIC_REG181_SHADOW = 0;
	outpw(0xa2, 0x182);
	outpw(0xa0, 0);
	bx_ = 0;
dsp_028A0:
	outpw(0xa2, bx_);
	outpw(0xa0, 0);
	bx_++;
	if (bx_ < 0x120) goto dsp_028A0;
	bx_ = 0x200;
dsp_028B2:
	outpw(0xa2, bx_);
	outpw(0xa0, 0);
	bx_++;
	if (bx_ < 0x280) goto dsp_028B2;
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
	ivt_set_vector(0x49, L_01A70);
br_0291E:
	L_01872();
	return B_87E6;
}
