/* differs: 150 size 150, image 58; +0 image `push bp` CL `enter 0x12, 0`; 172 size 150, image 58; +0 image `push bp` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __near v53_read_timer(void);

void __far __pascal smem_poll_ready(unsigned int arg_2, int arg_0)
{
	unsigned int ax;
	unsigned int ax2;
	unsigned int ax3;
	unsigned int ax4;
	unsigned int ax5;
	int t1;

	t1 = v53_read_timer();
	ax = arg_2 * 2;
	ax2 = ax * 2;
	ax3 = ax2 * 2;
	ax4 = ax3 * 2;
	ax5 = ax4 + arg_0;
	outpw(t1 + 4, ax5);
	outp(t1 + 6, (char)((((ax < arg_2) * 2 + (ax2 < ax)) * 2 + (ax3 < ax2)) * 2 + (ax4 < ax3) + (ax5 < ax4)));
	return;
}
