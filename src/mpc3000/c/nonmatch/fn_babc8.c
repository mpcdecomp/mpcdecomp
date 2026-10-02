/* differs: 308 at +4, 55 bytes; 311 at +4, 55 bytes; 312 at +4, 55 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_babc8(long arg_0, int arg_2)
{
    int dx;
    int es;
    int si;

    dx = ~__repne_scas1((int)arg_0, 0, -1) - 2;
    si = *(int *)((char *)&arg_0 + 0) + dx;
    goto L1;
L2:
    es = arg_2;
    if (*(char far *)MK_FP(es, si) != 95) {
        goto L3;
    }
    *(char far *)MK_FP(es, si) = (char)0;
    si = si - 1;
    dx = dx - 1;
L1:
    if (dx >= 0) {
        goto L2;
    }
L3:
    return ((long)dx << 16 | (unsigned)0);
}
