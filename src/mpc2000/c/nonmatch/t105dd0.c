/* differs: 150 size 286, image 186; +1 image `enter 4, 0` CL `enter 0x12, 0`; 172 size 286, image 186; +1 image `enter 4, 0` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char G_PAD_NOTE_BASE;
extern unsigned char G_VELOCITY_MAX[1];
extern unsigned char L_05D74[1];
extern char WIN_FIELD_BOX_W;
extern char VELO_FILTER_CURSOR;
extern long __far __pascal status_read_6A_3(int, int, int, int, int, int, int, int, int, int, int);
extern long __far __pascal timer_value_read_1(unsigned char far *, int, int, int);
extern long __near __pascal track_calc_offset2(int);

long __near timer_poll_wait_4(void)
{
	unsigned int ax;
	int p10;
	int p12;
	int p14;
	int p16;
	int p18;
	int p20;
	int p22;
	int si;
	long t1;
	long t2;

	t1 = track_calc_offset2(G_PAD_NOTE_BASE);
	si = (int)t1;
	ax = VELO_FILTER_CURSOR;
	if (ax > 5) {
		goto L1;
	}
	switch ((unsigned int)(unsigned)(L_05D74 + ax * 2)) {
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
	VELO_FILTER_CURSOR = (char)1;
	goto L3;
L2:
	t2 = timer_value_read_1((unsigned char far *)&G_PAD_NOTE_BASE, 55, 11, 0);
	WIN_FIELD_BOX_W = (char)-94;
	return t2;
L4:
	p10 = (int)(t1 >> 16);
	p12 = si + 21;
	p14 = 0;
	p16 = 100;
	p18 = 3;
	p20 = 61;
	p22 = 33;
	goto L8;
L5:
	p10 = (int)(t1 >> 16);
	p12 = si + 22;
	p14 = 0;
	p16 = 100;
	p18 = 3;
	p20 = 61;
	p22 = 43;
	goto L8;
L6:
	p10 = (int)(t1 >> 16);
	p12 = si + 26;
	p14 = 0;
	p16 = 100;
	p18 = 3;
	p20 = 211;
	p22 = 28;
	goto L8;
L7:
	p10 = SEG_DATA;
	p12 = (int)(unsigned)G_VELOCITY_MAX;
	p14 = 1;
	p16 = 127;
	p18 = 3;
	p20 = 211;
	p22 = 40;
	goto L8;
L3:
	p10 = (int)(t1 >> 16);
	p12 = si + 20;
	p14 = 0;
	p16 = 100;
	p18 = 3;
	p20 = 61;
	p22 = 23;
L8:
	return status_read_6A_3(p10, p12, p14, p16, p18, p20, p22, 0, 0, 0, 0);
}
