/* differs: 150 size 130, image 118; +0 image `push bp` CL `enter 6, 0`; 172 size 130, image 118; +0 image `push bp` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char TBL_FILENAME_CHARSET[1];

void __near __pascal lcd_screen_helper(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int ax;
	int ax2;
	unsigned bx;
	int si;

	si = 0;
	ax = arg_2;
L1:
	ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(arg_2, arg_0 + si));
	ax = ((char)-((char)ax2 < 0) << 8 | (unsigned char)TBL_FILENAME_CHARSET[(char)ax2]);
	*(char far *)MK_FP(arg_6, arg_4 + si) = (char)ax;
	si = si + 1;
	if (si < 12) {
		goto L1;
	}
	bx = 11;
L2:
	if (*(char far *)MK_FP(arg_6, bx + arg_4) != 32) {
		goto L3;
	}
	bx = bx - 1;
	if (bx >= 0) {
		goto L2;
	}
L3:
	if (bx < 0) {
		goto L4;
	}
L5:
	if (*(char far *)MK_FP(arg_6, bx + arg_4) != 32) {
		goto L6;
	}
	*(char far *)MK_FP(arg_6, arg_4 + bx) = (char)95;
L6:
	bx = bx - 1;
	if (bx >= 0) {
		goto L5;
	}
L4:
	__stos2(((long)arg_6 << 16 | (unsigned)(arg_4 + 12)), 0x2020, 4);
	*(char far *)MK_FP(arg_6, arg_4 + 16) = (char)0;
	return;
}
