/* differs: 150 size 308, image 246; +0 image `push si` CL `enter 0x10, 0`; 172 size 308, image 246; +0 image `push si` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[48];
    char f_30;
};
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char G_UI_FLAG;
extern char WIN_FIELD_BOX_W;
extern long __far L_050DC(void);
extern long __far channel_validate(int);
extern long __far __pascal field_register_s8(int, int, int, int, int, int, int, int, int, void far *);
extern void __far fx_redraw();
extern long __far __pascal status_read_6A(int, int, int, int, int, int, int, int, int, void far *);
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, void far *);
extern long __far win_keys_merge_disable(void);

long __near fx_echo_arm_field(void)
{
	int ax;
	int ax2;
	int dx;
	int p10;
	int p4;
	int p6;
	int p8;
	struct s1 far *t1;
	long t2;
	long t3;
	long t4;
	long t5;
	long t6;
	long t7;

	if (G_FLAG_1589 == 0) {
		goto L1;
	}
	goto L2;
L1:
	G_FLAG_1589 = (char)(G_FLAG_1589 + 1);
	t1 = (struct s1 far *)channel_validate(G_STATE_9D8B);
	if (G_UI_FLAG != 0) {
		goto L3;
	}
	goto L4;
L3:
	ax = G_UI_FLAG - 1;
	if (ax == 0) {
		goto L5;
	}
	if (ax == 1) {
		goto L6;
	}
	if (ax == 2) {
		goto L7;
	}
	if (ax != 3) {
		goto L8;
	}
	goto L9;
L8:
	G_UI_FLAG = (unsigned char)0;
	goto L4;
L5:
	t7 = status_read_6A_3(FP_SEG(t1), FP_OFF(t1) + 54, 0, 99, 2, 193, 11, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax2 = (int)t7;
	dx = (int)(t7 >> 16);
	goto L10;
L6:
	if (t1->f_30 != 2) {
		goto L11;
	}
	p4 = FP_SEG(t1);
	p6 = FP_OFF(t1) + 52;
	p8 = 0;
	p10 = 0x14f;
L12:
	t6 = status_read_6A(p4, p6, p8, p10, 3, 193, 21, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax2 = (int)t6;
	dx = (int)(t6 >> 16);
	goto L10;
L11:
	p4 = FP_SEG(t1);
	p6 = FP_OFF(t1) + 50;
	p8 = 0;
	p10 = 0x29e;
	goto L12;
L7:
	t4 = status_read_6A_3(FP_SEG(t1), FP_OFF(t1) + 55, 20, 66, 2, 193, 31, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	t5 = win_keys_merge_disable();
	ax2 = (int)t5;
	dx = (int)(t5 >> 16);
	WIN_FIELD_BOX_W = (char)18;
	goto L10;
L9:
	t2 = field_register_s8(FP_SEG(t1), FP_OFF(t1) + 49, -50, 50, 2, 193, 41, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax2 = (int)t2;
	dx = (int)(t2 >> 16);
	goto L10;
L4:
	t3 = L_050DC();
	ax2 = (int)t3;
	dx = (int)(t3 >> 16);
L10:
	G_FLAG_1589 = (char)(G_FLAG_1589 - 1);
L2:
	return ((long)dx << 16 | (unsigned)ax2);
}
