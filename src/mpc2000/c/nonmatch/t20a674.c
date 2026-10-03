/* differs: 150 size 438, image 428; +1 image `enter 6, 0` CL `enter 8, 0`; 172 size 438, image 470; +6 image `mov word ptr [bp - 2], 0` CL `xor si, si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_TABLE {
    int f_0;
    int f_2;
};
extern unsigned char B_8A0E[1];
extern unsigned char B_9D5A[1];
extern int G_ERRNO;
extern char PGM_SLOT;
extern struct g_PGM_TABLE PGM_TABLE;
extern unsigned char TBL_SOUND_NAMES[1];
extern void __far X_05972(void);
extern long __far err_msg_report(void);
extern int __far int2F_call_fn6(int far *, int);
extern int __far int2F_dispatch_10(void);
extern void __far __pascal program_select(int);
extern long __far __pascal program_select_wrapper(int);
extern long __far __pascal range_process(unsigned char far *, int, int, int, int);
extern int __far __pascal range_smem_setup(int, int);
extern long __far sample_proc_wrapper(void);
extern void __far __pascal smem_dma_init(int);

long __far smem_init_handler(void)
{
	unsigned int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int bx;
	int di;
	int si;
	unsigned int t1;
	int t2;
	int t3;
	int t4;
	int t5;

	di = 0;
	G_ERRNO = 4;
	if (int2F_call_fn6((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2) == 2) {
		goto L1;
	}
	goto L2;
L1:
	if ((int)range_process((unsigned char far *)TBL_SOUND_NAMES, 1, loc_4 * 17, 1, 0x880) != 0) {
		goto L3;
	}
	goto L2;
L3:
	t1 = int2F_call_fn6((unsigned int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2);
	if (t1 == 2) {
		goto L4;
	}
	goto L2;
L4:
	if (loc_6 >= t1) {
		goto L5;
	}
	goto L2;
L5:
	if ((int)range_process((unsigned char far *)B_8A0E, 1, loc_6, 1, 50) != 0) {
		goto L6;
	}
	goto L2;
L6:
	t2 = int2F_call_fn6((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2);
	if (t2 == 2) {
		goto L7;
	}
	goto L2;
L7:
	if (int2F_call_fn6((unsigned int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), t2) == 2) {
		goto L8;
	}
	goto L2;
L8:
	if ((int)range_process(MK_FP(SEG_DATA, -0x64a4), loc_4, loc_6, 64, 6) != 0) {
		goto L9;
	}
	goto L2;
L9:
	if (int2F_call_fn6((unsigned int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2) == 2) {
		goto L10;
	}
	goto L2;
L10:
	if ((int)range_process(MK_FP(SEG_DATA, -0x72c8), 1, loc_6, 1, 64) != 0) {
		goto L11;
	}
	goto L2;
L11:
	if (int2F_call_fn6((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2) == 2) {
		goto L12;
	}
	goto L2;
L12:
	X_05972();
	si = 0;
	if (loc_4 <= si) {
		goto L13;
	}
L14:
	if (int2F_call_fn6((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2) != 2) {
		goto L2;
	}
	if (loc_2 < 24) {
		goto L15;
	}
	loc_2 = 23;
L15:
	if ((int)program_select_wrapper(loc_2) == 0) {
		goto L16;
	}
	bx = loc_2 << 2;
	if (range_smem_setup(*(int *)((char *)&PGM_TABLE + 2 + bx), *(int *)((char *)&PGM_TABLE + 0 + bx)) == 0) {
		goto L2;
	}
	if (loc_2 != 0) {
		goto L17;
	}
	di = 1;
L17:
	si = si + 1;
	if (loc_4 > si) {
		goto L14;
	}
L13:
	ax2 = int2F_dispatch_10();
	if (di != 0) {
		goto L18;
	}
	smem_dma_init(di);
L18:
	__movs2((unsigned char far *)B_9D5A, (unsigned char far *)B_8A0E, 50);
	program_select(PGM_SLOT);
	return sample_proc_wrapper();
L16:
	G_ERRNO = 1;
L2:
	int2F_dispatch_10();
	return (long)MK_FP((int)(err_msg_report() >> 16), 0);
}
