/* differs: 150 size 758, image 442; +1 image `enter 4, 0` CL `enter 0x2e, 0`; 172 size 758, image 442; +1 image `enter 4, 0` CL `enter 0x2e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far __pascal string_scan_status(int, int, int, int);

void __near __pascal system_setup(int arg_10, int arg_8, unsigned int arg_6, unsigned int arg_4, unsigned int arg_2, unsigned int arg_0)
{
	unsigned int ax;
	unsigned int ax10;
	unsigned ax2;
	int ax3;
	int ax4;
	unsigned int ax5;
	int ax6;
	int ax7;
	unsigned int ax8;
	int ax9;
	int di;
	unsigned int dx;
	unsigned int dx2;
	int dx3;
	int es;
	int flags;
	int flags2;
	int p12;
	int p14;
	long t1;
	long t10;
	long t2;
	long t3;
	long t4;
	long t5;
	long t6;
	long t7;
	long t8;
	long t9;

	di = *(int far *)MK_FP(arg_10, arg_8 + 16);
	dx = arg_6 >> 1;
	ax = arg_4 >> 1 | (arg_6 & 1) << 15;
	dx2 = dx >> 1 | (arg_4 & 1) << 15;
	ax2 = ((ax >> 1 | (dx & 1) << 15) >> 1 | (dx2 & 1) << 15) >> 1 | ((dx2 >> 1 | (ax & 1) << 15) & 1) << 15;
	t1 = ((long)ax2 << 16 | (unsigned)(ax2 & -0x1000)) / (unsigned long)(unsigned int)*(int far *)MK_FP(arg_10, arg_8 + 14);
	*(int far *)MK_FP(arg_10, arg_8 + 50) = (int)t1;
	*(int far *)MK_FP(arg_10, arg_8 + 52) = (int)(t1 >> 16);
	t2 = (unsigned long)(unsigned int)*(int far *)MK_FP(arg_10, arg_8 + 14) * (long)(int)di;
	if (arg_2 != 0) {
		goto L1;
	}
	*(int far *)MK_FP(arg_10, arg_8 + 18) = di;
	goto L2;
L1:
	t3 = (unsigned long)(unsigned int)arg_2 * 0x57dbL;
	t4 = string_scan_status((int)(t2 >> 16), (int)t2, (int)(t3 >> 16), (int)t3);
	*(int far *)MK_FP(arg_10, arg_8 + 18) = (int)t4;
	if ((int)t4 != 0) {
		goto L3;
	}
	*(int far *)MK_FP(arg_10, arg_8 + 18) = 1;
L3:
	if (*(int far *)MK_FP(arg_10, arg_8 + 16) >= *(int far *)MK_FP(arg_10, arg_8 + 18)) {
		goto L2;
	}
	*(int far *)MK_FP(arg_10, arg_8 + 18) = *(int far *)MK_FP(arg_10, arg_8 + 16);
L2:
	if (arg_0 != 0) {
		goto L4;
	}
	*(int far *)MK_FP(arg_10, arg_8 + 20) = 0x7fff;
	goto L5;
L4:
	t5 = (unsigned long)(unsigned int)arg_0 * 0x57dbL;
	t6 = string_scan_status((int)(t2 >> 16), (int)t2, (int)(t5 >> 16), (int)t5);
	*(int far *)MK_FP(arg_10, arg_8 + 20) = (int)t6;
	if ((int)t6 != 0) {
		goto L5;
	}
	*(int far *)MK_FP(arg_10, arg_8 + 20) = 1;
L5:
	ax3 = *(int far *)MK_FP(arg_10, arg_8 + 18);
	ax4 = *(int far *)MK_FP(arg_10, arg_8 + 16);
	ax5 = ax4 * 2;
	t7 = ((long)(-(ax4 < 0) * 2 + (ax5 < (unsigned int)ax4)) << 16 | (unsigned)ax5) / (long)(int)ax3;
	*(int far *)MK_FP(arg_10, arg_8 + 54) = (int)(t7 / 11L);
	ax6 = *(int far *)MK_FP(arg_10, arg_8 + 20);
	ax7 = *(int far *)MK_FP(arg_10, arg_8 + 16);
	ax8 = ax7 * 2;
	t8 = ((long)(-(ax7 < 0) * 2 + (ax8 < (unsigned int)ax7)) << 16 | (unsigned)ax8) / (long)(int)ax6;
	*(int far *)MK_FP(arg_10, arg_8 + 56) = (int)(t8 / 11L);
	if (*(char far *)MK_FP(arg_10, arg_8 + 4) != 0) {
		goto L6;
	}
	es = arg_10;
	flags = 0 - *(int far *)MK_FP(es, arg_8 + 52);
	if (CC("<u", flags)) {
		goto L7;
	}
	if (CC(">u", flags)) {
		goto L8;
	}
	if ((unsigned int)*(int far *)MK_FP(es, arg_8 + 56) <= (unsigned int)*(int far *)MK_FP(es, arg_8 + 50)) {
		goto L7;
	}
L8:
	*(int far *)MK_FP(es, arg_8 + 56) = *(int far *)MK_FP(es, arg_8 + 50);
	*(int far *)MK_FP(es, arg_8 + 54) = 0;
	*(int far *)MK_FP(es, arg_8 + 18) = *(int far *)MK_FP(es, arg_8 + 16);
	p12 = (int)(t2 >> 16);
	p14 = (int)t2;
	t9 = (unsigned long)(unsigned int)*(int far *)MK_FP(es, arg_8 + 56) * 0x57dbL;
	ax9 = (int)t9;
	dx3 = (int)(t9 >> 16);
	goto L9;
L7:
	flags2 = 0 - *(int far *)MK_FP(es, arg_8 + 52);
	if (CC("<u", flags2)) {
		goto L6;
	}
	if (CC(">u", flags2)) {
		goto L10;
	}
	if ((unsigned int)(*(int far *)MK_FP(es, arg_8 + 54) + *(int far *)MK_FP(es, arg_8 + 56)) <= (unsigned int)*(int far *)MK_FP(es, arg_8 + 50)) {
		goto L6;
	}
L10:
	p12 = (int)(t2 >> 16);
	p14 = (int)t2;
	ax10 = *(int far *)MK_FP(es, arg_8 + 50) - *(int far *)MK_FP(es, arg_8 + 56);
	*(int far *)MK_FP(es, arg_8 + 54) = ax10;
	t10 = (unsigned long)(unsigned int)ax10 * 0x57dbL;
	ax9 = (int)t10;
	dx3 = (int)(t10 >> 16);
L9:
	*(int far *)MK_FP(arg_10, arg_8 + 20) = (int)string_scan_status(p12, p14, dx3, ax9);
L6:
	*(int far *)MK_FP(arg_10, arg_8 + 20) = -*(int far *)MK_FP(arg_10, arg_8 + 20);
	return;
}
