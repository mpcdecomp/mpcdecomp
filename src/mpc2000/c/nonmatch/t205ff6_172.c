/* differs: 172 size 68, image 66; +3 image `les bx, ptr [0x2602]` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_PTR_DMA_STATE {
    int f_0;
    int f_2;
};
extern char far *FP_2602;
extern int FP_2602_SEG;
extern struct g_PTR_DMA_STATE PTR_DMA_STATE;

long __far __pascal smem_addr_dma_read2(struct s1 far *arg_0)
{
	int ax;
	int dx;
	int dx2;

	ax = *(int far *)((char far *)*(long *)((char *)&FP_2602 + 0) + 40);
	dx = *(int far *)((char far *)*(long *)((char *)&FP_2602 + 0) + 42);
	arg_0->f_0 = ax;
	arg_0->f_2 = dx;
	*(int *)((char *)&FP_2602 + 0) = ax;
	FP_2602_SEG = dx;
	dx2 = PTR_DMA_STATE.f_2;
	if (*(int *)((char *)&FP_2602 + 0) != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (FP_2602_SEG != dx2) {
		goto L1;
	}
	return ((long)dx2 << 16 | (unsigned)0);
L1:
	return ((long)dx2 << 16 | (unsigned)1);
}
