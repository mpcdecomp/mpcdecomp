/* differs: 150 size 98, image 84; +16 image `or cx, ax` CL `or ax, cx`; 172 size 98, image 84; +16 image `or cx, ax` CL `or ax, cx` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_REC_MODE;
extern int REC_DMA_POS;
extern unsigned char W_503E[1];
extern unsigned char W_506A[1];
extern void __far __pascal dma_field_write(int, unsigned char far *, int);
extern void __far mpc_poll_status(void);

void __near dma_06CFC(void)
{
	int ax;
	int t1;
	int t2;
	int t3;

	mpc_poll_status();
	outpw(128, 0);
	REC_DMA_POS = inpw(130) >> 12 | inpw(132) << 4;
	dma_field_write(0, (unsigned char far *)W_503E, 0x1e06);
	if (G_REC_MODE != 2) {
		goto L1;
	}
	dma_field_write(16, (unsigned char far *)W_506A, 0x1e06);
L1:
	outp(-0x3fc1, (char)(inp(-0x3fc1) & -9));
	ax = (1 << 8 | (unsigned char)inp(136));
	outpw(136, ax);
L2:
	ax = ((char)(ax >> 8) << 8 | (unsigned char)inp(136));
	if (((char)ax & -128) != 0) {
		goto L2;
	}
	return;
}
