/* differs: 308 at +3, 127 bytes; 311 at +3, 127 bytes; 312 at +3, 127 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int far far_da76f(long arg_0, int arg_4)
{
    int ax;
    int bx;
    int bx2;
    int cx;
    int di;
    int ds;
    int es;
    int si;

    si = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    di = 0;
    cx = arg_4;
    ax = -0xc00;
    es = ax;
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)(char)cx);
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, si));
        *(char far *)MK_FP(es, di) = (char)ax;
        bx = ((char)(bx >> 8) << 8 | (unsigned char)((char)bx + (char)ax));
        di = di + 2;
        si = si + 1;
        cx = cx - 1;
    } while (cx != 0);
    *(char far *)MK_FP(es, di) = (char)bx;
    return ax;
}
