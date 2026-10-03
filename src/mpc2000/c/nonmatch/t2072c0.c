/* differs: 150 size 110, image 92; +4 image `push si` CL `push di`; 172 size 110, image 92; +4 image `push si` CL `push di` */
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
extern long PTR_SAMPLE_DATA;
extern long __far far_074EE(void);
extern long __far __pascal smem_free(int);

void __far sample_data_load_1(void)
{
	int loc_2;
	int ax;
	int ax2;
	int bx;
	int cx;
	unsigned dx;
	int es;
	int p10;
	int si;
	long t1;
	long t2;

	bx = (int)PTR_SAMPLE_DATA;
	ax = *(int far *)MK_FP((int)(PTR_SAMPLE_DATA >> 16), bx + 40);
	dx = *(int far *)MK_FP((int)(PTR_SAMPLE_DATA >> 16), bx + 42);
	si = ax;
	loc_2 = dx;
	if (ax != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (dx == PTR_DMA_STATE.f_2) {
		goto L2;
	}
L1:
	es = dx;
	if ((unsigned int)*(int far *)MK_FP(es, si + 48) >= 130) {
		goto L3;
	}
	p10 = *(int far *)MK_FP(es, si + 48);
	t1 = smem_free(p10);
	bx = UNDEF;
	cx = UNDEF;
L3:
	dx = *(int far *)MK_FP(loc_2, si + 42);
	si = *(int far *)MK_FP(loc_2, si + 40);
	loc_2 = dx;
	ax2 = dx;
	if (si != PTR_DMA_STATE.f_0) {
		goto L1;
	}
	if (ax2 != PTR_DMA_STATE.f_2) {
		goto L1;
	}
L2:
	t2 = far_074EE();
	return;
}
