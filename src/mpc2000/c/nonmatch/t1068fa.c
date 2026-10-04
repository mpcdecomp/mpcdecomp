/* differs: 150 size 264, image 272; +1 image `enter 4, 0` CL `enter 8, 0`; 172 size 264, image 272; +1 image `enter 4, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char BUF_REC_METER_BAR[1];
extern int G_METER_L_LEVEL;
extern int G_METER_L_PEAK;
extern int G_METER_R_LEVEL;
extern int G_METER_R_PEAK;
extern char G_REC_MODE;
extern char SAMPLE_THRESHOLD;
extern long __far __pascal cmd_dispatch_1E(int, int, char far *);
extern void __far __pascal cmd_ratio_setup(int, int, int);
extern long __near __pascal io_ctrl_setup(int);
extern long __far __pascal string_copy_setup(int, long);

void __near io_write_caller(void)
{
	int loc_4;
	char loc_3;
	int loc_2;
	char loc_1;
	long t1;
	long t10;
	long t2;
	int t3;
	int t4;
	long t5;
	int t6;
	int t7;
	long t8;
	long t9;

	*(char *)((char *)&loc_4 + 0) = (char)40;
	loc_3 = (char)30;
	*(char *)((char *)&loc_2 + 0) = (char)-52;
	loc_1 = (char)16;
	t1 = string_copy_setup(0, *(long *)((char *)&loc_4 + 0));
	if (SAMPLE_THRESHOLD <= (char)-64) {
		goto L1;
	}
	t2 = io_ctrl_setup(SAMPLE_THRESHOLD);
	if (G_REC_MODE == 1) {
		goto L2;
	}
	cmd_ratio_setup((int)t2 * 6 + 40, 30, 9);
L2:
	if (G_REC_MODE == 0) {
		goto L1;
	}
	cmd_ratio_setup((int)t2 * 6 + 40, 39, 9);
L1:
	t5 = string_copy_setup(1, *(long *)((char *)&loc_4 + 0));
	if (G_REC_MODE == 1) {
		goto L3;
	}
	cmd_ratio_setup(G_METER_L_PEAK * 6 + 40, 30, 11);
L3:
	if (G_REC_MODE == 0) {
		goto L4;
	}
	cmd_ratio_setup(G_METER_R_PEAK * 6 + 40, 39, 11);
L4:
	t8 = string_copy_setup(2, *(long *)((char *)&loc_4 + 0));
	if (G_REC_MODE == 1) {
		goto L5;
	}
	BUF_REC_METER_BAR[G_METER_L_LEVEL] = (char)0;
	t9 = cmd_dispatch_1E(40, 30, (char far *)BUF_REC_METER_BAR);
	BUF_REC_METER_BAR[G_METER_L_LEVEL] = (char)10;
L5:
	if (G_REC_MODE == 0) {
		goto L6;
	}
	BUF_REC_METER_BAR[G_METER_R_LEVEL] = (char)0;
	t10 = cmd_dispatch_1E(40, 39, (char far *)BUF_REC_METER_BAR);
	BUF_REC_METER_BAR[G_METER_R_LEVEL] = (char)10;
L6:
	return;
}
