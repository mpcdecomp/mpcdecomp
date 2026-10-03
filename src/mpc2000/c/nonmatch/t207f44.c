/* differs: 150 size 182, image 154; +1 image `enter 4, 0` CL `enter 8, 0`; 172 size 182, image 154; +1 image `enter 4, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_G_WAVE_SMEM_START {
    long f_0;
};
struct g_TBL_WAVE_POS_PEAK {
    int f_0;
};
struct g_TBL_WAVE_NEG_PEAK {
    int f_0;
};
extern unsigned char BUF_XFER[1];
extern int G_WAVE_COLS_DONE;
extern struct g_G_WAVE_SMEM_START G_WAVE_SMEM_START;
extern int G_WAVE_SMEM_START_HI;
extern struct g_TBL_WAVE_NEG_PEAK TBL_WAVE_NEG_PEAK;
extern struct g_TBL_WAVE_POS_PEAK TBL_WAVE_POS_PEAK;
extern void __far __pascal smem_read_words(int, int, unsigned char far *, int);
extern long __far string_op_setup(void);
extern void __far __pascal words_minmax(unsigned char far *, int, struct g_TBL_WAVE_NEG_PEAK far *, struct g_TBL_WAVE_POS_PEAK far *);

void __far string_func_handler(void)
{
	long loc_4;
	int loc_2;
	int ax;
	int ax2;
	int p10;
	unsigned p12;
	int p14;
	long t1;
	int t2;
	int t3;

	if (G_WAVE_COLS_DONE < 245) {
		goto L1;
	}
	goto L2;
L1:
	*(int *)((char *)&TBL_WAVE_POS_PEAK + 0 + (G_WAVE_COLS_DONE << 2)) = 0;
	*(int *)((char *)&TBL_WAVE_NEG_PEAK + 0 + (G_WAVE_COLS_DONE << 2)) = 0;
	t1 = string_op_setup();
	*(int *)((char *)&loc_4 + 0) = (int)t1;
	loc_2 = (int)(t1 >> 16);
L3:
	p10 = G_WAVE_SMEM_START_HI;
	p12 = *(int *)((char *)&G_WAVE_SMEM_START + 0);
	ax = *(int *)((char *)&loc_4 + 0);
	if (loc_2 < 0) {
		goto L4;
	}
	if (loc_2 > 0) {
		goto L5;
	}
	if ((unsigned int)ax <= 0x400) {
		goto L4;
	}
L5:
	ax = 0x400;
L4:
	smem_read_words(p10, p12, (unsigned char far *)BUF_XFER, ax);
	*(int *)((char *)&G_WAVE_SMEM_START + 0) = *(int *)((char *)&G_WAVE_SMEM_START + 0) + ax;
	G_WAVE_SMEM_START_HI = (int)(G_WAVE_SMEM_START.f_0 + (long)(int)ax >> 16);
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - ax;
	loc_2 = (int)(loc_4 - (long)(int)ax >> 16);
	p14 = ax;
	ax2 = G_WAVE_COLS_DONE << 2;
	words_minmax((unsigned char far *)BUF_XFER, p14, (struct g_TBL_WAVE_NEG_PEAK far *)(struct g_TBL_WAVE_NEG_PEAK __near *)((char __near *)&TBL_WAVE_NEG_PEAK + ax2), (struct g_TBL_WAVE_POS_PEAK far *)(struct g_TBL_WAVE_POS_PEAK __near *)((char __near *)&TBL_WAVE_POS_PEAK + ax2));
	if ((loc_2 | *(int *)((char *)&loc_4 + 0)) != 0) {
		goto L3;
	}
	G_WAVE_COLS_DONE = G_WAVE_COLS_DONE + 1;
L2:
	return;
}
