/* differs: 308 at +4, 47 bytes; 311 at +4, 47 bytes; 312 at +4, 47 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_e0593(int arg_0, int arg_2, int arg_4)
{
    int dx;
    int si;

    dx = 0;
    si = arg_0 + 66;
    goto L1;
L2:
    if (*(char far *)MK_FP(arg_2, si) != arg_4) {
        goto L3;
    }
    return ((long)dx << 16 | (unsigned)dx);
L3:
    si = si + 1;
    dx = dx + 1;
L1:
    if (dx <= 99) {
        goto L2;
    }
    return ((long)dx << 16 | (unsigned)arg_4);
}
