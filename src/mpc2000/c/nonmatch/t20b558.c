/* differs: 150 size 262, image 228; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 262, image 228; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_TBL_MPC60_SND_HDR {
    char f_0;
};
extern char B_56AA;
extern long FP_56C2;
extern char G_MPC60_PAD_IDX;
extern char TBL_MPC60_PAD_SND[1];
extern struct g_TBL_MPC60_SND_HDR TBL_MPC60_SND_HDR;
extern int W_56C6;
extern int W_56C8;
extern int W_56CA;
extern int W_56CC;
extern long __far X_0C236(void);
extern int __far __pascal int43_wrapper(int);
extern int __far int4D_sample_wrapper(void);
extern long __far __pascal rep_memcpy_handler(int, int, long);
extern long __far __pascal sample_load_entry(int far *, int);
extern long __far __pascal sample_ptr_access(struct g_TBL_MPC60_SND_HDR far *);
extern long __far __pascal sample_validate_ptr(long);

void __far midi_prog_change(void)
{
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int ax4;
	int bx;
	int dx;
	int es;
	int p18;
	int p20;
	int si;
	char far *t1;
	char far *t2;
	char far *t3;
	char far *t4;
	char far *t5;

	ax = int4D_sample_wrapper();
	loc_2 = UNDEF;
L1:
	if ((W_56CC | W_56CA) == 0) {
		goto L2;
	}
	if (B_56AA == 0) {
		goto L2;
	}
	p18 = W_56C6;
	p20 = 0x0b50;
	t1 = rep_memcpy_handler(W_56CC, W_56CA, ((long)W_56C8 << 16 | (unsigned)p18));
	t2 = sample_validate_ptr(*(long *)((char *)&W_56CA + 0));
L2:
	si = *(char far *)MK_FP(loc_2, G_MPC60_PAD_IDX + ax) * 29;
	bx = (int)FP_56C2;
	es = (int)(FP_56C2 >> 16);
	dx = W_56C8;
	*(int far *)MK_FP(es, bx - 0x3d9 + si) = W_56C6;
	*(int far *)MK_FP(es, bx - 0x3d7 + si) = dx;
L3:
	G_MPC60_PAD_IDX = (char)(G_MPC60_PAD_IDX + 1);
	if (G_MPC60_PAD_IDX >= 34) {
		goto L4;
	}
	ax2 = TBL_MPC60_PAD_SND[G_MPC60_PAD_IDX];
	if (ax2 == -1) {
		goto L3;
	}
	if (*(char *)((char *)&TBL_MPC60_SND_HDR + 0 + ax2 * 59) == 0) {
		goto L3;
	}
	t4 = sample_ptr_access((struct g_TBL_MPC60_SND_HDR far *)(&TBL_MPC60_SND_HDR + ax2 * 59));
	W_56CA = (int)FP_OFF(t4);
	W_56CC = (int)FP_SEG(t4);
	W_56C6 = (int)FP_OFF(t4);
	W_56C8 = (int)FP_SEG(t4);
	if (((int)FP_SEG(t4) | (int)FP_OFF(t4)) == 0) {
		goto L5;
	}
	if (B_56AA != 0) {
		goto L5;
	}
	goto L1;
L5:
	p18 = 0x0b50;
	t3 = sample_load_entry((int far *)&W_56C6, ax2);
	ax3 = (int)FP_OFF(t3);
	if (ax3 == 0) {
		goto L6;
	}
	if (ax3 == 1) {
		goto L7;
	}
	goto L1;
L6:
	int43_wrapper(5);
	return;
L7:
	t5 = X_0C236();
L4:
	return;
}
