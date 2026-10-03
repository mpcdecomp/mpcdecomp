/* differs: 150 size 166, image 100; +1 image `enter 8, 0` CL `enter 0xe, 0`; 172 size 166, image 100; +1 image `enter 8, 0` CL `enter 0xe, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
    int f_4;
    int f_6;
};
struct g_G_WAVE_SMEM_START {
    long f_0;
};
struct g_G_WAVE_SMEM_END {
    long f_0;
};
extern int G_WAVE_COLS_DONE;
extern struct g_G_WAVE_SMEM_END G_WAVE_SMEM_END;
extern struct g_G_WAVE_SMEM_START G_WAVE_SMEM_START;
extern long __far _ldiv(void far *, long);

long __far string_op_setup(void)
{
	long loc_8;
	int loc_6;
	unsigned int loc_4;
	int loc_2;
	int ax;
	unsigned ax2;
	int ax3;
	int flags;
	struct s1 far *t1;

	ax = 245 - G_WAVE_COLS_DONE;
	t1 = (struct s1 far *)_ldiv(MK_FP((int)(G_WAVE_SMEM_END.f_0 - G_WAVE_SMEM_START.f_0 >> 16), *(int *)((char *)&G_WAVE_SMEM_END + 0) - *(int *)((char *)&G_WAVE_SMEM_START + 0)), (long)(int)ax);
	*(int *)((char *)&loc_8 + 0) = t1->f_0;
	loc_6 = t1->f_2;
	loc_4 = t1->f_4;
	loc_2 = t1->f_6;
	ax2 = 245 - G_WAVE_COLS_DONE;
	ax3 = ax2 - -(ax2 < 0) >> 1;
	flags = -(ax3 < 0) - loc_2;
	if (CC(">", flags)) {
		goto L1;
	}
	if (CC("<", flags)) {
		goto L2;
	}
	if ((unsigned int)ax3 >= loc_4) {
		goto L1;
	}
L2:
	*(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 1;
	loc_6 = (int)(loc_8 + 1L >> 16);
L1:
	return loc_8;
}
