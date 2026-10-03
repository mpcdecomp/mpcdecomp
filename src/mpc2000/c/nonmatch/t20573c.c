/* differs: 150 size 144, image 136; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 144, image 136; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_TABLE {
    long f_0;
};
struct g_PGM_CURRENT {
    int f_0;
    int f_2;
};
struct g_PTR_TRACK_DATA {
    int f_0;
    int f_2;
};
extern char B_9D77;
extern int G_ERRNO;
extern struct g_PGM_CURRENT PGM_CURRENT;
extern unsigned char PGM_PADMAP[1];
extern char PGM_SLOT;
extern struct g_PGM_TABLE PGM_TABLE;
extern struct g_PTR_TRACK_DATA PTR_TRACK_DATA;
extern char P_1DBF;
extern long __far cmd_far_stub2(void);
extern long __far err_msg_report(void);
extern int __far __pascal pending_ops_set(int);
extern void __far __pascal seq_select_setup_1(int, int);
extern void __far __pascal seq_select_setup_2(int, int);

void __far __pascal program_select(int arg_0)
{
	int ax;
	int ax2;
	int bx;
	int dx;
	int es;
	int t1;
	int t2;
	long t3;
	long t4;

	if (P_1DBF != 0) {
		goto L1;
	}
	P_1DBF = (char)1;
	bx = (int)*(long *)((char *)&PGM_TABLE + 0 + (arg_0 << 2));
	es = (int)(*(long *)((char *)&PGM_TABLE + 0 + bx) >> 16);
	if ((unsigned int)*(int far *)MK_FP(es, bx) <= 2) {
		goto L2;
	}
	PGM_SLOT = (char)arg_0;
	PGM_CURRENT.f_0 = bx;
	PGM_CURRENT.f_2 = es;
	if (B_9D77 == 0) {
		goto L3;
	}
	ax = -0x72c8;
	dx = SEG_DATA;
	goto L4;
L3:
	dx = PGM_CURRENT.f_2;
	ax = (int)(unsigned)(PGM_PADMAP + PGM_CURRENT.f_0);
L4:
	PTR_TRACK_DATA.f_0 = ax;
	PTR_TRACK_DATA.f_2 = dx;
	seq_select_setup_1(dx, ax);
	seq_select_setup_2(PGM_CURRENT.f_2, PGM_CURRENT.f_0);
	t3 = cmd_far_stub2();
	ax2 = pending_ops_set(15);
	goto L5;
L2:
	G_ERRNO = 5;
	t4 = err_msg_report();
L5:
	P_1DBF = (char)0;
L1:
	return;
}
