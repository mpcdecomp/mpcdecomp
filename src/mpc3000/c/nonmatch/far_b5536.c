/* differs: 308 at +3, 134 bytes; 311 at +3, 135 bytes; 312 at +3, 135 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
int far far_b5536(long arg_0, long arg_4)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int di;
    int es;
    int es2;
    int es3;
    int si;
    int t1;
    int t2;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = *(int far *)MK_FP(es, bx + 2);
    si = *(int far *)MK_FP(es, bx);
    bx2 = (int)arg_4;
    es2 = (int)(arg_4 >> 16);
    di = (int)*(long far *)MK_FP(es2, bx2);
    es3 = (int)(*(long far *)MK_FP(es2, bx2) >> 16);
    t1 = __repne_scas1(MK_FP(es3, di), 0, -1);
    cx = ~t1;
    ax2 = 0;
    __repe_cmps1((int)((long)ax << 16 | (unsigned)si), MK_FP(es3, di + (-1 - t1) - cx), cx);
    if (!CC("==", UNDEF)) {
        ax2 = 0 - 0 - CC("<u", UNDEF) + 1;
    }
    return ax2;
}
