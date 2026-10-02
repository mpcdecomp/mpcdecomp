/* differs: 308 at +5, 195 bytes; 311 at +5, 195 bytes; 312 at +5, 195 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
void far far_cdb31(long arg_0, int arg_4)
{
    int loc_4;
    int loc_2;
    int ax;
    int cx;
    int cx2;
    int di;
    int di2;
    int di3;
    int es;
    int es2;
    int t1;

    es = (int)(arg_0 >> 16);
    ax = arg_4 - (~__repne_scas1(MK_FP(es, (int)arg_0), 0, -1) - 1);
    if (ax > 0) {
        di = *(int *)((char *)&arg_0 + 0);
        t1 = __repne_scas1(MK_FP(es, di), 0, -1);
        cx = ~t1;
        di2 = di + (-1 - t1) - cx;
        di3 = di2 + (cx - __repne_scas1(MK_FP(es, di2), 0, cx));
        if (!CC("==", UNDEF)) {
            di3 = 1;
            es = 0;
        }
        loc_2 = es;
        loc_4 = di3 - 1;
        es2 = loc_2;
        cx2 = (unsigned int)ax >> 1;
        __stos2(MK_FP(es2, di3 - 1), 0x2020, cx2 * 2);
        __stos1(MK_FP(es2, di3 - 1 + cx2 * 2), 32, ax & 1);
        *(char far *)MK_FP(es2, loc_4 + ax) = (char)0;
    }
    return;
}
