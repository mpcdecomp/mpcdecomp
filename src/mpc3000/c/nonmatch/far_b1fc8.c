/* differs: 308 at +3, 228 bytes; 311 at +3, 228 bytes; 312 at +3, 228 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int far far_b1fc8(long arg_0, long arg_4)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int di;
    int ds;
    int es;
    int flags;
    int flags2;

    di = (int)arg_0;
    es = (int)(arg_0 >> 16);
    bx = (int)arg_4;
    ds = (int)(arg_4 >> 16);
    ax = *(int far *)MK_FP(ds, bx);
    *(int far *)MK_FP(es, di) = *(int far *)MK_FP(es, di) + ax;
    flags = *(int far *)MK_FP(es, di) + ax;
    ax2 = *(int far *)MK_FP(ds, bx + 2);
    *(int far *)MK_FP(es, di + 2) = *(int far *)MK_FP(es, di + 2) + ax2 + CC("<u", flags);
    flags2 = *(int far *)MK_FP(es, di + 2) + ax2 + CC("<u", flags);
    ax3 = *(int far *)MK_FP(ds, bx + 4);
    *(int far *)MK_FP(es, di + 4) = *(int far *)MK_FP(es, di + 4) + ax3 + CC("<u", flags2);
    ax4 = *(int far *)MK_FP(ds, bx + 6);
    *(int far *)MK_FP(es, di + 6) = *(int far *)MK_FP(es, di + 6) + ax4 + ((unsigned int)(*(int far *)MK_FP(es, di + 4) + ax3 + CC("<u", flags2)) < (unsigned int)*(int far *)MK_FP(es, di + 4));
    return ax4;
}
