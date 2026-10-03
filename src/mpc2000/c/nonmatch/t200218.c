/* differs: 150 size 66, image 64; +0 image `push bp` CL `enter 2, 0`; 172 size 66, image 64; +0 image `push bp` CL `enter 2, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern void __far __pascal cmd_ratio_setup(int, int, int);
extern void __far __pascal draw_unsigned_value(int, int, long, int);

void __far __pascal draw_signed_value(int arg_8, int arg_6, int arg_4, int arg_2, int arg_0)
{
	int ax;
	int t1;
	int t2;

	ax = 32;
	if (arg_4 >= 0) {
		goto L1;
	}
	arg_2 = -arg_2;
	arg_4 = arg_4 + (arg_2 != 0);
	arg_4 = -arg_4;
	ax = ((char)(ax >> 8) << 8 | (unsigned char)45);
L1:
	cmd_ratio_setup(arg_8, arg_6, ax);
	draw_unsigned_value(arg_8 + 6, arg_6, *(long *)((char *)&arg_2 + 0), arg_0);
	return;
}
