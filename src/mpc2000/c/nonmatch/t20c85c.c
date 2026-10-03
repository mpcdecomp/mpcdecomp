/* differs: 150 size 212, image 252; +8 image `mov si, word ptr [bp + 0xa]` CL `mov si, word ptr [bp + 6]`; 172 size 212, image 252; +8 image `mov si, word ptr [bp + 0xa]` CL `mov si, word ptr [bp + 6]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_SMEM_POOL {
    int f_0;
};
struct g_SMEM_POOL_BASE_HI {
    int f_0;
};
extern int G_ERRNO;
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern void __far __pascal _memcpy_6(char far *, long);
extern long __far __pascal bcd_display_calc(char far *, int);
extern void __far __pascal bcd_time_format(long, long);
extern int __far int2F_call_fn14(long);
extern void __far int2F_dispatch_10(void);
extern long __far __pascal mem_block_process(int, int, int);

long __far __pascal far_memop_handler_2(int arg_6, int arg_4, int arg_2, int arg_0)
{
	char loc_32[40];
	char loc_a;
	char loc_9;
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	unsigned int ax4;
	unsigned int ax5;
	int bx;
	int dx;
	int dx2;
	int dx3;
	int es;
	int t1;
	long t2;
	long t3;
	long t4;
	int t5;
	int t6;
	int t7;
	int t8;

	loc_a = (char)1;
	loc_9 = (char)4;
	_memcpy_6((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), ((long)arg_6 << 16 | (unsigned)arg_4));
	dx = UNDEF;
	if (int2F_call_fn14(((long)arg_2 << 16 | (unsigned)arg_0)) != 0) {
		goto L1;
	}
	G_ERRNO = 13;
	goto L2;
L1:
	t2 = mem_block_process(arg_2, arg_0, 0);
	dx = (int)(t2 >> 16);
	if ((int)t2 != 0) {
		goto L3;
	}
	goto L2;
L3:
	t3 = bcd_display_calc((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 2);
	dx = (int)(t3 >> 16);
	if ((int)t3 != 0) {
		goto L4;
	}
	goto L2;
L4:
	t4 = bcd_display_calc((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_32), 40);
	dx = (int)(t4 >> 16);
	if ((int)t4 != 0) {
		goto L5;
	}
	goto L2;
L5:
	es = arg_6;
	bx = ((*(int far *)MK_FP(es, arg_4 + 48) << 2) + *(int far *)MK_FP(es, arg_4 + 48)) * 2;
	ax = *(int *)((char *)&SMEM_POOL + 0 + bx);
	dx2 = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx);
	loc_4 = ax;
	loc_2 = dx2;
	ax2 = *(int far *)MK_FP(es, arg_4 + 28);
	dx3 = *(int far *)MK_FP(es, arg_4 + 30);
	loc_8 = ax2;
	loc_6 = dx3;
	bcd_time_format(((long)dx2 << 16 | (unsigned)ax), ((long)dx3 << 16 | (unsigned)ax2));
	if (UNDEF == 0) {
		goto L6;
	}
	if (*(char far *)MK_FP(arg_6, arg_4 + 19) == 0) {
		goto L7;
	}
	ax3 = *(int far *)MK_FP(arg_6, arg_4 + 28);
	ax4 = ((char)(ax3 + 15 >> 8) << 8 | (unsigned char)((char)ax3 + 15 & -16));
	ax5 = ax4 + loc_4;
	bcd_time_format(((long)((int)(((long)*(int far *)MK_FP(arg_6, arg_4 + 30) << 16 | (unsigned)ax3) + 15L >> 16) + loc_2 + (ax5 < ax4)) << 16 | (unsigned)ax5), *(long *)((char *)&loc_8 + 0));
	if (UNDEF != 0) {
		goto L7;
	}
L6:
	int2F_dispatch_10();
	dx = UNDEF;
	goto L2;
L7:
	int2F_dispatch_10();
	return ((long)UNDEF << 16 | (unsigned)1);
L2:
	return ((long)dx << 16 | (unsigned)0);
}
