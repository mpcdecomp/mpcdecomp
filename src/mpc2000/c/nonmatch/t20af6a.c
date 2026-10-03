/* differs: 150 size 294, image 252; +1 image `enter 6, 0` CL `enter 0x10, 0`; 172 size 294, image 252; +1 image `enter 6, 0` CL `enter 0x10, 0` */
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
struct g_SMEM_POOL_LEN_HI {
    int f_0;
};
struct g_SMEM_POOL_LEN {
    int f_0;
};
extern int G_ERRNO;
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern long __far __pascal far_memop_caller(long, long);
extern long __far __pascal mem_io_handler(int far *, int, int, int);
extern long __far __pascal smem_alloc(long);
extern long __far __pascal smem_free(int);

int __far __pascal midi_calc_timing(int arg_4, int arg_2, int arg_0)
{
	int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	unsigned int ax2;
	int bx;
	int bx2;
	int bx3;
	int bx4;
	int dx;
	char far *t1;
	char far *t2;
	char far *t3;
	char far *t4;
	char far *t5;
	char far *t6;

	if ((int)mem_io_handler((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), arg_4, arg_2, arg_0) != 0) {
		goto L1;
	}
	goto L2;
L1:
	t1 = smem_free(loc_6);
	bx = ((loc_6 << 2) + loc_6) * 2;
	ax = *(int *)((char *)&SMEM_POOL + 0 + bx);
	dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx);
	loc_4 = ax;
	loc_2 = dx;
	t2 = far_memop_caller(((long)dx << 16 | (unsigned)ax), *(long *)((char *)&arg_2 + 0));
	if ((int)FP_OFF(t2) != arg_2) {
		goto L3;
	}
	if ((int)FP_SEG(t2) != arg_4) {
		goto L3;
	}
	if (arg_0 == 0) {
		goto L4;
	}
	bx2 = ((loc_6 << 2) + loc_6) * 2;
	t3 = ((long)*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx2) << 16 | (unsigned)*(int *)((char *)&SMEM_POOL_LEN + 0 + bx2)) / 2L;
	ax2 = (int)FP_OFF(t3) + loc_4;
	t4 = far_memop_caller(((long)((int)FP_SEG(t3) + loc_2 + (ax2 < (unsigned int)(int)FP_OFF(t3))) << 16 | (unsigned)ax2), *(long *)((char *)&arg_2 + 0));
	if ((int)FP_OFF(t4) != arg_2) {
		goto L3;
	}
	if ((int)FP_SEG(t4) == arg_4) {
		goto L4;
	}
L3:
	G_ERRNO = 4;
	goto L2;
L4:
	bx3 = ((loc_6 << 2) + loc_6) * 2;
	t5 = smem_alloc(((long)*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx3) << 16 | (unsigned)*(int *)((char *)&SMEM_POOL_LEN + 0 + bx3)));
	loc_6 = (int)FP_OFF(t5);
	if ((int)FP_OFF(t5) == -1) {
		goto L5;
	}
	bx4 = ((loc_6 << 2) + loc_6) * 2;
	if (*(int *)((char *)&SMEM_POOL + 0 + bx4) != loc_4) {
		goto L5;
	}
	if (*(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx4) != loc_2) {
		goto L5;
	}
	return loc_6;
L5:
	G_ERRNO = 5;
	t6 = smem_free(loc_6);
L2:
	return -1;
}
