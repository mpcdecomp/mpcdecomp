/* differs: 150 size 68, image 48; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 68, image 48; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_SAMPLE_BUF {
    int f_0;
    int f_2;
};
extern struct g_PTR_SAMPLE_BUF PTR_SAMPLE_BUF;

long __far sample_caller_setup(void)
{
	int dx2;
	int dx;
	int cx;
	int bx;
	int ax2;
	int ax;
	int loc_2;

	cx = 0;
	ax = PTR_SAMPLE_BUF.f_0;
	bx = ax;
	loc_2 = PTR_SAMPLE_BUF.f_2;
	dx = loc_2 | ax;
	if (dx == 0) {
		goto L1;
	}
L2:
	cx = cx + 1;
	ax2 = *(int far *)MK_FP(loc_2, bx + 40);
	dx2 = *(int far *)MK_FP(loc_2, bx + 42);
	bx = ax2;
	loc_2 = dx2;
	dx = loc_2 | ax2;
	if (dx != 0) {
		goto L2;
	}
L1:
	return ((long)dx << 16 | (unsigned)cx);
}
