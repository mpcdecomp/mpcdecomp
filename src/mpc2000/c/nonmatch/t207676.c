/* differs: 150 size 104, image 90; +4 image `push si` CL `push di`; 172 size 104, image 90; +4 image `push si` CL `push di` */
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
extern struct g_PTR_DMA_STATE PTR_DMA_STATE;
extern char far *PTR_SAMPLE_DATA;

long __far __pascal sample_ptr_helper(int arg_2, int arg_0)
{
	int ax;
	int ax2;
	int ax3;
	int bx;
	int cx;
	int dx;

	ax = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
	dx = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 42);
	bx = ax;
	if (ax != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (dx == PTR_DMA_STATE.f_2) {
		goto L2;
	}
L1:
	cx = arg_0;
L3:
	ax2 = dx;
	if (bx != cx) {
		goto L4;
	}
	if (ax2 == arg_2) {
		goto L5;
	}
L4:
	dx = *(int far *)MK_FP(ax2, bx + 42);
	bx = *(int far *)MK_FP(ax2, bx + 40);
	ax3 = dx;
	if (bx != PTR_DMA_STATE.f_0) {
		goto L3;
	}
	if (ax3 != PTR_DMA_STATE.f_2) {
		goto L3;
	}
	goto L2;
L5:
	return ((long)dx << 16 | (unsigned)1);
L2:
	return ((long)dx << 16 | (unsigned)0);
}
