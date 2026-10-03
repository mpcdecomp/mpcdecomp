/* differs: 150 size 158, image 160; +4 image `push si` CL `push di`; 172 size 158, image 160; +4 image `push si` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far __pascal bcd_display_calc();

int __far __pascal envelope_process_2(int arg_2, int arg_0)
{
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;

	loc_2 = 72;
	loc_4 = 4;
	loc_6 = 12;
	loc_8 = 2;
	if (bcd_display_calc((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 2) == 0) {
		goto L1;
	}
	if (bcd_display_calc((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2) == 0) {
		goto L1;
	}
	if (bcd_display_calc(arg_2, arg_0 + 0x91e, loc_2 * loc_8) == 0) {
		goto L1;
	}
	if (bcd_display_calc((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2) == 0) {
		goto L1;
	}
	if (bcd_display_calc((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2) == 0) {
		goto L1;
	}
	if (bcd_display_calc(arg_2, arg_0 + 0x9ae, loc_6 * loc_4) == 0) {
		goto L1;
	}
	return 1;
L1:
	return 0;
}
