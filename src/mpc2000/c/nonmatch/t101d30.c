/* differs: 150 size 532, image 220; +0 image `mov al, byte ptr [0x4c8e]` CL `enter 0x1e, 0`; 172 size 532, image 220; +0 image `mov al, byte ptr [0x4eca]` CL `enter 0x1e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_4ECA;
extern char G_DSP_CHAN;
extern int __far far_01CA2(void);

void __near fn_01D30(void)
{
	int ax;
	int ax2;
	int ax3;
	int ax4;
	unsigned int bp;
	unsigned int bp2;
	unsigned int cx;
	unsigned int cx2;
	unsigned int cx3;
	unsigned int cx4;
	int dx;
	unsigned int dx2;
	int dx3;
	int flags;
	int p2;
	int t1;
	char far *t2;
	long t3;

	B_4ECA = (char)(B_4ECA + 1 & 1);
	t1 = far_01CA2();
	ax = ((char)t1 << 8 | (unsigned char)((char)t1 - *(char *)(0x0 + UNDEF)));
	if ((unsigned char)(char)ax >= 10) {
		goto L1;
	}
L2:
	return;
L1:
	*(char *)(0x0 + UNDEF) = (char)(ax >> 8);
	if (*(char *)(0x1 + UNDEF) != 1) {
		goto L2;
	}
	bp = *(int *)(0x8 + UNDEF);
	cx = *(int *)(0x6 + UNDEF);
	flags = bp - *(int *)(0xa + UNDEF);
	if (CC("==", flags)) {
		goto L2;
	}
	p2 = __flags(flags);
	t2 = (unsigned long)(unsigned char)(char)ax * (unsigned long)(unsigned int)*(int *)(0x4 + UNDEF);
	dx = (int)FP_SEG(t2);
	if ((char)(dx >> 8) == 0) {
		goto L3;
	}
	dx = 255;
L3:
	dx2 = ((char)dx << 8 | (unsigned char)(char)((int)t2 >> 8));
	ax2 = ((char)(int)FP_OFF(t2) << 8 | (unsigned char)(char)(int)FP_OFF(t2));
	__insn("popf", p2);
	if (CC(">u", UNDEF)) {
		goto L4;
	}
	cx2 = cx + ax2;
	bp2 = bp + dx2 + (cx2 < cx);
	if (bp2 <= (unsigned int)*(int *)(0xa + UNDEF)) {
		goto L5;
	}
	goto L6;
L4:
	cx2 = cx - ax2;
	bp2 = (int)(((long)bp << 16 | (unsigned)cx) - ((long)dx2 << 16 | (unsigned)ax2) >> 16);
	if (bp < dx2) {
		goto L6;
	}
	if (bp2 >= (unsigned int)*(int *)(0xa + UNDEF)) {
		goto L5;
	}
L6:
	bp2 = *(int *)(0xa + UNDEF);
L5:
	*(int *)(0x8 + UNDEF) = bp2;
	*(int *)(0x6 + UNDEF) = cx2;
	ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_4ECA);
	G_DSP_CHAN = (char)ax3;
	ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)G_DSP_CHAN);
	outpw(162, (unsigned char)(G_DSP_CHAN - 110));
	outpw(160, bp2);
	outpw(162, (unsigned char)(G_DSP_CHAN - 108));
	outpw(160, bp2);
	cx3 = cx2 * 2;
	cx4 = -1 - ((bp2 * 2 + (cx3 < cx2)) * 2 + (cx3 * 2 < cx3));
	t3 = (unsigned long)(unsigned int)*(int *)(0x10 + UNDEF) * (unsigned long)(unsigned int)cx4;
	outpw(162, (unsigned char)(G_DSP_CHAN - 116));
	outpw(160, (int)(t3 >> 16));
	outpw(162, (unsigned char)(G_DSP_CHAN - 112));
	outpw(160, (int)(t3 >> 16));
	dx3 = -(int)((unsigned long)(unsigned int)*(int *)(0x12 + UNDEF) * (unsigned long)(unsigned int)cx4 >> 16);
	outpw(162, (unsigned char)(G_DSP_CHAN + 124));
	outpw(160, dx3);
	outpw(162, (unsigned char)(G_DSP_CHAN + 126));
	outpw(160, dx3);
	G_DSP_CHAN = (char)ax4;
	return;
}
