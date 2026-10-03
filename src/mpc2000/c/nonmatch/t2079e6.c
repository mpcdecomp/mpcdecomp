/* differs: 150 +1 image `enter 0xe, 0` CL `enter 0xc, 0`; 172 +1 image `enter 0xe, 0` CL `enter 0xc, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int TBL_PITCH_RATIO[1];

void __far __pascal sample_calc_offset(int arg_4, int arg_2, int arg_0)
{
	char loc_5[3];
	int loc_2;
	unsigned ax;
	int ax2;
	long t1;
	long t2;
	long t3;

	if ((arg_4 | arg_2) == 0) {
		goto L1;
	}
	ax = *(int far *)MK_FP(arg_4, arg_2 + 32);
	loc_2 = *(int far *)MK_FP(arg_4, arg_2 + 34);
	loc_5[0] = *(char far *)MK_FP(arg_4, arg_2 + 37);
	ax2 = TBL_PITCH_RATIO[arg_0];
	if ((loc_2 | ax) == 0) {
		goto L1;
	}
	t1 = (long)(int)loc_5[0] * (long)(int)ax2;
	t2 = t1 * 0x193cL;
	t3 = t2 / ((long)loc_2 << 16 | (unsigned)ax);
	if ((int)(t3 >> 16) > 0) {
		goto L1;
	}
	if ((int)(t3 >> 16) < 0) {
		goto L2;
	}
	if ((unsigned int)(int)t3 < 0x2710) {
		goto L2;
	}
L1:
L2:
	return;
}
