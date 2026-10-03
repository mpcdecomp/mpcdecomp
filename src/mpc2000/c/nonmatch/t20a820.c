/* differs: 150 size 236, image 204; +1 image `enter 0x10, 0` CL `enter 0x14, 0`; 172 size 236, image 204; +1 image `enter 0x10, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_MIDI_STATE {
    long f_0;
};
extern int G_ERRNO;
extern unsigned char PGM_TABLE[1];
extern struct g_PTR_MIDI_STATE PTR_MIDI_STATE;
extern unsigned char TBL_SOUND_NAMES[1];
extern int W_8F4C;
extern long __far err_msg_report(void);
extern void __far __pascal sample_proc_helper(void far *);
extern long __far __pascal sample_process_setup(long, long, int);

void __far sample_proc_wrapper(void)
{
	int loc_e;
	int loc_c;
	int loc_a;
	int loc_8;
	char loc_6[6];
	unsigned ax;
	int ax2;
	char __near *bx;
	long __near *bx2;
	int bx3;
	int cx;
	int di;
	int dx;
	int es;
	int p24;
	int p26;
	int p28;
	int p30;
	int p32;
	int p34;
	int si;
	long t1;
	int t2;

	if (W_8F4C < 128) {
		goto L1;
	}
	goto L2;
L1:
	bx = (char __near *)(TBL_SOUND_NAMES + W_8F4C * 17);
	if (*bx == 0) {
		goto L3;
	}
	p24 = SEG_DATA;
	p26 = (int)(unsigned)bx;
	p28 = 0;
	p30 = 0;
	p32 = 0;
	p34 = 0x0b50;
	t1 = sample_process_setup(((long)p24 << 16 | (unsigned)p26), ((long)p28 << 16 | (unsigned)p30), p32);
	cx = UNDEF;
	ax = (int)t1;
	loc_c = ax;
	loc_a = (int)(t1 >> 16);
	dx = (int)(t1 >> 16) | ax;
	if (dx == 0) {
		goto L4;
	}
	bx2 = (long __near *)PGM_TABLE;
	loc_e = 24;
L5:
	si = (int)*bx2;
	es = (int)(*bx2 >> 16);
	*(int *)((char *)&PTR_MIDI_STATE + 0) = si;
	*(int *)((char *)&PTR_MIDI_STATE + 2) = es;
	if ((unsigned int)*(int far *)MK_FP(es, si) <= 2) {
		goto L6;
	}
	loc_8 = (int)(unsigned)bx2;
	*(int *)((char *)&loc_6 + 0) = 64;
	si = 0;
	cx = *(int *)((char *)&loc_6 + 0);
	di = loc_c;
L7:
	es = (int)(PTR_MIDI_STATE.f_0 >> 16);
	ax = *(char far *)MK_FP(es, (int)PTR_MIDI_STATE.f_0 + si + 34);
	if (ax != W_8F4C) {
		goto L8;
	}
	ax = loc_a;
	bx3 = *(int *)((char *)&PTR_MIDI_STATE + 0) + si;
	*(int far *)MK_FP(es, bx3 + 30) = di;
	*(int far *)MK_FP(es, bx3 + 32) = ax;
L8:
	si = si + 29;
	cx = cx - 1;
	if (cx != 0) {
		goto L7;
	}
	bx2 = (long __near *)loc_8;
L6:
	bx2 = bx2 + 1;
	loc_e = loc_e - 1;
	if (loc_e != 1) {
		goto L5;
	}
L3:
	W_8F4C = W_8F4C + 1;
	if (W_8F4C >= 128) {
		goto L9;
	}
	goto L1;
L9:
	goto L2;
L4:
	if (G_ERRNO != 12) {
		goto L10;
	}
	sample_proc_helper(MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)sample_proc_wrapper));
	return;
L10:
	ax2 = (int)err_msg_report();
L2:
	return;
}
