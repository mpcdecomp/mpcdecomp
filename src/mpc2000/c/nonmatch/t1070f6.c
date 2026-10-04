/* differs: 150 size 116, image 64; +1 image `enter 4, 0` CL `enter 8, 0`; 172 size 116, image 64; +1 image `enter 4, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int W_5046;
extern int W_5048;

long __near dma_pos_reached(void)
{
	char loc_4[4];
	unsigned int ax;
	unsigned int dx;
	int flags;
	int t1;

	outpw(128, 0);
	t1 = inpw(132);
	dx = W_5048 & 15;
	*(int *)((char *)&loc_4 + 0) = W_5046;
	ax = inpw(134);
	if (dx > ax) {
		goto L1;
	}
	dx = (int)(((long)dx << 16 | (unsigned)*(int *)((char *)&loc_4 + 0)) - ((long)ax << 16 | (unsigned)t1) >> 16);
	flags = dx;
	if (CC(">", flags)) {
		goto L1;
	}
	if (CC("<", flags)) {
		goto L2;
	}
	if ((unsigned int)(*(int *)((char *)&loc_4 + 0) - t1) > 165) {
		goto L1;
	}
L2:
	return ((long)dx << 16 | (unsigned)1);
L1:
	return ((long)dx << 16 | (unsigned)0);
}
