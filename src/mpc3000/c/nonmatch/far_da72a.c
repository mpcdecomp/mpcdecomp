/* differs: 308 at +3, 219 bytes; 311 at +3, 219 bytes; 312 at +3, 219 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_da72a(long arg_0, int arg_4)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int cx;
    int cx2;
    int di;
    int ds;
    int es;
    int flags;
    int flags2;
    int si;
    int si2;
    int si3;

    ax = -0xc00;
    es = ax;
    si = 0;
    cx = arg_4;
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)(char)cx);
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
        bx = ((char)(bx >> 8) << 8 | (unsigned char)((char)bx + (char)ax));
        si = si + 2;
        cx = cx - 1;
    } while (cx != 0);
    ax2 = 1;
    bx3 = (*(char far *)MK_FP(es, si) << 8 | (unsigned char)(char)bx);
    flags = (char)(bx3 >> 8) - (char)bx3;
    if (!CC("!=", flags)) {
        si2 = 0;
        di = (int)arg_0;
        ds = (int)(arg_0 >> 16);
        cx2 = arg_4;
        do {
            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si2));
            *(char far *)MK_FP(ds, di) = (char)ax2;
            di = di + 1;
            si3 = si2 + 1;
            flags2 = si3;
            si2 = si3 + 1;
            cx2 = cx2 - 1;
            flags = cx2;
        } while (CC("!=", flags));
    }
    return;
}
