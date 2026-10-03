/* differs: 150 size 366, image 318; +1 image `enter 8, 0` CL `enter 0xa, 0`; 172 size 366, image 318; +1 image `enter 8, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[19];
    char f_13;
    char pad_14[8];
    int f_1c;
    int f_1e;
    char pad_20[16];
    int f_30;
};
struct s2 {
    int f_0;
};
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
struct g_G_WAVE_SMEM_START {
    long f_0;
};
extern unsigned char BUF_XFER[1];
extern int G_WAVE_COLS_DONE;
extern int G_WAVE_SMEM_END;
extern int G_WAVE_SMEM_END_HI;
extern struct g_G_WAVE_SMEM_START G_WAVE_SMEM_START;
extern int G_WAVE_SMEM_START_HI;
extern int G_WAVE_VALID;
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern char SND_EDIT_VIEW;
extern unsigned char TBL_WAVE_POS_PEAK[1];
extern long __far __pascal smem_dma_copy(int, int, unsigned char far *, int, int);
extern void __far __pascal voice_buf_helper_1(int);
extern void __far __pascal voice_buf_helper_2(int);

void __far __pascal voice_buffer_init(int arg_2, struct s1 far *arg_0)
{
	char loc_4[4];
	unsigned int ax;
	unsigned int ax2;
	unsigned int ax3;
	unsigned int ax4;
	unsigned ax5;
	int bx;
	int bx2;
	int cx;
	int __near *di;
	int dx;
	int dx2;
	unsigned int dx3;
	unsigned int dx4;
	unsigned int dx5;
	int si;
	int si2;
	struct s2 __near *si3;
	int t1;
	long t2;
	long t3;
	long t4;
	int t5;

	voice_buf_helper_1(16);
	__stos2((int far *)&G_WAVE_VALID, 0, 0x3e0);
	if ((arg_2 | *(int *)((char *)&arg_0 + 0)) != 0) {
		goto L1;
	}
	goto L2;
L1:
	if ((arg_0->f_1e | arg_0->f_1c) != 0) {
		goto L3;
	}
	goto L2;
L3:
	si = arg_0->f_30;
	si2 = ((si << 2) + si) * 2;
	dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + si2);
	*(int *)((char *)&G_WAVE_SMEM_START + 0) = *(int *)((char *)&SMEM_POOL + 0 + si2);
	G_WAVE_SMEM_START_HI = dx;
	if (arg_0->f_13 == 0) {
		goto L4;
	}
	if (SND_EDIT_VIEW == 0) {
		goto L4;
	}
	bx = arg_0->f_30;
	bx2 = ((bx << 2) + bx) * 2;
	t2 = ((long)*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx2) << 16 | (unsigned)*(int *)((char *)&SMEM_POOL_LEN + 0 + bx2)) / 2L;
	*(int *)((char *)&G_WAVE_SMEM_START + 0) = *(int *)((char *)&G_WAVE_SMEM_START + 0) + (int)t2;
	G_WAVE_SMEM_START_HI = (int)(G_WAVE_SMEM_START.f_0 + t2 >> 16);
L4:
	ax = arg_0->f_1c;
	ax2 = ax + *(int *)((char *)&G_WAVE_SMEM_START + 0);
	dx2 = arg_0->f_1e + G_WAVE_SMEM_START_HI + (ax2 < ax);
	G_WAVE_SMEM_END = ax2;
	G_WAVE_SMEM_END_HI = dx2;
	t3 = *(long far *)((char far *)arg_0 + 28) / 245L;
	if (((int)(t3 >> 16) | (int)t3) != 0) {
		goto L5;
	}
	ax3 = arg_0->f_1c;
	dx3 = arg_0->f_1e;
	dx4 = dx3 >> 1;
	ax4 = ax3 >> 1 | (dx3 & 1) << 15;
	dx5 = dx4 >> 1 | (ax3 & 1) << 15;
	ax5 = ((ax4 >> 1 | (dx4 & 1) << 15) >> 1 | (dx5 & 1) << 15) >> 1 | ((dx5 >> 1 | (ax4 & 1) << 15) & 1) << 15;
	t4 = smem_dma_copy(G_WAVE_SMEM_START_HI, *(int *)((char *)&G_WAVE_SMEM_START + 0), (unsigned char far *)BUF_XFER, 245, (int)(((long)ax5 << 16 | (unsigned)(ax5 & -0x1000)) / 245L));
	di = (int __near *)BUF_XFER;
	si3 = (struct s2 __near *)TBL_WAVE_POS_PEAK;
	*(int *)((char *)&loc_4 + 0) = 245;
	cx = *(int *)((char *)&loc_4 + 0);
L6:
	si3->f_0 = 0;
	*(int *)((char __near *)si3 + -2) = 0;
	if (*di < 0) {
		goto L7;
	}
	si3->f_0 = *di;
	goto L8;
L7:
	*(int *)((char __near *)si3 + -2) = *di;
L8:
	di = di + 1;
	si3 = si3 + 2;
	cx = cx - 1;
	if (cx != 0) {
		goto L6;
	}
	G_WAVE_COLS_DONE = 245;
L5:
	G_WAVE_VALID = 1;
L2:
	voice_buf_helper_2(16);
	return;
}
