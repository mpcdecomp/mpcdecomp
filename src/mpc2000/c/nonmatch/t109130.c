/* differs: 150 size 138, image 124; +1 image `enter 2, 0` CL `enter 8, 0`; 172 size 138, image 124; +1 image `enter 2, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0

long __near __pascal lcd_ratio_calc(int arg_0)
{
	int ax;
	int ax2;
	int bx;
	unsigned bx2;
	int dx;
	long t1;

	ax = (int)(arg_0 + (unsigned char)(char)-(arg_0 < 0)) >> 8;
	dx = arg_0 % 0x100;
	if (ax <= 12) {
		goto L1;
	}
	return ((long)dx << 16 | (unsigned)120);
L1:
	if (ax >= -12) {
		goto L2;
	}
	return ((long)dx << 16 | (unsigned)-120);
L2:
	t1 = (long)(int)dx * 100L;
	if ((int)t1 <= 0) {
		goto L3;
	}
	bx = (int)t1 + 128;
	goto L4;
L3:
	bx = (int)t1 - 128;
L4:
	ax2 = bx / 0x100;
	if (ax2 <= 0) {
		goto L5;
	}
	bx2 = ax2 + 5;
	goto L6;
L5:
	bx2 = ax2 - 5;
L6:
	return ((long)ax << 16 | (unsigned)(bx2 / 10 + ((ax << 2) + ax) * 2));
}
