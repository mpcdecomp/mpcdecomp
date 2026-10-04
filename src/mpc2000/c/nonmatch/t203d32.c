/* differs: 150 size 58, image 68; +0 image `push ds` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_980A_V150;

int __far __fastcall __loadds L_03D32(void)
{
	int ax;
	int ax2;
	int ax3;

	ax = ((char)(ax2 >> 8) << 8 | (unsigned char)(0 - (B_980A_V150 == 0)));
	ax3 = ((char)(ax >> 8) << 8 | (unsigned char)-(char)ax);
	B_980A_V150 = (char)ax3;
	return ax3;
}
