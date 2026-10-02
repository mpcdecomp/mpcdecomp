/* differs: 308 at +5, 451 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern long far far_e05c0(int, int, int, int);
long far far_e05c0(int p0, int p1, int p2, int p3) { return 0; }

long far far_e0c37(long arg_0, int arg_4, int arg_6, int arg_8, int arg_10)
{
    char far *loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int cx;
    unsigned int dx;
    unsigned int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int flags;
    int p10;
    int p12;
    int p14;
    int p16;
    int p8;
    long t1;

    loc_2 = arg_6;
    *(int *)((char *)&loc_4 + 0) = arg_4;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    dx = arg_8;
    dx2 = dx + *(int far *)MK_FP(es, bx + 8);
    ax = arg_10 + *(int far *)MK_FP(es, bx + 10) + (dx2 < dx);
    flags = ax - *(int far *)MK_FP(es, bx + 6);
    if (!CC("<u", flags) && (CC("!=", flags) || dx2 >= (unsigned int)*(int far *)MK_FP(es, bx + 4))) {
        return ((long)dx2 << 16 | (unsigned)0);
    }
    for (;;) {
        ax2 = arg_8;
        dx3 = arg_10;
        arg_8 = arg_8 - 1;
        arg_10 = arg_10 - (arg_8 == 0);
        if ((ax2 | dx3) == 0) {
            break;
        }
        es4 = (int)(arg_0 >> 16);
        bx4 = (int)*(long far *)MK_FP(es4, (int)arg_0 + 12);
        *loc_4 = *(char far *)MK_FP((int)(*(long far *)MK_FP(es4, bx4 + 12) >> 16), bx4);
        bx5 = (int)arg_0;
        es5 = (int)(arg_0 >> 16);
        if (0 || *(int far *)MK_FP(es5, bx5 + 12) != -1) {
            bx6 = (int)arg_0;
            es6 = (int)(arg_0 >> 16);
            *(int far *)MK_FP(es6, bx6 + 12) = *(int far *)MK_FP(es6, bx6 + 12) + 1;
            ax3 = *(int far *)MK_FP(es6, bx6 + 12);
            *(int far *)MK_FP(es6, bx6 + 14) = (int)(*(long far *)MK_FP(es6, bx6 + 12) + 1L >> 16);
            dx6 = *(int far *)MK_FP(es6, bx6 + 14);
        } else {
            p8 = 0;
            p10 = 1;
            p12 = *(int far *)MK_FP(es5, bx5 + 14);
            p14 = *(int far *)MK_FP(es5, bx5 + 12);
            p16 = 0xe8ad;
            t1 = far_e05c0(p14, p12, p10, p8);
            cx = UNDEF;
            ax3 = (int)t1;
            dx6 = (int)(t1 >> 16);
        }
        bx7 = (int)arg_0;
        es7 = (int)(arg_0 >> 16);
        *(int far *)MK_FP(es7, bx7 + 14) = dx6;
        *(int far *)MK_FP(es7, bx7 + 12) = ax3;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    }
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    if (*(int far *)MK_FP(es2, bx2 + 16) == 0) {
        bx3 = (int)arg_0;
        es3 = (int)(arg_0 >> 16);
        dx5 = arg_8;
        *(int far *)MK_FP(es3, bx3 + 8) = *(int far *)MK_FP(es3, bx3 + 8) + dx5;
        *(int far *)MK_FP(es3, bx3 + 10) = (int)(*(long far *)MK_FP(es3, bx3 + 8) + ((long)arg_10 << 16 | (unsigned)dx5) >> 16);
    } else {
        dx4 = *(int far *)MK_FP(es2, bx2 + 12);
        *(int far *)MK_FP(es2, bx2 + 2) = *(int far *)MK_FP(es2, bx2 + 14);
        *(int far *)MK_FP(es2, bx2) = dx4;
        dx5 = arg_8;
        *(int far *)MK_FP(es2, bx2 + 4) = *(int far *)MK_FP(es2, bx2 + 4) - dx5;
        *(int far *)MK_FP(es2, bx2 + 6) = (int)(*(long far *)MK_FP(es2, bx2 + 4) - ((long)arg_10 << 16 | (unsigned)dx5) >> 16);
    }
    return ((long)dx5 << 16 | (unsigned)1);
}
