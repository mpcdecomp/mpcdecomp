/* differs: 150 size 448, image 318; +0 image `push si` CL `enter 0x14, 0`; 172 size 448, image 318; +0 image `push si` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char G_UI_SUBMODE;
extern unsigned char P_49F0[1];
extern char WIN_FIELD_BOX_W;
extern long __far channel_get_ptr(int);
extern void __far far_04B42();
extern long __far __pascal status_read_6A(int, int, int, int, int, int, int, int, int, void far *);
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, void far *);
extern long __far __pascal voice_trigger_full(int, int, int, int, int, int, void far *);
extern long __far win_keys_merge_disable(void);

long __near fx_reverb_arm_field(void)
{
	int ax;
	int ax2;
	int dx;
	int dx2;
	int p10;
	int p102;
	int p12;
	int p122;
	int p14;
	int p142;
	int p16;
	int p162;
	int p4;
	int p42;
	int p6;
	int p62;
	int p8;
	int p82;
	char far *t1;
	long t2;
	long t3;
	long t4;
	long t5;
	long t6;

	if (G_FLAG_1589 == 0) {
		goto L1;
	}
	goto L2;
L1:
	G_FLAG_1589 = (char)(G_FLAG_1589 + 1);
	t1 = (char far *)channel_get_ptr(G_STATE_9D8B);
	if (*t1 < 4) {
		goto L3;
	}
	if (G_UI_SUBMODE < 4) {
		goto L3;
	}
	G_UI_SUBMODE = (unsigned char)0;
L3:
	if (G_UI_SUBMODE > 6) {
		goto L4;
	}
	switch ((unsigned int)(unsigned)(P_49F0 + G_UI_SUBMODE * 2)) {
	case 0:
		goto L5;
	case 1:
		goto L6;
	case 2:
		goto L7;
	case 3:
		goto L8;
	case 4:
		goto L9;
	case 5:
		goto L10;
	case 6:
		goto L11;
	}
L4:
	G_UI_SUBMODE = (unsigned char)0;
	goto L5;
L6:
	t5 = status_read_6A(FP_SEG(t1), FP_OFF(t1) + 2, 0, 90, 2, 97, 21, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)far_04B42));
	ax = (int)t5;
	dx = (int)(t5 >> 16);
	goto L12;
L7:
	if (*t1 <= 3) {
		goto L13;
	}
	dx2 = FP_SEG(t1);
	ax2 = FP_OFF(t1) + 9;
	goto L14;
L13:
	dx2 = FP_SEG(t1);
	ax2 = FP_OFF(t1) + 7;
L14:
	p42 = dx2;
	p62 = ax2;
	p82 = 0;
	p102 = 99;
	p122 = 2;
	p142 = 97;
	p162 = 31;
L15:
	t4 = status_read_6A_3(p42, p62, p82, p102, p122, p142, p162, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)far_04B42));
	ax = (int)t4;
	dx = (int)(t4 >> 16);
	goto L12;
L8:
	p42 = FP_SEG(t1);
	p62 = FP_OFF(t1) + 8;
	p82 = 0;
	p102 = 99;
	p122 = 2;
	p142 = 97;
	p162 = 41;
	goto L15;
L9:
	p42 = FP_SEG(t1);
	p62 = FP_OFF(t1) + 4;
	p82 = 0;
	p102 = 99;
	p122 = 2;
	p142 = 199;
	p162 = 21;
	goto L15;
L10:
	p4 = FP_SEG(t1);
	p6 = FP_OFF(t1) + 5;
	p8 = 0;
	p10 = 40;
	p12 = 2;
	p14 = 199;
	p16 = 31;
L16:
	t2 = status_read_6A_3(p4, p6, p8, p10, p12, p14, p16, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)far_04B42));
	t3 = win_keys_merge_disable();
	ax = (int)t3;
	dx = (int)(t3 >> 16);
	WIN_FIELD_BOX_W = (char)18;
	goto L12;
L11:
	p4 = FP_SEG(t1);
	p6 = FP_OFF(t1) + 6;
	p8 = 40;
	p10 = 66;
	p12 = 2;
	p14 = 199;
	p16 = 41;
	goto L16;
L5:
	t6 = voice_trigger_full(FP_SEG(t1), FP_OFF(t1), 6, 49, 11, 11, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)far_04B42));
	ax = (int)t6;
	dx = (int)(t6 >> 16);
L12:
	G_FLAG_1589 = (char)(G_FLAG_1589 - 1);
L2:
	return ((long)dx << 16 | (unsigned)ax);
}
