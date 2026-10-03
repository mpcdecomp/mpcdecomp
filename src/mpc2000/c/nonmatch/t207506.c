/* differs: 150 size 38, image 28; +0 image `les bx, ptr [0x4f40]` CL `push di`; 172 size 38, image 28; +0 image `les bx, ptr [0x5180]` CL `push di` */
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

long __far far_078E4(void)
{
	unsigned ax;
	int dx;

	ax = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
	dx = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 42);
	if (ax != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (dx != PTR_DMA_STATE.f_2) {
		goto L1;
	}
	ax = 0;
	dx = -(ax < 0);
L1:
	return ((long)dx << 16 | (unsigned)ax);
}
