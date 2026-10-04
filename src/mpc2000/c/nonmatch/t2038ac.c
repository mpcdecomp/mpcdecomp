/* differs: 150 size 92, image 96; +1 image `enter 4, 0` CL `enter 0xa, 0`; 172 size 92, image 96; +1 image `enter 4, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char TBL_OFF_ON_LABELS[1];
extern long __far __pascal cmd_dispatch_1E(int, int, long);

void __far __pascal cmd_dispatch_wrapper(char arg_4, int arg_2, int arg_0)
{
	char loc_4;
	char loc_3;
	char loc_2;
	char loc_1;
	unsigned int ax;
	int ax2;
	int p10;
	int p12;
	int p14;
	int p8;
	long t1;

	ax = arg_4;
	if (ax >= 64) {
		goto L1;
	}
	loc_4 = (char)((char)((char)ax / 16) + 65);
	ax2 = ((char)(arg_4 % 16) << 8 | (unsigned char)(char)(arg_4 / 16));
	arg_4 = (char)(ax2 >> 8);
	loc_3 = (char)((char)((signed char)((char)(ax2 >> 8) + 1) / 10) + 48);
	loc_2 = (char)((char)((signed char)((char)(ax2 >> 8) + 1) % 10) + 48);
	loc_1 = (char)0;
	p8 = arg_2;
	p10 = arg_0;
	p12 = SEG_STACK;
	p14 = (int)(unsigned)&loc_4;
	goto L2;
L1:
	p8 = arg_2;
	p10 = arg_0;
	p12 = SEG_DATA;
	p14 = (int)(unsigned)TBL_OFF_ON_LABELS;
L2:
	t1 = cmd_dispatch_1E(p8, p10, ((long)p12 << 16 | (unsigned)p14));
	return;
}
