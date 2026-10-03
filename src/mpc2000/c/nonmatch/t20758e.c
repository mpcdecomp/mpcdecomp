/* differs: 150 size 132, image 110; +1 image `enter 4, 0` CL `enter 0xc, 0`; 172 size 132, image 110; +1 image `enter 4, 0` CL `enter 0xc, 0` */
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
extern int __far _fstricmp(long, long);

long __far __pascal sample_ptr_access(int arg_2, int arg_0)
{
	int loc_2;
	int ax;
	int ax2;
	int di;
	int dx;
	int si;

	ax = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 40);
	dx = *(int far *)((char far *)*(long *)((char *)&PTR_SAMPLE_DATA + 0) + 42);
	si = ax;
	loc_2 = dx;
	if (ax == PTR_DMA_STATE.f_0 && dx == PTR_DMA_STATE.f_2) {
		goto L1;
	}
	di = arg_0;
	while (_fstricmp(((long)dx << 16 | (unsigned)si), ((long)arg_2 << 16 | (unsigned)di)) != 0) {
		dx = *(int far *)MK_FP(loc_2, si + 42);
		si = *(int far *)MK_FP(loc_2, si + 40);
		loc_2 = dx;
		ax2 = dx;
		if (si != PTR_DMA_STATE.f_0 || ax2 != PTR_DMA_STATE.f_2) {
			continue;
		}
		goto L2;
	}
	return ((long)loc_2 << 16 | (unsigned)si);
L2:
L1:
	return 0L;
}
