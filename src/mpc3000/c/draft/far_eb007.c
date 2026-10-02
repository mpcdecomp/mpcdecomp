/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
struct s1 {
    int f_0;
    char pad_2[1];
    char f_3;
};
struct s2 {
    char pad_0[1];
    char f_1;
};
extern char B_8800;
extern char B_8802;
extern unsigned char B_901B[];
extern unsigned char TBL_86AE[];
extern long far far_fa0c8(int, int, int);

long far far_eb007(struct s2 far *arg_0, int arg_2, int arg_4, int arg_6, long arg_8)
{
    struct s1 far *loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    char loc_3;
    unsigned int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int di;
    int es;
    int es2;
    int es3;
    int es4;
    unsigned int si;
    long t1;
    long t2;
    long t3;

    bx = (int)arg_8;
    es = (int)(arg_8 >> 16);
    *(int far *)MK_FP(es, bx + 2) = 0;
    *(int far *)MK_FP(es, bx) = 0;
    loc_2 = arg_6;
    loc_4 = arg_4;
    if (B_8800 == 0) {
        goto L1;
    }
    ax = SEG_DATA;
    if (arg_2 != ax || *(int *)((char *)&arg_0 + 0) != (unsigned int)(unsigned)B_901B) {
L1:
        if ((arg_0->f_1 & 2) == 0) {
            return ((long)arg_2 << 16 | (unsigned)(*(int *)((char *)&arg_0 + 0) + 60));
        }
        ax = arg_2;
        loc_8 = ax;
        *(int *)((char *)&loc_a + 0) = *(int *)((char *)&arg_0 + 0) + 0x29a;
        goto L2;
    }
    if (B_8802 == 0) {
        return ((long)arg_2 << 16 | (unsigned)(*(int *)((char *)&arg_0 + 0) + 60));
    }
    loc_8 = SEG_DATA;
    *(int *)((char *)&loc_a + 0) = (int)(unsigned)TBL_86AE;
L2:
    di = loc_a->f_0;
    loc_6 = 0;
    while (loc_6 == 0) {
        *(int *)((char *)&loc_a + 0) = *(int *)((char *)&loc_a + 0) + 4;
        si = loc_a->f_0;
        if (loc_2 < si) {
            si = loc_2;
            loc_6 = 1;
        }
        *(int *)((char *)&loc_a + 0) = *(int *)((char *)&loc_a + 0) - 4;
        bx3 = FP_OFF(loc_a);
        es3 = FP_SEG(loc_a);
        ax3 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es3, bx3 + 3));
        ax4 = ((char)-((char)ax3 < 0) << 8 | (unsigned char)*(char far *)MK_FP(es3, bx3 + 2));
        t1 = far_fa0c8(0x180, (char)ax4, -((char)ax4 < 0));
        t2 = t1 / (long)(int)(char)ax3;
        t3 = far_fa0c8(si - di, (int)t2, (int)(t2 >> 16));
        ax = (int)t3;
        bx4 = (int)arg_8;
        es4 = (int)(arg_8 >> 16);
        *(int far *)MK_FP(es4, bx4) = *(int far *)MK_FP(es4, bx4) + ax;
        *(int far *)MK_FP(es4, bx4 + 2) = FP_SEG(MK_FP((int)(t3 >> 16), ax) + *(long far *)MK_FP(es4, bx4));
        di = si;
        *(int *)((char *)&loc_a + 0) = *(int *)((char *)&loc_a + 0) + 4;
    }
    *(int *)((char *)&loc_a + 0) = *(int *)((char *)&loc_a + 0) - 4;
    ax2 = (int)(0x180L / (long)(signed char)loc_a->f_3) * (loc_3 - 1) + *(char *)((char *)&loc_4 + 0);
    bx2 = (int)arg_8;
    es2 = (int)(arg_8 >> 16);
    *(int far *)MK_FP(es2, bx2) = *(int far *)MK_FP(es2, bx2) + ax2;
    *(int far *)MK_FP(es2, bx2 + 2) = (int)(*(long far *)MK_FP(es2, bx2) + (long)(int)ax2 >> 16);
    return ((long)loc_8 << 16 | (unsigned)(*(int *)((char *)&loc_a + 0) + 2));
}
