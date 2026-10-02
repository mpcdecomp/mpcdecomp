/* differs: 308 at +3, 195 bytes; 311 at +3, 191 bytes; 312 at +3, 191 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_bd1d1(long arg_0, long arg_4)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    unsigned int dx;
    unsigned int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int flags2;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = *(int far *)MK_FP(es, bx + 2);
    dx = *(int far *)MK_FP(es, bx);
    bx2 = (int)arg_4;
    es2 = (int)(arg_4 >> 16);
    flags = ax - *(int far *)MK_FP(es2, bx2 + 2);
    if (!CC(">", flags) && (CC("<", flags) || dx < (unsigned int)*(int far *)MK_FP(es2, bx2))) {
        return ((long)dx << 16 | (unsigned)-1);
    }
    bx3 = (int)arg_0;
    es3 = (int)(arg_0 >> 16);
    ax2 = *(int far *)MK_FP(es3, bx3 + 2);
    dx2 = *(int far *)MK_FP(es3, bx3);
    bx4 = (int)arg_4;
    es4 = (int)(arg_4 >> 16);
    flags2 = ax2 - *(int far *)MK_FP(es4, bx4 + 2);
    if (CC("<", flags2) || !CC(">", flags2) && dx2 <= (unsigned int)*(int far *)MK_FP(es4, bx4)) {
        return ((long)dx2 << 16 | (unsigned)0);
    }
    return ((long)dx2 << 16 | (unsigned)1);
}
