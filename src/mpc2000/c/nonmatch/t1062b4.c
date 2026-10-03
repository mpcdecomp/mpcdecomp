/* differs: 150 size 126, image 82; +0 image `push si` CL `enter 0xe, 0`; 172 size 126, image 82; +0 image `push si` CL `enter 0xe, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char G_MUTE_ASSIGN_FIELD;
extern unsigned char G_PAD_NOTE_BASE;
extern char WIN_FIELD_BOX_W;
extern long __far __pascal timer_value_read_1(int, int, int, int, int);
extern long __near __pascal track_calc_offset2(int);

long __near mute_assign_row_dispatch(void)
{
	int ax;
	int p10;
	int p12;
	int p4;
	int p6;
	int p8;
	int si;
	long t1;
	long t2;

	t1 = track_calc_offset2(G_PAD_NOTE_BASE);
	si = (int)t1;
	ax = G_MUTE_ASSIGN_FIELD;
	if (ax == 0) {
		goto L1;
	}
	if (ax == 1) {
		goto L2;
	}
	if (ax == 2) {
		goto L3;
	}
	G_MUTE_ASSIGN_FIELD = (char)1;
	goto L2;
L1:
	p4 = SEG_DATA;
	p6 = (int)(unsigned)&G_PAD_NOTE_BASE;
	p8 = 55;
	p10 = 11;
	p12 = 0;
	goto L4;
L3:
	p4 = (int)(t1 >> 16);
	p6 = si + 12;
	p8 = 55;
	p10 = 39;
	goto L5;
L2:
	p4 = (int)(t1 >> 16);
	p6 = si + 11;
	p8 = 55;
	p10 = 30;
L5:
	p12 = 1;
L4:
	t2 = timer_value_read_1(p4, p6, p8, p10, p12);
	WIN_FIELD_BOX_W = (char)-94;
	return t2;
}
