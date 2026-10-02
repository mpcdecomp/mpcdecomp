/* differs: 308 at +3, 71 bytes; 311 at +3, 71 bytes; 312 at +3, 71 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far fn_e3bdf(long arg_0)
{
    int bx;
    int bx2;
    int dx;
    int es;
    int es2;

    dx = 0;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if (*(char far *)MK_FP(es, bx) >= 0) {
        dx = 1 << (unsigned char)*(char far *)MK_FP(es, bx);
    }
    *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    if (*(char far *)MK_FP(es2, bx2) >= 0) {
        dx = dx | 1 << (unsigned char)*(char far *)MK_FP(es2, bx2);
    }
    return ((long)dx << 16 | (unsigned)dx);
}
