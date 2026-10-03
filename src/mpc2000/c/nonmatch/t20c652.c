/* differs: 150 size 104, image 106; +1 image `enter 8, 0` CL `enter 6, 0`; 172 size 104, image 106; +1 image `enter 8, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far __pascal bcd_display_calc();

int __far __pascal ctrl_port_48_B8_3(int arg_2, int arg_0)
{
	int loc_6;
	int loc_4;
	int loc_2;
	unsigned int di;

	loc_4 = 64;
	loc_2 = 25;
	if (bcd_display_calc((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2) == 0) {
		goto L1;
	}
	if (bcd_display_calc((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2) == 0) {
		goto L1;
	}
	di = 0;
	loc_6 = arg_2;
L2:
	if (bcd_display_calc(loc_6, arg_0 + 34 + di * 29, loc_2) == 0) {
		goto L1;
	}
	di = di + 1;
	if (di < 64) {
		goto L2;
	}
	return 1;
L1:
	return 0;
}
