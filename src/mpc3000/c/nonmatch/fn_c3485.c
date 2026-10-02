/* differs: 308 at +5, 261 bytes; 311 at +5, 261 bytes; 312 at +5, 261 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_c3485(unsigned int arg_0, int arg_2, long arg_4)
{
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    unsigned int bx5;
    unsigned int bx6;
    unsigned int bx7;
    unsigned int dx;
    unsigned int dx2;
    int dx3;
    int dx4;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int flags2;
    int si;
    int si2;

    bx = (int)arg_4;
    es = (int)(arg_4 >> 16);
    ax = *(int far *)MK_FP(es, bx + 6);
    flags = ax - arg_2;
    if (CC(">", flags)) {
        goto L1;
    }
    if (CC("!=", flags)) {
        goto L2;
    }
    if ((unsigned int)*(int far *)MK_FP(es, bx + 4) > arg_0) {
        goto L1;
    }
L2:
    bx2 = (int)arg_4;
    es2 = (int)(arg_4 >> 16);
    dx = *(int far *)MK_FP(es2, bx2 + 12);
    si = arg_0;
    dx2 = dx + (si - *(int far *)MK_FP(es2, bx2 + 4));
    loc_2 = *(int far *)MK_FP(es2, bx2 + 14) + (int)(((long)arg_2 << 16 | (unsigned)si) - *(long far *)MK_FP(es2, bx2 + 4) >> 16) + (dx2 < dx);
    *(int *)((char *)&loc_4 + 0) = dx2;
    goto L3;
L1:
    bx3 = (int)arg_4;
    es3 = (int)(arg_4 >> 16);
    ax2 = *(int far *)MK_FP(es3, bx3 + 10);
    flags2 = ax2 - arg_2;
    if (CC("<", flags2)) {
        goto L4;
    }
    if (CC(">", flags2)) {
        goto L5;
    }
    if ((unsigned int)*(int far *)MK_FP(es3, bx3 + 8) <= arg_0) {
        goto L4;
    }
L5:
    bx4 = (int)arg_4;
    es4 = (int)(arg_4 >> 16);
    dx3 = *(int far *)MK_FP(es4, bx4);
    bx5 = *(int far *)MK_FP(es4, bx4 + 12);
    bx6 = bx5 + (dx3 - *(int far *)MK_FP(es4, bx4 + 4));
    si2 = *(int *)((char *)&arg_4 + 0);
    dx4 = arg_0;
    bx7 = bx6 + (dx4 - *(int far *)MK_FP(es4, si2 + 12));
    loc_2 = *(int far *)MK_FP(es4, bx4 + 14) + (int)(((long)*(int far *)MK_FP(es4, bx4 + 2) << 16 | (unsigned)dx3) - *(long far *)MK_FP(es4, bx4 + 4) >> 16) + (bx6 < bx5) + (int)(((long)arg_2 << 16 | (unsigned)dx4) - *(long far *)MK_FP(es4, si2 + 12) >> 16) + (bx7 < bx6);
    *(int *)((char *)&loc_4 + 0) = bx7;
    goto L3;
L4:
    loc_2 = -1;
    *(int *)((char *)&loc_4 + 0) = -1;
L3:
    return loc_4;
}
