/* differs: 150 size 462, image 278; +1 image `enter 0xc, 0` CL `enter 0x28, 0`; 172 size 462, image 278; +1 image `enter 0xc, 0` CL `enter 0x28, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[40];
    int f_28;
    int f_2a;
};
struct g_PTR_DMA_STATE {
    int f_0;
    int f_2;
};
extern struct g_PTR_DMA_STATE PTR_DMA_STATE;
extern char far *PTR_SAMPLE_DATA;

void __far __pascal sample_data_load_3(long arg_0)
{
	struct s1 far *loc_c;
	char loc_a[4];
	char loc_6[4];
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int ax4;
	int bx;
	int bx2;
	int bx3;
	int di;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int dx5;
	int dx6;
	int es;
	int es2;
	int es3;
	int es4;
	int si;
	long t1;

	dx = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 42);
	*(int *)((char *)&loc_c + 0) = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
	*(int *)((char *)&loc_a + 0) = dx;
	if (*(int *)((char *)&loc_c + 0) != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (dx != PTR_DMA_STATE.f_2) {
		goto L1;
	}
	goto L2;
L1:
	ax = loc_c->f_28;
	dx2 = loc_c->f_2a;
	si = ax;
	loc_2 = dx2;
	if (ax != PTR_DMA_STATE.f_0) {
		goto L3;
	}
	if (dx2 != PTR_DMA_STATE.f_2) {
		goto L3;
	}
	goto L2;
L3:
	es = dx2;
	dx3 = *(int far *)MK_FP(es, si + 42);
	bx = (int)*(long far *)MK_FP(es, si + 44);
	es2 = (int)(*(long far *)MK_FP(es, si + 44) >> 16);
	*(int far *)MK_FP(es2, bx + 40) = *(int far *)MK_FP(es, si + 40);
	*(int far *)MK_FP(es2, bx + 42) = dx3;
	dx4 = *(int far *)MK_FP(loc_2, si + 46);
	bx2 = (int)*(long far *)MK_FP(loc_2, si + 40);
	es3 = (int)(*(long far *)MK_FP(loc_2, si + 40) >> 16);
	*(int far *)MK_FP(es3, bx2 + 44) = *(int far *)MK_FP(loc_2, si + 44);
	*(int far *)MK_FP(es3, bx2 + 46) = dx4;
	ax2 = *(int far *)MK_FP(loc_2, si + 44);
	di = ax2;
	*(int *)((char *)&loc_6 + 0) = *(int far *)MK_FP(loc_2, si + 46);
	if ((int)(*(long (far *)())arg_0)(ax2, *(int *)((char *)&loc_6 + 0), si, loc_2) >= 0) {
		goto L4;
	}
L5:
	ax3 = *(int far *)MK_FP(*(int *)((char *)&loc_6 + 0), di + 44);
	dx5 = *(int far *)MK_FP(*(int *)((char *)&loc_6 + 0), di + 46);
	di = ax3;
	*(int *)((char *)&loc_6 + 0) = dx5;
	t1 = (*(long (far *)())arg_0)(ax3, *(int *)((char *)&loc_6 + 0), si, loc_2);
	if ((int)t1 < 0) {
		goto L5;
	}
L4:
	*(int far *)MK_FP(loc_2, si + 44) = di;
	*(int far *)MK_FP(loc_2, si + 46) = *(int *)((char *)&loc_6 + 0);
	dx6 = *(int far *)MK_FP(*(int *)((char *)&loc_6 + 0), di + 42);
	*(int far *)MK_FP(loc_2, si + 40) = *(int far *)MK_FP(*(int *)((char *)&loc_6 + 0), di + 40);
	*(int far *)MK_FP(loc_2, si + 42) = dx6;
	*(int far *)MK_FP(*(int *)((char *)&loc_6 + 0), di + 40) = si;
	*(int far *)MK_FP(*(int *)((char *)&loc_6 + 0), di + 42) = loc_2;
	bx3 = (int)*(long far *)MK_FP(loc_2, si + 40);
	es4 = (int)(*(long far *)MK_FP(loc_2, si + 40) >> 16);
	*(int far *)MK_FP(es4, bx3 + 44) = si;
	*(int far *)MK_FP(es4, bx3 + 46) = loc_2;
	dx2 = *(int far *)MK_FP(loc_2, si + 42);
	si = *(int far *)MK_FP(loc_2, si + 40);
	loc_2 = dx2;
	ax4 = dx2;
	if (si == PTR_DMA_STATE.f_0) {
		goto L6;
	}
	goto L3;
L6:
	if (ax4 == PTR_DMA_STATE.f_2) {
		goto L2;
	}
	goto L3;
L2:
	return;
}
