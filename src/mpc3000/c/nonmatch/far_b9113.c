/* differs: 308 at +3, 122 bytes; 311 at +3, 122 bytes; 312 at +3, 122 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
long far far_b9113(long arg_0, int far *arg_4, int arg_8)
{
    int ax;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int es;
    int es2;
    int es3;
    int es4;

    if (arg_8 >= 1) {
        goto L1;
    }
    arg_8 = 1;
L1:
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if (*(int far *)MK_FP(es, bx) <= arg_8) {
        goto L2;
    }
    *(int far *)MK_FP(es, bx) = arg_8;
L2:
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    if (*(int far *)MK_FP(es2, bx2) >= 1) {
        goto L3;
    }
    *(int far *)MK_FP(es2, bx2) = 1;
L3:
    ax = *arg_4;
    bx3 = (int)arg_0;
    es3 = (int)(arg_0 >> 16);
    if (ax >= *(int far *)MK_FP(es3, bx3)) {
        goto L4;
    }
    ax = *(int far *)MK_FP(es3, bx3);
    *arg_4 = ax;
L4:
    bx4 = FP_OFF(arg_4);
    es4 = FP_SEG(arg_4);
    if (*(int far *)MK_FP(es4, bx4) <= arg_8) {
        goto L5;
    }
    *(int far *)MK_FP(es4, bx4) = arg_8;
L5:
    return ((long)arg_8 << 16 | (unsigned)ax);
}
