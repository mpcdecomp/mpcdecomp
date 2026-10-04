/* differs: XL v1.20 +1, 176 bytes */
#include <conio.h>
extern char ASIC_DMA_C031[1];
extern char ASIC_DMA_C03A[1];
extern char ASIC_DMA_COUNT[1];
extern char ASIC_DMA_STATUS[1];
extern int C0_W_0989E;
extern char C2_B_0D7CC;
extern char C2_B_REC_MODE;
extern int C2_W_08B58;
void __far L_3E4EE(int, int);
long __far L_3E502(int);
long __far L_3E524(int);
void __far timer_loop_io(void);
void __far far_4904A(void);
int __far far_49070(void);
void __far far_4907E(void);
void __far far_4EE54(int);

int __far far_490A6(void)
{
	char l6[6];
	int si_;
	int di_;
	int ax_;

	l6[0] = 0x40;
	l6[1] = 0x80;
	l6[2] = 0xc0;
	si_ = C2_B_REC_MODE;
	di_ = l6[si_];
	di_ &= 0xff;
	if (!((char)inpw(0x88) & 0x60)) goto br_490D0;
	outpw(0x88, 0x80);
br_490D0:
	L_3E502(0xc);
	if (!(inp(ASIC_DMA_STATUS) & 0x40)) goto br_49123;
	outp(ASIC_DMA_C031, 2);
	L_3E4EE(-0x1000, 7);
	outpw(ASIC_DMA_COUNT, 0x3ff);
	outp(ASIC_DMA_C03A, 0x55);
	L_3E524(4);
	*(int *)(l6 + 4) = di_;
loop_49111:
	if (inp(ASIC_DMA_STATUS) & 0x40) goto loop_49111;
	L_3E502(4);
br_49123:
	outp(ASIC_DMA_C031, 2);
	L_3E4EE(-0x1000, 7);
	outpw(ASIC_DMA_COUNT, 0x3ff);
	outp(ASIC_DMA_C03A, 0x55);
	if (!C2_B_0D7CC) {
		far_4904A();
		outp(0xc0, C0_W_0989E & 0xff3b);
		si_ = C0_W_0989E & 0xff3b;
		si_ |= di_;
	} else {
		si_ = C0_W_0989E & 0xff1f | 0xc;
		outp(0xc0, si_);
		timer_loop_io();
		si_ |= di_;
		far_4EE54(0x14);
		far_4907E();
		switch (far_49070()) { case 0: goto br_4918C; }
		ax_ = 0;
		goto br_491A1;
	}
br_4918C:
	L_3E524(4);
	outp(0xc0, si_);
	C0_W_0989E = si_;
	ax_ = 1;
br_491A1:
	C2_W_08B58 = ax_;
	return ax_;
}
