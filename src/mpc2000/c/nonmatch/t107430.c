/* differs: 150 size 322, image 216; +0 image `mov al, byte ptr [0x2c12]` CL `enter 0x12, 0`; 172 size 322, image 216; +0 image `mov al, byte ptr [0x2dda]` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_2E3A;
extern char B_2E3B;
extern char B_2E40;
extern char B_2E41;
extern unsigned char G_REC_MODE[1];
extern unsigned char P_73C2[1];
extern char REC_CURSOR;
extern char REC_INPUT_X;
extern char REC_INPUT_Y;
extern char REC_MODE_X;
extern char REC_MODE_Y;
extern char REC_THRESH_X;
extern char REC_THRESH_Y;
extern char REC_TIME_X;
extern char REC_TIME_Y;
extern unsigned char SAMPLE_INPUT[1];
extern unsigned char SAMPLE_MONITOR[1];
extern unsigned char SAMPLE_PREREC[1];
extern unsigned char SAMPLE_THRESHOLD[1];
extern unsigned char SAMPLE_TIME[1];
extern void __far L_03808();
extern void __far L_07386();
extern void __far L_07398();
extern void __far L_073A8();
extern long __far __pascal field_register_s8(unsigned char far *, int, int, int, int, char, int, int, int, int);
extern int __near fn_0683A(void);
extern long __far __pascal status_read_6A(unsigned char far *, int, int, int, int, char, void far *, int, int);
extern long __far __pascal status_read_6A_3(unsigned char far *, int, int, int, int, char, int, int, int, int);
extern long __far __pascal voice_trigger_full(int, int, int, int, int, int, int, int);

long __near rec_arm_field(void)
{
	unsigned int ax;
	int ax2;
	int ax3;
	int ax4;
	int ax5;
	int ax6;
	int ax7;
	int ax8;
	int p10;
	int p12;
	int p14;
	int p16;
	int p2;
	int p4;
	int p6;
	int p8;
	int t1;

	ax = REC_CURSOR;
	if (ax > 5) {
		goto L1;
	}
	ax2 = ax * 2;
	ax = ax2;
	switch ((unsigned int)(unsigned)(P_73C2 + ax2)) {
	case 0:
		goto L2;
	case 1:
		goto L3;
	case 2:
		goto L4;
	case 3:
		goto L5;
	case 4:
		goto L6;
	case 5:
		goto L7;
	}
L1:
	REC_CURSOR = (char)0;
	goto L2;
L3:
	p2 = SEG_DATA;
	p4 = (int)(unsigned)G_REC_MODE;
	p6 = 2;
	ax7 = ((char)(ax >> 8) << 8 | (unsigned char)REC_MODE_X);
	p8 = ax7;
	p10 = ((char)(ax7 >> 8) << 8 | (unsigned char)REC_MODE_Y);
	p12 = 7;
	p14 = 0x0000 /* TEXT1_SEG */;
	p16 = (int)(unsigned)L_07398;
	goto L8;
L4:
	p2 = SEG_DATA;
	p4 = (int)(unsigned)SAMPLE_MONITOR;
	p6 = 1;
	ax6 = ((char)(ax >> 8) << 8 | (unsigned char)B_2E3A);
	p8 = ax6;
	p10 = ((char)(ax6 >> 8) << 8 | (unsigned char)B_2E3B);
	p12 = 4;
	p14 = 0x0000 /* TEXT1_SEG */;
	p16 = (int)(unsigned)L_073A8;
	goto L8;
L5:
	ax5 = ((char)(ax >> 8) << 8 | (unsigned char)REC_THRESH_X);
	return field_register_s8((unsigned char far *)SAMPLE_THRESHOLD, -64, 0, 2, ax5, REC_THRESH_Y, 0, 0, 0, 0);
L6:
	t1 = fn_0683A();
	ax4 = ((char)(t1 >> 8) << 8 | (unsigned char)REC_TIME_X);
	return status_read_6A((unsigned char far *)SAMPLE_TIME, 0, t1, 4, ax4, REC_TIME_Y, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)L_03808), 0, 0);
L7:
	ax3 = ((char)(ax >> 8) << 8 | (unsigned char)B_2E40);
	return status_read_6A_3((unsigned char far *)SAMPLE_PREREC, 0, 100, 3, ax3, B_2E41, 0, 0, 0, 0);
L2:
	p2 = SEG_DATA;
	p4 = (int)(unsigned)SAMPLE_INPUT;
	p6 = 1;
	ax8 = ((char)(ax >> 8) << 8 | (unsigned char)REC_INPUT_X);
	p8 = ax8;
	p10 = ((char)(ax8 >> 8) << 8 | (unsigned char)REC_INPUT_Y);
	p12 = 8;
	p14 = 0x0000 /* TEXT1_SEG */;
	p16 = (int)(unsigned)L_07386;
L8:
	return voice_trigger_full(p2, p4, p6, p8, p10, p12, p14, p16);
}
