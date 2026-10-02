/* differs: 308 at +5, 385 bytes; 311 at +5, 384 bytes; 312 at +5, 383 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern long far far_e49dd(int);

long far far_b915e(long arg_0, long arg_4, int arg_8)
{
    unsigned int loc_4;
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
    int bx8;
    int dx;
    unsigned int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int flags;
    int flags2;
    int flags3;

    loc_2 = (int)far_e49dd(arg_8) + 1;
    loc_4 = 0x100;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = *(int far *)MK_FP(es, bx + 2);
    flags = ax - loc_2;
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)*(int far *)MK_FP(es, bx) > loc_4)) {
        bx2 = (int)arg_0;
        es2 = (int)(arg_0 >> 16);
        *(int far *)MK_FP(es2, bx2 + 2) = loc_2;
        *(int far *)MK_FP(es2, bx2) = loc_4;
    }
    bx3 = (int)arg_4;
    es3 = (int)(arg_4 >> 16);
    ax2 = *(int far *)MK_FP(es3, bx3 + 2);
    bx4 = (int)arg_0;
    es4 = (int)(arg_0 >> 16);
    flags2 = ax2 - *(int far *)MK_FP(es4, bx4 + 2);
    if (!CC(">", flags2) && (CC("!=", flags2) || (unsigned int)*(int far *)MK_FP(es3, bx3) <= (unsigned int)*(int far *)MK_FP(es4, bx4))) {
        bx5 = (int)arg_0;
        es5 = (int)(arg_0 >> 16);
        dx = *(int far *)MK_FP(es5, bx5);
        bx6 = (int)arg_4;
        es6 = (int)(arg_4 >> 16);
        *(int far *)MK_FP(es6, bx6 + 2) = *(int far *)MK_FP(es5, bx5 + 2);
        *(int far *)MK_FP(es6, bx6) = dx;
    }
    bx7 = (int)arg_4;
    es7 = (int)(arg_4 >> 16);
    ax3 = *(int far *)MK_FP(es7, bx7 + 2);
    dx2 = *(int far *)MK_FP(es7, bx7);
    flags3 = ax3 - loc_2;
    if (!CC("<", flags3) && (CC(">", flags3) || dx2 > loc_4)) {
        bx8 = (int)arg_4;
        es8 = (int)(arg_4 >> 16);
        ax3 = loc_2;
        dx2 = loc_4;
        *(int far *)MK_FP(es8, bx8 + 2) = ax3;
        *(int far *)MK_FP(es8, bx8) = dx2;
    }
    return ((long)dx2 << 16 | (unsigned)ax3);
}
