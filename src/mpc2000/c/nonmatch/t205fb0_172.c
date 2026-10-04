/* differs: 172 size 92, image 70; +0 image `push bp` CL `enter 6, 0` */
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
extern int FP_2602;
extern int FP_2602_SEG;
extern struct g_PTR_DMA_STATE PTR_DMA_STATE;
extern char far *PTR_SAMPLE_DATA;

long __far __pascal smem_addr_dma_read(int arg_2, int arg_0)
{
	int ax;
	int dx;
	int dx2;

	ax = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
	dx = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 42);
	FP_2602 = ax;
	FP_2602_SEG = dx;
	*(int far *)MK_FP(arg_2, arg_0) = ax;
	*(int far *)MK_FP(arg_2, arg_0 + 2) = dx;
	dx2 = PTR_DMA_STATE.f_2;
	if (*(int far *)MK_FP(arg_2, arg_0) != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (*(int far *)MK_FP(arg_2, arg_0 + 2) != dx2) {
		goto L1;
	}
	return ((long)dx2 << 16 | (unsigned)0);
L1:
	return ((long)dx2 << 16 | (unsigned)1);
}
