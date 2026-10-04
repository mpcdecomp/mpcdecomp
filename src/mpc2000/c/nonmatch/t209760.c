/* differs: 150 size 216, image 116; +1 image `enter 2, 0` CL `enter 6, 0`; 172 size 216, image 116; +1 image `enter 2, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

void __far __pascal track_block_copy(int arg_8, char far *arg_6, long arg_2, int arg_0)
{
	int bx;
	unsigned int cx;
	int cx2;
	unsigned int cx3;
	int cx4;
	int di;
	int di2;
	int es;
	int si;
	int si2;
	int t1;

	t1 = __repne_scas1((int)arg_2, 0, -1);
	cx = ~t1;
	di = (int)arg_2 + (-1 - t1) - cx;
	cx2 = cx >> 1;
	__movs2(MK_FP(FP_SEG(arg_6), di), MK_FP((int)(arg_2 >> 16), di), cx2 * 2);
	__movs1(MK_FP(FP_SEG(arg_6), di + cx2 * 2), MK_FP((int)(arg_2 >> 16), di + cx2 * 2), cx & 1);
	si = 0;
	bx = *(int *)((char *)&arg_6 + 0);
L1:
	es = arg_8;
	if (*(char far *)MK_FP(es, bx + si) == 32) {
		goto L2;
	}
	si = si + 1;
	if (si < 15) {
		goto L1;
	}
L2:
	*(char far *)MK_FP(es, *(int *)((char *)&arg_6 + 0) + si) = *(char *)((char *)&arg_0 + 0);
	si2 = si + 1;
	if (si2 >= 16) {
		goto L3;
	}
	cx3 = 16 - si2;
	di2 = FP_OFF(arg_6) + si2;
	cx4 = cx3 >> 1;
	__stos2(MK_FP(FP_SEG(arg_6), di2), 0x2020, cx4 * 2);
	if (!(cx3 & 1)) {
		goto L4;
	}
	*(char far *)MK_FP(FP_SEG(arg_6), di2 + cx4 * 2) = (char)32;
L4:
	si2 = si2 + cx3;
L3:
	arg_6[si2] = (char)0;
	return;
}
