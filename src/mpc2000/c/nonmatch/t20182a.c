/* differs: 150 size 148, image 40; +0 image `out 0x80, ax` CL `enter 0xe, 0`; 172 size 148, image 40; +0 image `out 0x80, ax` CL `enter 0xe, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

long __far __fastcall X_0184A(int ax)
{
	int ax2;
	unsigned int ax3;
	unsigned int ax4;
	unsigned int ax5;
	unsigned int ax6;
	unsigned int t1;

	outpw(128, ax);
	ax2 = inpw(130) >> 12;
	t1 = inpw(132);
	ax3 = t1 * 2;
	ax4 = ax3 * 2;
	ax5 = ax4 * 2;
	ax6 = ax5 * 2;
	return ((long)((((inpw(134) * 2 + (ax3 < t1)) * 2 + (ax4 < ax3)) * 2 + (ax5 < ax4)) * 2 + (ax6 < ax5)) << 16 | (unsigned)(ax6 | ax2));
}
