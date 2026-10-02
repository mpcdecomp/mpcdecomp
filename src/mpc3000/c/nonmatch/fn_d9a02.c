/* differs: 308 at +0, 103 bytes; 311 at +0, 103 bytes; 312 at +0, 103 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern unsigned int W_9021;
extern int W_9023;
extern int W_9025;
extern int W_9027;
extern int W_902D;
extern int W_902F;

long near fn_d9a02(void)
{
    int bx;
    int di;
    unsigned int di2;
    int dx;
    int es;
    int flags;

    *(char far *)MK_FP(es, di) = (char)bx;
    dx = es;
    di2 = di + 1;
    if (di2 != 0) {
        goto L1;
    }
    dx = dx + 0x1000;
L1:
    flags = dx - W_9023;
    if (CC("<u", flags)) {
        goto L2;
    }
    if (CC("!=", flags)) {
        goto L3;
    }
    if (di2 < W_9021) {
        goto L2;
    }
L3:
    dx = W_9027;
    di2 = W_9025;
L2:
    if (di2 != W_902D) {
        goto L4;
    }
    if (dx != W_902F) {
        goto L4;
    }
    return (long)MK_FP(es, -1);
L4:
    return ((long)dx << 16 | (unsigned)0);
}
