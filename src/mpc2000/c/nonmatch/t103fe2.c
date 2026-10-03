/* differs: 150 size 214, image 160; +0 image `push si` CL `enter 0x16, 0`; 172 size 214, image 160; +0 image `push si` CL `enter 0x16, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char G_UI_MODE;
extern void __far L_03808();
extern long __far X_04E24(void);
extern long __far channel_validate(int);
extern long __far __pascal field_register_s8(int, int, int, int, int, int, int, int, int, void far *);
extern void __far fx_redraw();
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, void far *);

long __near fx_mod_arm_field(void)
{
	int ax;
	int ax2;
	int dx;
	int p10;
	int p12;
	int p14;
	int p16;
	int p18;
	int p20;
	int p4;
	int p6;
	int p8;
	char far *t1;
	long t2;
	long t3;
	long t4;

	if (G_FLAG_1589 == 0) {
		goto L1;
	}
	goto L2;
L1:
	G_FLAG_1589 = (char)(G_FLAG_1589 + 1);
	t1 = channel_validate(G_STATE_9D8B);
	if (G_UI_MODE == 0) {
		goto L3;
	}
	ax = G_UI_MODE - 1;
	if (ax == 0) {
		goto L4;
	}
	if (ax == 1) {
		goto L5;
	}
	if (ax == 2) {
		goto L6;
	}
	G_UI_MODE = (unsigned char)0;
	goto L3;
L4:
	p4 = (int)FP_SEG(t1);
	p6 = (int)FP_OFF(t1) + 24;
	p8 = 0;
	p10 = 99;
	p12 = 2;
	p14 = 187;
	p16 = 21;
	p18 = 0x0b50 /* TEXT2_SEG */;
	p20 = (int)(unsigned)L_03808;
L7:
	t3 = status_read_6A_3(p4, p6, p8, p10, p12, p14, p16, p18, p20, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax2 = (int)t3;
	dx = (int)(t3 >> 16);
	goto L8;
L5:
	p4 = (int)FP_SEG(t1);
	p6 = (int)FP_OFF(t1) + 25;
	p8 = 0;
	p10 = 99;
	p12 = 2;
	p14 = 187;
	p16 = 31;
	p18 = 0;
	p20 = 0;
	goto L7;
L6:
	t2 = field_register_s8((int)FP_SEG(t1), (int)FP_OFF(t1) + 26, -50, 50, 2, 187, 41, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax2 = (int)t2;
	dx = (int)(t2 >> 16);
	goto L8;
L3:
	t4 = X_04E24();
	ax2 = (int)t4;
	dx = (int)(t4 >> 16);
L8:
	G_FLAG_1589 = (char)(G_FLAG_1589 - 1);
L2:
	return ((long)dx << 16 | (unsigned)ax2);
}
