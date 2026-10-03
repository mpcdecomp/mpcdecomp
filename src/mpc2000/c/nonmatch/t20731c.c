/* differs: 150 size 332, image 214; +1 image `enter 8, 0` CL `enter 0x1c, 0`; 172 size 332, image 214; +1 image `enter 8, 0` CL `enter 0x1c, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_DMA_STATE {
    int f_0;
    int f_2;
};
struct g_PTR_SAMPLE_BUF {
    int f_0;
    int f_2;
};
extern struct g_PTR_DMA_STATE PTR_DMA_STATE;
extern struct g_PTR_SAMPLE_BUF PTR_SAMPLE_BUF;
extern char far *PTR_SAMPLE_DATA;
extern int __far __pascal sample_check_active(int, int);
extern long __far __pascal smem_free(int);
extern long __far __pascal smem_proc_wrapper(int, int);

void __far sample_delete_flagged(void)
{
	char loc_6[4];
	int loc_2;
	int ax;
	int ax2;
	int bx;
	unsigned bx2;
	int di;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int es;
	int es2;
	int si;
	long t1;
	long t2;

	ax = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
	dx = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 42);
	si = ax;
	loc_2 = dx;
	if (ax != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (dx != PTR_DMA_STATE.f_2) {
		goto L1;
	}
	goto L2;
L1:
	di = *(int far *)MK_FP(dx, si + 44);
	*(int *)((char *)&loc_6 + 0) = *(int far *)MK_FP(dx, si + 46);
	if (sample_check_active(dx, si) == 0) {
		goto L3;
	}
	t1 = smem_proc_wrapper(loc_2, si);
	if ((unsigned int)*(int far *)MK_FP(loc_2, si + 48) >= 130) {
		goto L4;
	}
	t2 = smem_free(*(int far *)MK_FP(loc_2, si + 48));
L4:
	dx2 = *(int far *)MK_FP(loc_2, si + 42);
	bx = (int)*(long far *)MK_FP(loc_2, si + 44);
	es = (int)(*(long far *)MK_FP(loc_2, si + 44) >> 16);
	*(int far *)MK_FP(es, bx + 40) = *(int far *)MK_FP(loc_2, si + 40);
	*(int far *)MK_FP(es, bx + 42) = dx2;
	dx3 = *(int far *)MK_FP(loc_2, si + 46);
	bx2 = (int)*(long far *)MK_FP(loc_2, si + 40);
	es2 = (int)(*(long far *)MK_FP(loc_2, si + 40) >> 16);
	*(int far *)MK_FP(es2, bx2 + 44) = *(int far *)MK_FP(loc_2, si + 44);
	*(int far *)MK_FP(es2, bx2 + 46) = dx3;
	dx4 = PTR_SAMPLE_BUF.f_2;
	*(int far *)MK_FP(loc_2, si + 40) = PTR_SAMPLE_BUF.f_0;
	*(int far *)MK_FP(loc_2, si + 42) = dx4;
	PTR_SAMPLE_BUF.f_0 = si;
	PTR_SAMPLE_BUF.f_2 = loc_2;
	si = di;
	loc_2 = *(int *)((char *)&loc_6 + 0);
L3:
	dx = *(int far *)MK_FP(loc_2, si + 42);
	si = *(int far *)MK_FP(loc_2, si + 40);
	loc_2 = dx;
	ax2 = dx;
	if (si == PTR_DMA_STATE.f_0) {
		goto L5;
	}
	goto L1;
L5:
	if (ax2 == PTR_DMA_STATE.f_2) {
		goto L2;
	}
	goto L1;
L2:
	return;
}
