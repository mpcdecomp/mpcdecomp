/* differs: 150 size 64, image 50; +0 image `push bp` CL `enter 2, 0`; 172 size 64, image 50; +0 image `push bp` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far _longjmp(int, int, int);
extern int __far int2F_call_fn5(void);

void __near __pascal int2F_fn5_caller(int arg_2, int arg_0)
{
	int ax;
	int dx;
	int p10;
	int p6;
	int p8;
	long t1;

L1:
	ax = arg_0;
	dx = arg_2;
	arg_0 = arg_0 - 1;
	arg_2 = arg_2 - (arg_0 == 0);
	if ((dx | ax) == 0) {
		goto L2;
	}
	if (int2F_call_fn5() >= 0) {
		goto L1;
	}
	p6 = SEG_DATA;
	p8 = -0x72de;
	p10 = 0x0000;
	t1 = _longjmp(p8, p6, 4);
	goto L1;
L2:
	return;
}
