/* differs: 308 at +3, 115 bytes; 311 at +3, 115 bytes; 312 at +3, 115 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int far fn_b2498(long arg_0, long arg_4)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int di;
    int ds;

    di = (int)arg_0;
    bx = (int)arg_4;
    ds = (int)(arg_4 >> 16);
    ax = *(int far *)MK_FP(ds, bx);
    *(int far *)MK_FP(ds, di) = *(int far *)MK_FP(ds, di) - ax;
    ax2 = *(int far *)MK_FP(ds, bx + 2);
    *(int far *)MK_FP(ds, di + 2) = (int)(*(long far *)MK_FP(ds, di) - ((long)ax2 << 16 | (unsigned)ax) >> 16);
    ax3 = *(int far *)MK_FP(ds, bx + 4);
    *(int far *)MK_FP(ds, di + 4) = (int)(*(long far *)MK_FP(ds, di + 2) - ((long)ax3 << 16 | (unsigned)ax2) >> 16);
    ax4 = *(int far *)MK_FP(ds, bx + 6);
    *(int far *)MK_FP(ds, di + 6) = (int)(*(long far *)MK_FP(ds, di + 4) - ((long)ax4 << 16 | (unsigned)ax3) >> 16);
    return ax4;
}
