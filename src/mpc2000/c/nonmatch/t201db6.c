/* differs: 150 size 98, image 84; +0 image `push bp` CL `enter 6, 0`; 172 size 98, image 84; +0 image `push bp` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_FP_POLL_HOOK {
    long f_0;
};
extern struct g_FP_POLL_HOOK FP_POLL_HOOK;
extern int FP_POLL_HOOK_SEG;
extern char PGM_SLOT;
extern long PGM_TABLE[1];
extern long __far cmd_far_stub2(void);
extern void __far __pascal program_select(int);

void __far __pascal smem_addr_data_ctrl(int arg_0)
{
	int ax;
	int bx;
	int cx;
	int di;
	int es;
	int t1;
	long t2;
	long t3;

	cx = 0;
	di = arg_0;
L1:
	bx = (int)PGM_TABLE[cx];
	es = (int)(PGM_TABLE[cx] >> 16);
	if ((unsigned int)*(int far *)MK_FP(es, bx) <= 2) {
		goto L2;
	}
	ax = *(char far *)MK_FP(es, bx + 28);
	if (ax == di) {
		goto L3;
	}
L2:
	cx = cx + 1;
	if (cx < 24) {
		goto L1;
	}
	return;
L3:
	if (PGM_SLOT == cx) {
		goto L4;
	}
	program_select(cx);
	if ((FP_POLL_HOOK_SEG | *(int *)((char *)&FP_POLL_HOOK + 0)) == 0) {
		goto L5;
	}
	t2 = (*(long (far *)())FP_POLL_HOOK.f_0)();
L5:
	t3 = cmd_far_stub2();
L4:
	return;
}
