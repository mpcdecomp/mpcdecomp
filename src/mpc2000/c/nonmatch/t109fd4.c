/* differs: 150 size 242, image 232; +1 image `enter 0xe, 0` CL `enter 0xc, 0`; 172 size 242, image 232; +1 image `enter 0xe, 0` CL `enter 0xc, 0` */
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
extern int G_ERRNO;
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern int __far _longjmp(void far *, int);
extern long __far __pascal far_memop_caller(long, long);
extern long __far __pascal mem_io_handler(int far *, int, int, int);
extern long __far __pascal smem_alloc(long);
extern long __far __pascal smem_free(int);
extern long __far __pascal x_aFldiv(int, int, int, int);

void __near __pascal track_event_handler(int arg_2, int arg_0)
{
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int dx;
    int dx2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;

    t1 = x_aFldiv(0, 2, arg_2, arg_0);
    loc_8 = (int)t1;
    loc_6 = (int)(t1 >> 16);
    if ((int)mem_io_handler((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_e), (int)(t1 >> 16), (int)t1, 0) != 0) {
        goto L1;
    }
    t2 = _longjmp(MK_FP(SEG_DATA, -0x64b6), G_ERRNO);
L1:
    bx = loc_e;
    bx2 = ((bx << 2) + bx) * 2;
    dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx2);
    loc_4 = *(int *)((char *)&SMEM_POOL + 0 + bx2);
    loc_2 = dx;
    dx2 = *(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx2);
    loc_c = *(int *)((char *)&SMEM_POOL_LEN + 0 + bx2);
    loc_a = dx2;
    t3 = smem_free(loc_e);
    t4 = far_memop_caller(*(long *)((char *)&loc_4 + 0), *(long *)((char *)&loc_8 + 0));
    if ((int)t4 != loc_8) {
        goto L2;
    }
    if ((int)(t4 >> 16) == loc_6) {
        goto L3;
    }
L2:
    t5 = _longjmp(MK_FP(SEG_DATA, -0x64b6), G_ERRNO);
L3:
    t6 = smem_alloc(*(long *)((char *)&loc_c + 0));
    loc_e = (int)t6;
    if ((int)t6 == -1) {
        goto L4;
    }
    bx3 = loc_e;
    bx4 = ((bx3 << 2) + bx3) * 2;
    if (*(int *)((char *)&SMEM_POOL + 0 + bx4) != loc_4) {
        goto L4;
    }
    if (*(int *)((char *)&SMEM_POOL_BASE_HI + 0 + bx4) == loc_2) {
        goto L5;
    }
L4:
    if (loc_e == -1) {
        goto L6;
    }
    t7 = smem_free(loc_e);
L6:
    t8 = _longjmp(MK_FP(SEG_DATA, -0x64b6), 5);
L5:
    return;
}
