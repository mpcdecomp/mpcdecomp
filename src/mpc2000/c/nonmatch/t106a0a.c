/* differs: 150 size 244, image 216; +0 image `push bp` CL `enter 4, 0`; 172 size 244, image 216; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_METER_L_LEVEL;
extern int G_METER_L_PEAK;
extern int G_METER_R_LEVEL;
extern int G_METER_R_PEAK;
extern char G_REC_MODE;
extern int REC_PEAK_L;
extern int REC_PEAK_MONO;
extern int REC_PEAK_R;
extern int W_2E2C;
extern int __far __fastcall X_03B24(int);
extern long __far cmd_far_stub2(void);
extern long __near __pascal io_ctrl_setup(int);

int __near __pascal ctrl_port_18_write(int arg_0)
{
	int ax;
	int ax2;
	int ax3;
	unsigned int si2;
	unsigned si3;
	int si4;
	int si5;
	int si6;
	int si7;
	int si8;
	long t1;
	long t2;
	long t3;
	long t4;

	si2 = arg_0 - W_2E2C;
	if (si2 >= 50) {
		goto L1;
	}
	goto L2;
L1:
	W_2E2C = arg_0;
	t1 = cmd_far_stub2();
	if (si2 <= 0x200) {
		goto L3;
	}
	si2 = 0x200;
L3:
	ax = 0x200 - si2;
	G_METER_L_LEVEL = (unsigned int)(ax * G_METER_L_LEVEL) >> 9;
	G_METER_R_LEVEL = (unsigned int)(ax * G_METER_R_LEVEL) >> 9;
	if (G_REC_MODE != 2) {
		goto L4;
	}
	t2 = io_ctrl_setup(X_03B24(REC_PEAK_L));
	si3 = (int)t2;
	if (G_METER_L_PEAK >= (int)t2) {
		goto L5;
	}
	G_METER_L_PEAK = (int)t2;
L5:
	si4 = si3 + 1;
	if (si4 <= G_METER_L_LEVEL) {
		goto L6;
	}
	G_METER_L_LEVEL = si4;
L6:
	ax2 = REC_PEAK_R;
	goto L7;
L4:
	if (G_REC_MODE != 0) {
		goto L8;
	}
	t3 = io_ctrl_setup(X_03B24(REC_PEAK_MONO));
	si5 = (int)t3;
	if (G_METER_L_PEAK >= (int)t3) {
		goto L9;
	}
	G_METER_L_PEAK = (int)t3;
L9:
	si6 = si5 + 1;
	if (si6 <= G_METER_L_LEVEL) {
		goto L10;
	}
	G_METER_L_LEVEL = si6;
	goto L10;
L8:
	if (G_REC_MODE != 1) {
		goto L10;
	}
	ax2 = REC_PEAK_MONO;
L7:
	t4 = io_ctrl_setup(X_03B24(ax2));
	si7 = (int)t4;
	if (G_METER_R_PEAK >= (int)t4) {
		goto L11;
	}
	G_METER_R_PEAK = (int)t4;
L11:
	si8 = si7 + 1;
	if (si8 <= G_METER_R_LEVEL) {
		goto L10;
	}
	G_METER_R_LEVEL = si8;
L10:
	ax3 = 0;
	REC_PEAK_R = ax3;
	REC_PEAK_L = ax3;
	REC_PEAK_MONO = ax3;
L2:
	return ax3;
}
