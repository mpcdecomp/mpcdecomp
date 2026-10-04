/* differs: 150 size 254, image 226; +1 image `enter 0x12, 0` CL `enter 0x1a, 0`; 172 size 254, image 226; +1 image `enter 0x12, 0` CL `enter 0x1a, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_MIDI_STATE {
    long f_0;
};
extern char B_8F60;
extern int G_ERRNO;
extern struct g_PTR_MIDI_STATE PTR_MIDI_STATE;
extern unsigned char TBL_SOUND_NAMES[1];
extern int W_8F4C;
extern long __far err_msg_report(void);
extern long __far __pascal rep_memcpy_handler(int, int, long);
extern void __far __pascal sample_proc_helper(void far *);
extern long __far __pascal sample_process_setup(long, long, int);
extern long __far __pascal sample_ptr_access(char far *);
extern long __far __pascal sample_validate_ptr(long);

void __far sample_process_1(void)
{
	int loc_12;
	char loc_10[4];
	char loc_c[6];
	int loc_6;
	char loc_4[4];
	int ax;
	int ax2;
	int ax3;
	char __near *bx;
	int bx2;
	int cx;
	int di;
	int dx;
	int es;
	int p26;
	int p28;
	int p30;
	int p32;
	int p34;
	int p36;
	int si;
	int si2;
	long t1;
	long t2;
	long t3;
	long t4;
	int t5;

	if (W_8F4C < 128) {
		goto L1;
	}
	goto L2;
L1:
	bx = (char __near *)(TBL_SOUND_NAMES + W_8F4C * 17);
	if (*bx != 0) {
		goto L3;
	}
	goto L4;
L3:
	loc_12 = (int)(unsigned)bx;
	*(int *)((char *)&loc_10 + 0) = SEG_DATA;
	t1 = sample_ptr_access((char far *)bx);
	si2 = (int)t1;
	*(int *)((char *)&loc_c + 0) = (int)(t1 >> 16);
	p26 = *(int *)((char *)&loc_10 + 0);
	p28 = loc_12;
	p30 = (int)(t1 >> 16);
	p32 = (int)t1;
	p34 = B_8F60;
	p36 = 0x0b50;
	t2 = sample_process_setup(((long)p26 << 16 | (unsigned)p28), ((long)p30 << 16 | (unsigned)p32), p34);
	loc_6 = (int)t2;
	*(int *)((char *)&loc_4 + 0) = (int)(t2 >> 16);
	dx = (int)(t2 >> 16) | (int)t2;
	if (dx == 0) {
		goto L5;
	}
	if ((*(int *)((char *)&loc_c + 0) | si2) == 0) {
		goto L6;
	}
	ax2 = *(int *)((char *)&loc_c + 0);
	if (loc_6 != si2) {
		goto L7;
	}
	if (*(int *)((char *)&loc_4 + 0) == ax2) {
		goto L6;
	}
L7:
	p32 = loc_6;
	p34 = 0x0b50;
	t3 = rep_memcpy_handler(ax2, si2, ((long)*(int *)((char *)&loc_4 + 0) << 16 | (unsigned)p32));
	p26 = *(int *)((char *)&loc_c + 0);
	p28 = si2;
	p30 = 0x0b50;
	t4 = sample_validate_ptr(((long)p26 << 16 | (unsigned)p28));
	dx = (int)(t4 >> 16);
L6:
	si = 0;
	cx = 64;
	di = loc_6;
L8:
	es = (int)(PTR_MIDI_STATE.f_0 >> 16);
	ax = *(char far *)MK_FP(es, (int)PTR_MIDI_STATE.f_0 + si + 34);
	if (ax != W_8F4C) {
		goto L9;
	}
	ax = *(int *)((char *)&loc_4 + 0);
	bx2 = *(int *)((char *)&PTR_MIDI_STATE + 0) + si;
	*(int far *)MK_FP(es, bx2 + 30) = di;
	*(int far *)MK_FP(es, bx2 + 32) = ax;
L9:
	si = si + 29;
	cx = cx - 1;
	if (cx != 0) {
		goto L8;
	}
L4:
	W_8F4C = W_8F4C + 1;
	if (W_8F4C >= 128) {
		goto L10;
	}
	goto L1;
L10:
	goto L2;
L5:
	if (G_ERRNO != 12) {
		goto L11;
	}
	sample_proc_helper(MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)sample_process_1));
	return;
L11:
	ax3 = (int)err_msg_report();
L2:
	return;
}
