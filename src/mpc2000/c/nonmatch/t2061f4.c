/* differs: 150 size 260, image 152; +1 image `enter 2, 0` CL `enter 0xe, 0`; 172 size 260, image 5; +1 image `enter 2, 0` CL `enter 0xe, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char COPY_PGM_TO;
extern unsigned char G_ERRNO;
extern unsigned char PGM_TABLE;
extern unsigned char TBL_SOUND_NAMES[1];
extern long __far err_msg_report(void);
extern int __far far_059BC(void);
extern long __far __fastcall __loadds program_close(void);
extern void __far __pascal program_select(int);
extern long __far __pascal program_select_wrapper(int);

void __far __fastcall __loadds seq_select_caller(void)
{
	long t4;
	long t3;
	int t2;
	int t1;
	int si2;
	int si;
	int ds;
	int di5;
	int di4;
	int di3;
	int di2;
	int di;
	int cx3;
	unsigned int cx2;
	int cx;
	int bx2;
	int bx;
	int ax;
	int loc_2;

	ds = SEG_DATA;
	*(int far *)MK_FP(ds, (unsigned)&G_ERRNO) = 0;
	ax = far_059BC();
	loc_2 = ax;
	if (ax < 0) {
		goto L1;
	}
	if ((int)program_select_wrapper(ax) == 0) {
		goto L2;
	}
	bx = loc_2 << 2;
	cx = *(int far *)MK_FP(ds, (unsigned)&PGM_TABLE + 2 + bx);
	di = (int)(unsigned)TBL_SOUND_NAMES;
	t1 = __repne_scas1(MK_FP(ds, di), 0, -1);
	di2 = di + (-1 - t1);
	cx2 = ~t1;
	di3 = di2 - cx2;
	si = di3;
	di4 = si;
	cx3 = cx2 >> 1;
	__movs2(((long)cx << 16 | (unsigned)di4), MK_FP(ds, si), cx3 * 2);
	si2 = si + cx3 * 2;
	di5 = di4 + cx3 * 2;
	__movs1(((long)cx << 16 | (unsigned)di5), MK_FP(ds, si2), cx2 & 1);
	ds = ds;
	bx2 = (int)*(long far *)MK_FP(ds, (unsigned)&PGM_TABLE + bx);
	*(char far *)MK_FP((int)(*(long far *)MK_FP(ds, (unsigned)&PGM_TABLE + bx2) >> 16), bx2 + 28) = *(char far *)MK_FP(ds, (unsigned)&COPY_PGM_TO);
	program_select(loc_2);
	goto L3;
L2:
	*(int far *)MK_FP(ds, (unsigned)&G_ERRNO) = 1;
	goto L3;
L1:
	*(int far *)MK_FP(ds, (unsigned)&G_ERRNO) = 10;
L3:
	if (*(int far *)MK_FP(ds, (unsigned)&G_ERRNO) == 0) {
		goto L4;
	}
	t3 = err_msg_report();
L4:
	t4 = program_close();
	return;
}
