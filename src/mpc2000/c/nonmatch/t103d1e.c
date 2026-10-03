/* differs: 150 size 772, image 410; +1 image `enter 4, 0` CL `enter 0x18, 0`; 172 size 772, image 410; +1 image `enter 4, 0` CL `enter 0x18, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char FILTER4_CURSOR;
extern char G_FLAG_1589;
extern char G_STATE_9D8B;
extern unsigned char P_3CD0[1];
extern char WIN_FIELD_BOX_W;
extern void __far L_03808();
extern long __far channel_validate(int);
extern long __far __pascal field_register_s8(int, int, int, int, int, int, int, int, int, void far *);
extern void __far fx_redraw();
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, void far *);
extern long __far win_keys_merge_disable(void);

long __near midi_note_handler(void)
{
	long t5;
	long t4;
	long t3;
	long t2;
	long t1;
	int si;
	int p26;
	int p24;
	int p223;
	int p222;
	int p22;
	int p203;
	int p202;
	int p20;
	int p183;
	int p182;
	int p18;
	int p163;
	int p162;
	int p16;
	int p143;
	int p142;
	int p14;
	int p123;
	int p122;
	int p12;
	int p103;
	int p102;
	int p10;
	int dx;
	int ax;

	if (G_FLAG_1589 == 0) {
		goto L1;
	}
	goto L2;
L1:
	G_FLAG_1589 = (char)(G_FLAG_1589 + 1);
	t1 = channel_validate(G_STATE_9D8B);
	si = (int)t1;
	if (FILTER4_CURSOR > 13) {
		goto L3;
	}
	switch ((unsigned int)(unsigned)(P_3CD0 + FILTER4_CURSOR * 2)) {
	case 0:
		goto L4;
	case 1:
		goto L5;
	case 2:
		goto L6;
	case 3:
		goto L7;
	case 4:
		goto L8;
	case 5:
		goto L9;
	case 6:
		goto L10;
	case 7:
		goto L11;
	case 8:
		goto L12;
	case 9:
		goto L13;
	case 10:
		goto L14;
	case 11:
		goto L15;
	case 12:
		goto L16;
	case 13:
		goto L17;
	}
L3:
	FILTER4_CURSOR = (unsigned char)0;
	goto L4;
L5:
	p10 = (int)(t1 >> 16);
	p12 = si + 15;
	p14 = -37;
	p16 = 12;
	p18 = 2;
	p20 = 85;
	p22 = 11;
L18:
	t3 = field_register_s8(p10, p12, p14, p16, p18, p20, p22, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax = (int)t3;
	dx = (int)(t3 >> 16);
	goto L19;
L6:
	p102 = (int)(t1 >> 16);
	p122 = si + 11;
	p142 = 12;
	p162 = 56;
	p182 = 2;
	p202 = 49;
	p222 = 21;
	goto L20;
L7:
	p10 = (int)(t1 >> 16);
	p12 = si + 12;
	p14 = -37;
	p16 = 12;
	p18 = 2;
	p20 = 85;
	p22 = 21;
	goto L18;
L8:
	p103 = (int)(t1 >> 16);
	p123 = si + 13;
	p143 = 0;
	p163 = 99;
	p183 = 2;
	p203 = 127;
L21:
	p223 = 21;
L22:
	p24 = 0;
	p26 = 0;
L23:
	t2 = status_read_6A_3(p103, p123, p143, p163, p183, p203, p223, p24, p26, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	ax = (int)t2;
	dx = (int)(t2 >> 16);
	goto L19;
L9:
	p103 = (int)(t1 >> 16);
	p123 = si + 18;
	p143 = 0;
	p163 = 99;
	p183 = 2;
	p203 = 157;
	p223 = 21;
L24:
	p24 = 0x0b50 /* TEXT2_SEG */;
	p26 = (int)(unsigned)L_03808;
	goto L23;
L10:
	p103 = (int)(t1 >> 16);
	p123 = si + 19;
	p143 = 0;
	p163 = 99;
	p183 = 2;
	p203 = 211;
	goto L21;
L11:
	p102 = (int)(t1 >> 16);
	p122 = si + 8;
	p142 = 12;
	p162 = 56;
	p182 = 2;
	p202 = 49;
	p222 = 31;
	goto L20;
L12:
	p10 = (int)(t1 >> 16);
	p12 = si + 9;
	p14 = -37;
	p16 = 12;
	p18 = 2;
	p20 = 85;
	p22 = 31;
	goto L18;
L13:
	p103 = (int)(t1 >> 16);
	p123 = si + 10;
	p143 = 0;
	p163 = 99;
	p183 = 2;
	p203 = 127;
L25:
	p223 = 31;
	goto L22;
L14:
	p103 = (int)(t1 >> 16);
	p123 = si + 16;
	p143 = 0;
	p163 = 99;
	p183 = 2;
	p203 = 157;
	p223 = 31;
	goto L24;
L15:
	p103 = (int)(t1 >> 16);
	p123 = si + 17;
	p143 = 0;
	p163 = 99;
	p183 = 2;
	p203 = 211;
	goto L25;
L16:
	p102 = (int)(t1 >> 16);
	p122 = si + 6;
	p142 = 4;
	p162 = 34;
	p182 = 2;
	p202 = 49;
	p222 = 41;
	goto L20;
L17:
	p10 = (int)(t1 >> 16);
	p12 = si + 7;
	p14 = -37;
	p16 = 12;
	p18 = 2;
	p20 = 85;
	p22 = 41;
	goto L18;
L4:
	p102 = (int)(t1 >> 16);
	p122 = si + 14;
	p142 = 34;
	p162 = 64;
	p182 = 2;
	p202 = 49;
	p222 = 11;
L20:
	t4 = status_read_6A_3(p102, p122, p142, p162, p182, p202, p222, 0, 0, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)fx_redraw));
	t5 = win_keys_merge_disable();
	ax = (int)t5;
	dx = (int)(t5 >> 16);
	WIN_FIELD_BOX_W = (char)18;
L19:
	G_FLAG_1589 = (char)(G_FLAG_1589 - 1);
L2:
	return ((long)dx << 16 | (unsigned)ax);
}
