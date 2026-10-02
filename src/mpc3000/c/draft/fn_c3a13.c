/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_W_F000 {
    long f_0;
    char pad_4[15];
    char f_13;
};
struct g_W_EFFC {
    long f_0;
};
extern char B_83BA;
extern char B_83BD;
extern int W_83BE;
extern int W_EFE8;
extern int W_EFEA;
extern int W_EFEC;
extern int W_EFF0;
extern int W_EFF2;
extern int W_EFF4;
extern int W_EFF8;
extern int W_EFFA;
extern struct g_W_EFFC W_EFFC;
extern struct g_W_F000 W_F000;
extern long far far_cd68a(long, long, long);
extern long far far_fa0c8(int, int, int);
extern long far fn_c3690(long, long, long, long, long, int);
long far fn_c3690(long p0, long p1, long p2, long p3, long p4, int p5) { return 0; }

long far fn_c3a13(void)
{
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    unsigned int dx;
    unsigned int dx2;
    unsigned int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int dx6;
    int dx7;
    int es;
    int es2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    ax = W_83BE;
    t1 = far_fa0c8(0x113a, ax, -(ax < 0));
    loc_a = (int)(t1 >> 16);
    loc_c = (int)t1;
    if (B_83BA >= 2) {
        t3 = fn_c3690(W_EFFC.f_0, *(long *)((char *)&W_EFF0 + 0), *(long *)((char *)&W_EFE8 + 0), *(long *)((char *)&loc_c + 0), *(long *)((char *)&W_EFEC + 0), 0);
        loc_2 = (int)(t3 >> 16);
        loc_4 = (int)t3;
        dx2 = W_EFE8;
        dx3 = dx2 + W_EFF8;
        t4 = fn_c3690(*(long *)((char *)&W_EFF8 + 0), *(long *)((char *)&W_EFF0 + 0), MK_FP((int)(((long)(W_EFEA + W_EFFA + (dx3 < dx2)) << 16 | (unsigned)dx3) - W_EFFC.f_0 >> 16), dx3 - *(int *)((char *)&W_EFFC + 0)), *(long *)((char *)&loc_c + 0), *(long *)((char *)&W_EFEC + 0), 1);
        loc_6 = (int)(t4 >> 16);
        loc_8 = (int)t4;
        dx4 = loc_4;
        dx5 = dx4 + loc_c;
        t5 = far_cd68a(*(long *)((char *)&loc_8 + 0), ((long)(loc_2 + loc_a + (dx5 < dx4)) << 16 | (unsigned)dx5), *(long *)((char *)&loc_c + 0));
        *(char far *)((char far *)W_F000.f_0 + 19) = (char)1;
    } else {
        dx = W_EFF0;
        t2 = fn_c3690(*(long *)((char *)&W_EFF4 + 0), ((long)(W_EFF2 << 1 | dx >> 15 & 1) << 16 | (unsigned)(dx << 1)), *(long *)((char *)&W_EFE8 + 0), t1, *(long *)((char *)&W_EFEC + 0), 0);
        loc_2 = (int)(t2 >> 16);
        loc_4 = (int)t2;
        *(char far *)((char far *)W_F000.f_0 + 19) = (char)0;
    }
    bx = (int)W_F000.f_0;
    es = (int)(W_F000.f_0 >> 16);
    ax2 = loc_a;
    dx6 = loc_c;
    *(int far *)MK_FP(es, bx + 26) = ax2;
    *(int far *)MK_FP(es, bx + 24) = dx6;
    *(int far *)MK_FP(es, bx + 30) = ax2;
    *(int far *)MK_FP(es, bx + 28) = dx6;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_83BD);
    t6 = far_fa0c8(0x1b9, (char)ax3, -((char)ax3 < 0));
    t7 = t6 / 10L;
    bx2 = (int)W_F000.f_0;
    es2 = (int)(W_F000.f_0 >> 16);
    *(int far *)MK_FP(es2, bx2 + 22) = (int)(t7 >> 16);
    *(int far *)MK_FP(es2, bx2 + 20) = (int)t7;
    ax4 = loc_2;
    dx7 = loc_4;
    *(int far *)MK_FP(es2, bx2 + 34) = ax4;
    *(int far *)MK_FP(es2, bx2 + 32) = dx7;
    return ((long)dx7 << 16 | (unsigned)ax4);
}
