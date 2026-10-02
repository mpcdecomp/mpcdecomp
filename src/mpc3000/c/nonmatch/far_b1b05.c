/* differs: 308 at +3, 120 bytes; 311 at +3, 120 bytes; 312 at +3, 120 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
int far far_b1b05(long arg_0)
{
    int ax;
    int bx;
    int bx2;
    int cx;
    int di;
    int ds;
    int dx;
    int es;
    int si;

    di = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    for (;;) {
        bx2 = ((char)(bx >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, di));
        if ((char)bx2 == 0) {
            break;
        }
        ax = __insn("int 0x43", 4, bx2, cx, dx, si, di, es, ds);
        bx = UNDEF;
        cx = UNDEF;
        dx = UNDEF;
        es = UNDEF;
        di = di + 1;
    }
    return __insn("int 0x43", 3, __insn("int 0x43", 7, bx2, cx, dx, si, di, es, ds), UNDEF, UNDEF, si, di, UNDEF, ds);
}
