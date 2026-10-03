/* differs: 150 size 268, image 110; +0 image `push bp` CL `enter 0x12, 0`; 172 size 268, image 110; +0 image `push bp` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char STR_FAIL[1];
extern unsigned char STR_OKAY[1];
extern unsigned char STR_TESTING_MEMORY[1];
extern int W_4EFC;
extern long __far __pascal cmd_dispatch_1E(int, int, unsigned char far *);
extern void __far cmd_far_stub(void);
extern void __far __pascal draw_unsigned_value(int, int, long, int);

void __near __pascal mpc_mode_setup(int arg_2, int arg_0)
{
	unsigned int ax;
	unsigned int ax2;
	unsigned int ax3;
	unsigned int ax4;
	unsigned int ax5;
	int ax6;
	int ax7;
	unsigned int dx;
	unsigned int dx2;
	unsigned int dx3;
	unsigned int dx4;
	long t1;
	int t2;
	int t3;
	long t4;

	if (W_4EFC < 0) {
		goto L1;
	}
	t1 = cmd_dispatch_1E(7, 28, (unsigned char far *)STR_TESTING_MEMORY);
	if (W_4EFC != 0) {
		goto L2;
	}
	ax = arg_0;
	dx = arg_2;
	ax2 = ax * 2;
	dx2 = dx * 2 + (ax2 < ax);
	ax3 = ax2 * 2 + (dx2 < dx);
	dx3 = dx2 * 2 + (ax3 < ax2);
	ax4 = ax3 * 2 + (dx3 < dx2);
	dx4 = dx3 * 2 + (ax4 < ax3);
	ax5 = ax4 * 2 + (dx4 < dx3);
	ax6 = ax5 * 2 + (dx4 * 2 + (ax5 < ax4) < dx4);
	draw_unsigned_value(115, 28, ((long)(ax6 & 15) << 16 | (unsigned)ax6), 6);
	cmd_far_stub();
	return;
L2:
	if (W_4EFC != 2) {
		goto L3;
	}
	ax7 = (int)(unsigned)STR_OKAY;
	goto L4;
L3:
	ax7 = (int)(unsigned)STR_FAIL;
L4:
	t4 = cmd_dispatch_1E(127, 28, MK_FP(SEG_DATA, ax7));
L1:
	return;
}
