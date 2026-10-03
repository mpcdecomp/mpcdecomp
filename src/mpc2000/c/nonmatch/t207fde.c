/* differs: 150 size 104, image 96; +B image `je +5D` CL `je +65`; 172 size 104, image 96; +B image `je +5D` CL `je +65` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_G_WAVE_SMEM_START {
    long f_0;
};
extern int G_WAVE_COLS_DONE;
extern int G_WAVE_SMEM_END;
extern int G_WAVE_SMEM_END_HI;
extern struct g_G_WAVE_SMEM_START G_WAVE_SMEM_START;
extern int G_WAVE_VALID;
extern long __far cmd_far_stub2(void);
extern long __far string_func_handler(void);

void __far sample_name_search(void)
{
	int ax;
	int ax2;
	int ax3;
	int si;
	long t1;
	long t2;
	long t3;

	if (G_WAVE_VALID == 0) {
		goto L1;
	}
	if (G_WAVE_COLS_DONE >= 245) {
		goto L1;
	}
	ax = 245 - G_WAVE_COLS_DONE;
	ax2 = G_WAVE_SMEM_END;
	t1 = (long)MK_FP((int)(((long)G_WAVE_SMEM_END_HI << 16 | (unsigned)ax2) - G_WAVE_SMEM_START.f_0 >> 16), ax2 - *(int *)((char *)&G_WAVE_SMEM_START + 0)) / (long)(int)ax;
	if ((int)(t1 >> 16) < 0) {
		goto L2;
	}
	if ((int)(t1 >> 16) > 0) {
		goto L3;
	}
	if ((unsigned int)(int)t1 < 245) {
		goto L2;
	}
L3:
	si = 1;
	goto L4;
L2:
	si = 245 - (int)t1;
	goto L4;
L5:
	t3 = string_func_handler();
L4:
	ax3 = si;
	si = si - 1;
	if (ax3 != 0) {
		goto L5;
	}
	t2 = cmd_far_stub2();
L1:
	return;
}
