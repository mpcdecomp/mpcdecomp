/* differs: 150 size 586, image 420; +1 image `enter 0x10, 0` CL `enter 0x18, 0`; 172 size 586, image 420; +1 image `enter 0x10, 0` CL `enter 0x18, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_REC_LENGTH {
    int f_0;
};
extern char G_REC_MODE;
extern unsigned char P_2DDC[1];
extern int REC_BUF_ADDR;
extern int REC_BUF_ADDR_HI;
extern struct g_REC_LENGTH REC_LENGTH;
extern int REC_LENGTH_HI;
extern unsigned int REC_PREREC_LEN;
extern unsigned char SAMPLE_PREREC;
extern unsigned int SAMPLE_TIME;
extern int W_4FE6;
extern int W_4FE8;
extern int W_4FEA;
extern int W_4FEE;
extern int W_4FF0;
extern int W_5006;
extern int W_5012;
extern int W_5014;
extern int W_5016;
extern int W_501A;
extern int W_501C;
extern int W_5032;
extern int W_503E;
extern int W_5040;
extern int W_5042;
extern int W_5044;
extern int W_5046;
extern int W_5048;
extern int W_506A;
extern int W_506C;
extern int W_506E;
extern int W_5070;
extern int W_5072;
extern int W_5074;
extern long __far X_00E76(void);
extern int __far __pascal memcpy_far_seg(int, int, char __near *);
extern long __far smem_alloc_top(void);

void __near smem_write_sample(void)
{
	char loc_10[6];
	int loc_a;
	int loc_8;
	int loc_6;
	unsigned int loc_4;
	unsigned loc_2;
	unsigned int ax;
	int ax10;
	int ax11;
	unsigned int ax2;
	unsigned int ax3;
	unsigned int ax4;
	int ax5;
	int ax6;
	int ax7;
	unsigned int ax8;
	int ax9;
	unsigned int cx;
	int dx;
	int dx2;
	int dx3;
	int flags;
	long t1;
	long t2;
	long t3;
	int t4;
	long t5;
	int t6;

	t1 = smem_alloc_top();
	REC_BUF_ADDR = (int)t1;
	REC_BUF_ADDR_HI = (int)(t1 >> 16);
	ax = SAMPLE_PREREC * 0x1b9 / 10;
	REC_PREREC_LEN = ax;
	t2 = (unsigned long)(unsigned int)SAMPLE_TIME * 0x113aL;
	cx = ax + (int)t2;
	REC_LENGTH.f_0 = cx;
	REC_LENGTH_HI = (int)(t2 >> 16) + (cx < ax);
	t3 = X_00E76();
	loc_4 = (int)t3;
	loc_2 = (int)(t3 >> 16);
	if (G_REC_MODE != 2) {
		goto L1;
	}
	loc_2 = loc_2 >> 1;
	loc_4 = loc_4 >> 1 | (loc_2 & 1) << 15;
L1:
	flags = loc_2 - REC_LENGTH_HI;
	if (CC(">", flags)) {
		goto L2;
	}
	if (CC("<", flags)) {
		goto L3;
	}
	if (loc_4 >= (unsigned int)REC_LENGTH.f_0) {
		goto L2;
	}
L3:
	dx = loc_2;
	REC_LENGTH.f_0 = loc_4;
	REC_LENGTH_HI = dx;
L2:
	ax2 = REC_BUF_ADDR;
	dx2 = REC_BUF_ADDR_HI;
	*(char *)((char *)&REC_LENGTH + 0) = (char)(*(char *)((char *)&REC_LENGTH + 0) & -16);
	ax3 = ax2 + REC_LENGTH.f_0;
	dx3 = dx2 + REC_LENGTH_HI + (ax3 < ax2);
	loc_4 = ax3;
	loc_2 = dx3;
	__stos2((int far *)&W_503E, 0, 44);
	__movs2((int far *)&W_4FE6, (unsigned char far *)P_2DDC, 44);
	ax4 = REC_PREREC_LEN + REC_BUF_ADDR;
	t4 = memcpy_far_seg(REC_BUF_ADDR_HI + (ax4 < REC_PREREC_LEN), ax4, loc_10);
	loc_a = *(int far *)MK_FP(SEG_STACK, t4);
	loc_8 = *(int far *)MK_FP(SEG_STACK, t4 + 2);
	loc_6 = *(int far *)MK_FP(SEG_STACK, t4 + 4);
	ax5 = loc_a;
	W_503E = ax5;
	W_4FE6 = ax5;
	ax6 = loc_8;
	W_5040 = ax6;
	W_4FE8 = ax6;
	ax7 = (((char)(loc_6 >> 8) | 1) << 8 | (unsigned char)(char)loc_6);
	W_5042 = ax7;
	W_4FEA = ax7;
	W_5044 = 0x1000;
	t5 = *(long *)((char *)&loc_4 + 0) / 16L;
	W_5046 = (int)t5;
	W_5048 = (int)(t5 >> 16);
	W_4FEE = (int)t5;
	W_4FF0 = (int)(t5 >> 16);
	if (G_REC_MODE == 2) {
		goto L4;
	}
	W_5006 = -0x7f80;
	return;
L4:
	W_5006 = -0x8000;
	__stos2((int far *)&W_506A, 0, 44);
	__movs2((int far *)&W_5012, (unsigned char far *)P_2DDC, 44);
	ax8 = REC_PREREC_LEN + loc_4;
	t6 = memcpy_far_seg(loc_2 + (ax8 < REC_PREREC_LEN), ax8, loc_10);
	loc_a = *(int far *)MK_FP(SEG_STACK, t6);
	loc_8 = *(int far *)MK_FP(SEG_STACK, t6 + 2);
	loc_6 = *(int far *)MK_FP(SEG_STACK, t6 + 4);
	ax9 = loc_a;
	W_506A = ax9;
	W_5012 = ax9;
	ax10 = loc_8;
	W_506C = ax10;
	W_5014 = ax10;
	ax11 = (((char)(loc_6 >> 8) | 1) << 8 | (unsigned char)(char)loc_6);
	W_506E = ax11;
	W_5016 = ax11;
	W_5070 = 0x1000;
	W_5072 = -1;
	W_5074 = 31;
	W_501A = -1;
	W_501C = 31;
	W_5032 = 128;
	return;
}
