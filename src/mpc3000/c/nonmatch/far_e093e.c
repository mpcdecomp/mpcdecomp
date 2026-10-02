/* differs: 308 at +5, 376 bytes; 311 at +5, 373 bytes; 312 at +5, 373 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_e05c0(int, int, int, int);
long far far_e05c0(int p0, int p1, int p2, int p3) { return 0; }

long far far_e093e(long arg_0, int arg_4, int arg_6, int arg_8, int arg_10)
{
    int loc_2;
    char far *loc_4;
    int loc_6;
    int loc_8;
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    unsigned int ax5;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int cx;
    unsigned int dx;
    unsigned int dx2;
    int dx3;
    int dx4;
    int dx5;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int flags;
    int p16;
    int p18;
    int p20;
    int p22;
    long t1;

    loc_2 = arg_6;
    *(int *)((char *)&loc_4 + 0) = arg_4;
    ax = arg_10;
    dx = arg_8;
    loc_6 = ax;
    loc_8 = dx;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    dx2 = dx + *(int far *)MK_FP(es, bx + 8);
    ax2 = ax + *(int far *)MK_FP(es, bx + 10) + (dx2 < dx);
    flags = ax2 - *(int far *)MK_FP(es, bx + 6);
    if (!CC("<u", flags) && (CC(">u", flags) || dx2 > (unsigned int)*(int far *)MK_FP(es, bx + 4))) {
        return ((long)dx2 << 16 | (unsigned)0);
    }
    for (;;) {
        ax3 = loc_8;
        dx3 = loc_6;
        loc_8 = loc_8 - 1;
        loc_6 = loc_6 - (loc_8 == 0);
        if ((ax3 | dx3) == 0) {
            break;
        }
        es3 = (int)(arg_0 >> 16);
        bx3 = (int)*(long far *)MK_FP(es3, (int)arg_0 + 12);
        *(char far *)MK_FP((int)(*(long far *)MK_FP(es3, bx3 + 12) >> 16), bx3) = *loc_4;
        bx4 = (int)arg_0;
        es4 = (int)(arg_0 >> 16);
        if (1 && *(int far *)MK_FP(es4, bx4 + 12) == -1) {
            p16 = 1;
            p18 = *(int far *)MK_FP(es4, bx4 + 14);
            p20 = *(int far *)MK_FP(es4, bx4 + 12);
            p22 = 0xe094;
            t1 = far_e05c0(p20, p18, p16, 0);
            cx = UNDEF;
            ax4 = (int)t1;
            dx5 = (int)(t1 >> 16);
        } else {
            bx5 = (int)arg_0;
            es5 = (int)(arg_0 >> 16);
            ax5 = *(int far *)MK_FP(es5, bx5 + 12);
            ax4 = ax5 + 1;
            dx5 = *(int far *)MK_FP(es5, bx5 + 14) + (ax4 < ax5);
        }
        bx6 = (int)arg_0;
        es6 = (int)(arg_0 >> 16);
        *(int far *)MK_FP(es6, bx6 + 14) = dx5;
        *(int far *)MK_FP(es6, bx6 + 12) = ax4;
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 1;
    }
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    dx4 = arg_8;
    *(int far *)MK_FP(es2, bx2 + 8) = *(int far *)MK_FP(es2, bx2 + 8) + dx4;
    *(int far *)MK_FP(es2, bx2 + 10) = (int)(*(long far *)MK_FP(es2, bx2 + 8) + ((long)arg_10 << 16 | (unsigned)dx4) >> 16);
    return ((long)dx4 << 16 | (unsigned)1);
}
