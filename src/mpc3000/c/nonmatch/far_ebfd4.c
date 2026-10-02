/* differs: 308 at +5, 202 bytes; 311 at +5, 202 bytes; 312 at +5, 202 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern long far fn_ebf38(long, int, int);
long far fn_ebf38(long p0, int p1, int p2) { return 0; }

long far far_ebfd4(long arg_0, int arg_2, int arg_4, int arg_6)
{
    unsigned int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    long t1;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    dx = arg_4;
    *(int far *)MK_FP(es, bx + 8) = *(int far *)MK_FP(es, bx + 8) + dx;
    *(int far *)MK_FP(es, bx + 10) = (int)(*(long far *)MK_FP(es, bx + 8) + ((long)arg_6 << 16 | (unsigned)dx) >> 16);
    t1 = fn_ebf38(((long)arg_2 << 16 | (unsigned)bx), *(int far *)MK_FP(es, bx + 8), *(int far *)MK_FP(es, bx + 10));
    loc_2 = (int)(t1 >> 16);
    loc_4 = (int)t1;
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    ax = *(int far *)MK_FP(es2, bx2 + 14);
    flags = ax - loc_2;
    if (CC(">u", flags)) {
        goto L1;
    }
    if (CC("<u", flags)) {
        goto L2;
    }
    if ((unsigned int)*(int far *)MK_FP(es2, bx2 + 12) >= loc_4) {
        goto L1;
    }
L2:
    dx2 = loc_2;
    ax2 = loc_4;
    goto L3;
L1:
    bx3 = (int)arg_0;
    es3 = (int)(arg_0 >> 16);
    dx2 = *(int far *)MK_FP(es3, bx3 + 14);
    ax2 = *(int far *)MK_FP(es3, bx3 + 12);
L3:
    bx4 = (int)arg_0;
    es4 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es4, bx4 + 14) = dx2;
    *(int far *)MK_FP(es4, bx4 + 12) = ax2;
    return ((long)dx2 << 16 | (unsigned)ax2);
}
