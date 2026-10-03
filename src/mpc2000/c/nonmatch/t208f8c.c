/* differs: 150 size 642, image 370; +1 image `enter 0x1a, 0` CL `enter 0x22, 0`; 172 size 642, image 374; +1 image `enter 0x1a, 0` CL `enter 0x22, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SMEM_POOL_BASE_HI {
    int f_0;
};
struct g_SMEM_POOL {
    int f_0;
};
struct g_SMEM_POOL_LEN_HI {
    int f_0;
};
struct g_SMEM_POOL_LEN {
    int f_0;
};
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern char far *SND_CURRENT;
extern long __far __pascal input_handler(long, long, long);

void __far sample_event_handler(void)
{
	long t2;
	long t1;
	int flags;
	int es3;
	int es2;
	int es;
	int dx5;
	int dx4;
	int dx3;
	int dx2;
	int dx;
	int bx6;
	int bx5;
	int bx4;
	int bx3;
	int bx2;
	int bx;
	int ax9;
	int ax8;
	int ax7;
	unsigned int ax6;
	unsigned int ax5;
	unsigned int ax4;
	int ax3;
	unsigned int ax2;
	unsigned int ax;
	int loc_2;
	int loc_4;
	int loc_6;
	unsigned int loc_8;
	int loc_a;
	long loc_c;
	int loc_e;
	long loc_10;
	int loc_12;
	unsigned int loc_14;

	bx = (int)*(long *)((char *)&SND_CURRENT + 0);
	es = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	dx = (int)(*(long far *)MK_FP(es, bx + 24) - *(long far *)MK_FP(es, bx + 32) >> 16);
	loc_4 = *(int far *)MK_FP(es, bx + 24) - *(int far *)MK_FP(es, bx + 32);
	loc_2 = dx;
	bx2 = ((*(int far *)MK_FP(es, bx + 48) << 2) + *(int far *)MK_FP(es, bx + 48)) * 2;
	dx2 = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx2);
	loc_8 = *(int *)((char *)&SMEM_POOL + 0 + bx2);
	loc_6 = dx2;
	t1 = ((long)*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx2) << 16 | (unsigned)*(int *)((char *)&SMEM_POOL_LEN + 0 + bx2)) / 2L;
	ax = loc_4;
	dx3 = loc_2;
	bx3 = (int)*(long *)((char *)&SND_CURRENT + 0);
	es2 = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	flags = *(int far *)MK_FP(es2, bx3 + 22) - dx3;
	if (CC("<", flags)) {
		goto L1;
	}
	if (CC(">", flags)) {
		goto L2;
	}
	if ((unsigned int)*(int far *)MK_FP(es2, bx3 + 20) >= ax) {
		goto L2;
	}
L1:
	ax = *(int far *)MK_FP(es2, bx3 + 20);
	dx3 = *(int far *)MK_FP(es2, bx3 + 22);
L2:
	*(int *)((char *)&loc_c + 0) = ax;
	loc_a = dx3;
	dx4 = (int)(*(long far *)MK_FP(es2, bx3 + 24) - loc_c >> 16);
	*(int *)((char *)&loc_10 + 0) = *(int far *)MK_FP(es2, bx3 + 24) - *(int *)((char *)&loc_c + 0);
	loc_e = dx4;
	loc_14 = ((char)(*(int *)((char *)&loc_10 + 0) + 15 >> 8) << 8 | (unsigned char)((char)*(int *)((char *)&loc_10 + 0) + 15 & -16));
	loc_12 = (int)(loc_10 + 15L >> 16);
	ax2 = loc_8 + *(int *)((char *)&loc_c + 0);
	ax3 = (int)input_handler(((long)(loc_6 + loc_a + (ax2 < loc_8)) << 16 | (unsigned)ax2), *(long *)((char *)&loc_8 + 0), loc_10);
	if (*(char far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 19) == 0) {
		goto L3;
	}
	ax4 = (int)t1 + loc_8;
	ax5 = ax4 + *(int *)((char *)&loc_c + 0);
	ax6 = loc_14 + loc_8;
	ax7 = (int)input_handler(((long)((int)(t1 >> 16) + loc_6 + (ax4 < (unsigned int)(int)t1) + loc_a + (ax5 < ax4)) << 16 | (unsigned)ax5), ((long)(loc_12 + loc_6 + (ax6 < loc_14)) << 16 | (unsigned)ax6), loc_10);
L3:
	bx4 = (int)*(long *)((char *)&SND_CURRENT + 0);
	es3 = (int)(*(long *)((char *)&SND_CURRENT + 0) >> 16);
	*(int far *)MK_FP(es3, bx4 + 22) = 0;
	*(int far *)MK_FP(es3, bx4 + 20) = 0;
	ax8 = *(int *)((char *)&SND_CURRENT + 0);
	loc_2 = *(int *)((char *)&SND_CURRENT + 2);
	loc_6 = loc_2;
	*(int far *)MK_FP(loc_2, ax8 + 28) = *(int *)((char *)&loc_10 + 0);
	*(int far *)MK_FP(loc_2, ax8 + 30) = loc_e;
	dx5 = *(int far *)MK_FP(loc_6, ax8 + 30);
	*(int far *)MK_FP(loc_2, ax8 + 24) = *(int far *)MK_FP(loc_6, ax8 + 28);
	*(int far *)MK_FP(loc_2, ax8 + 26) = dx5;
	ax9 = 0 - (*(char far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 19) == 0);
	t2 = (long)(int)(ax9 + 2) * *(long *)((char *)&loc_14 + 0);
	bx5 = *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 48);
	bx6 = ((bx5 << 2) + bx5) * 2;
	*(int *)((char *)&SMEM_POOL_LEN + 0 + bx6) = (int)t2;
	*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx6) = (int)(t2 >> 16);
	return;
}
