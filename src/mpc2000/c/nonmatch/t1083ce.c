/* differs: 150 size 394, image 244; +1 image `enter 0xe, 0` CL `enter 0x24, 0`; 172 size 394, image 244; +1 image `enter 0xe, 0` CL `enter 0x24, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SMEM_POOL {
    int f_0;
};
struct g_SMEM_POOL_BASE_HI {
    int f_0;
};
extern unsigned char BUF_XFER[1];
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern long __far __pascal flash_write_words(int, int, int, int, int);

void __near __pascal zone_action_silence(int arg_10, int arg_8, int arg_6, long arg_4, long arg_0)
{
	int loc_e;
	int loc_c;
	int loc_a;
	long loc_8;
	int loc_6;
	unsigned long loc_4;
	int loc_2;
	unsigned int ax;
	unsigned int ax2;
	int ax3;
	unsigned int ax4;
	unsigned int ax5;
	unsigned int ax6;
	int ax7;
	int bx;
	int bx2;
	int bx3;
	int dx;
	int dx2;
	int flags;
	int p22;
	int p24;
	int p26;
	int p28;
	int p30;
	int si2;
	long t1;

	loc_a = *(char far *)MK_FP(arg_10, arg_8 + 19);
	p22 = arg_10;
	p24 = SEG_DATA;
	__stos2(((long)p24 << 16 | (unsigned)(unsigned int)(unsigned)BUF_XFER), 0, 0x800);
	bx = ((*(int far *)MK_FP(p22, arg_8 + 48) << 2) + *(int far *)MK_FP(p22, arg_8 + 48)) * 2;
	ax = *(int *)((char *)&SMEM_POOL + 0 + bx);
	ax2 = ax + *(int *)((char *)&arg_4 + 0);
	dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx) + arg_6 + (ax2 < ax);
	*(int *)((char *)&loc_8 + 0) = ax2;
	loc_6 = dx;
	loc_e = *(int *)((char *)&arg_0 + 0) - *(int *)((char *)&arg_4 + 0);
	loc_c = (int)(arg_0 - arg_4 >> 16);
L1:
	*(int *)((char *)&loc_4 + 0) = loc_e;
	loc_2 = loc_c;
	if ((loc_2 | *(int *)((char *)&loc_4 + 0)) == 0) {
		goto L2;
	}
L3:
	flags = loc_2;
	if (CC("<", flags)) {
		goto L4;
	}
	if (CC(">", flags)) {
		goto L5;
	}
	if ((unsigned int)*(int *)((char *)&loc_4 + 0) <= 0x400) {
		goto L4;
	}
L5:
	si2 = 0x400;
	goto L6;
L4:
	si2 = *(int *)((char *)&loc_4 + 0);
L6:
	p22 = loc_6;
	p24 = *(int *)((char *)&loc_8 + 0);
	p26 = SEG_DATA;
	p28 = (int)(unsigned)BUF_XFER;
	p30 = si2;
	t1 = flash_write_words(p22, p24, p26, p28, p30);
	*(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + si2;
	loc_6 = (int)(loc_8 + (long)(int)si2 >> 16);
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - si2;
	loc_2 = (int)(loc_4 - (long)(int)si2 >> 16);
	if ((loc_2 | *(int *)((char *)&loc_4 + 0)) != 0) {
		goto L3;
	}
	arg_8 = arg_8;
L2:
	ax3 = *(int far *)MK_FP(arg_10, arg_8 + 28);
	ax4 = ((char)(ax3 + 15 >> 8) << 8 | (unsigned char)((char)ax3 + 15 & -16));
	bx2 = *(int far *)MK_FP(arg_10, arg_8 + 48);
	bx3 = ((bx2 << 2) + bx2) * 2;
	ax5 = ax4 + *(int *)((char *)&SMEM_POOL + 0 + bx3);
	ax6 = ax5 + *(int *)((char *)&arg_4 + 0);
	dx2 = (int)(((long)*(int far *)MK_FP(arg_10, arg_8 + 30) << 16 | (unsigned)ax3) + 15L >> 16) + *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx3) + (ax5 < ax4) + arg_6 + (ax6 < ax5);
	*(int *)((char *)&loc_8 + 0) = ax6;
	loc_6 = dx2;
	ax7 = loc_a;
	loc_a = loc_a - 1;
	if (ax7 == 0) {
		goto L7;
	}
	goto L1;
L7:
	return;
}
