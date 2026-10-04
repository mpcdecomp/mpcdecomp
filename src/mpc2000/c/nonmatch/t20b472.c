/* differs: 150 size 272, image 230; +B image `mov di, ax` CL `mov word ptr [bp - 6], ax`; 172 size 272, image 230; +B image `mov di, ax` CL `mov word ptr [bp - 6], ax` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_56AA;
extern long FP_56C2;
extern char G_MPC60_PAD_IDX;
extern char TBL_MPC60_PAD_SND[1];
extern unsigned char TBL_MPC60_SND_HDR[1];
extern int W_56C6;
extern int W_56C8;
extern int W_56CA;
extern int W_56CC;
extern long __far X_0C236(void);
extern int __far int4D_sample_wrapper(void);
extern long __far __pascal rep_memcpy_handler(int, int, long);
extern long __far __pascal sample_load_entry(long, int);
extern long __far __pascal sample_ptr_access(int, int);
extern long __far __pascal sample_validate_ptr(long);

void __far sample_process_2(void)
{
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	char __near *bx;
	int bx2;
	int cx;
	int dx;
	int es;
	int p14;
	int p16;
	int p18;
	int p20;
	int p22;
	int si;
	long t1;
	long t2;
	long t3;
	long t4;
	long t5;

	p14 = 0x0b50;
	cx = UNDEF;
	es = UNDEF;
	ax = int4D_sample_wrapper();
	dx = UNDEF;
	loc_2 = dx;
	G_MPC60_PAD_IDX = (char)0;
L1:
	ax2 = TBL_MPC60_PAD_SND[G_MPC60_PAD_IDX];
	if (ax2 != -1) {
		goto L2;
	}
	goto L3;
L2:
	bx = (char __near *)(TBL_MPC60_SND_HDR + ax2 * 59);
	if (*bx != 0) {
		goto L4;
	}
	goto L3;
L4:
	p14 = SEG_DATA;
	p16 = (int)(unsigned)bx;
	p18 = 0x0b50;
	t1 = sample_ptr_access(p14, p16);
	cx = UNDEF;
	W_56CA = (int)t1;
	W_56CC = (int)(t1 >> 16);
	W_56C6 = (int)t1;
	W_56C8 = (int)(t1 >> 16);
	if (((int)(t1 >> 16) | (int)t1) == 0) {
		goto L5;
	}
	if (B_56AA == 0) {
		goto L6;
	}
L5:
	p14 = SEG_DATA;
	p16 = (int)(unsigned)&W_56C6;
	p18 = ax2;
	p20 = 0x0b50;
	t2 = sample_load_entry(((long)p14 << 16 | (unsigned)p16), p18);
	cx = UNDEF;
	ax3 = (int)t2;
	if (ax3 == 0) {
		goto L7;
	}
	if (ax3 == 1) {
		goto L8;
	}
L6:
	if ((W_56CC | W_56CA) == 0) {
		goto L9;
	}
	if (B_56AA == 0) {
		goto L9;
	}
	p20 = W_56C6;
	p22 = 0x0b50;
	t3 = rep_memcpy_handler(W_56CC, W_56CA, ((long)W_56C8 << 16 | (unsigned)p20));
	p14 = W_56CC;
	p16 = W_56CA;
	p18 = 0x0b50;
	t4 = sample_validate_ptr(((long)p14 << 16 | (unsigned)p16));
	cx = UNDEF;
L9:
	si = *(char far *)MK_FP(loc_2, G_MPC60_PAD_IDX + ax) * 29;
	bx2 = (int)FP_56C2;
	es = (int)(FP_56C2 >> 16);
	dx = W_56C8;
	*(int far *)MK_FP(es, bx2 - 0x3d9 + si) = W_56C6;
	*(int far *)MK_FP(es, bx2 - 0x3d7 + si) = dx;
L3:
	G_MPC60_PAD_IDX = (char)(G_MPC60_PAD_IDX + 1);
	if (G_MPC60_PAD_IDX >= 34) {
		goto L10;
	}
	goto L1;
L10:
	goto L7;
L8:
	t5 = X_0C236();
	return;
L7:
	return;
}
