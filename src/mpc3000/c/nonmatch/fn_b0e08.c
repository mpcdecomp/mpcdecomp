/* differs: 308 at +5, 119 bytes; 311 at +5, 119 bytes; 312 at +5, 119 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern char B_7B54;
extern long far far_fa2a0(long);

void far fn_b0e08(long arg_0, int arg_2)
{
    char far *loc_6;
    char loc_4[3];
    char loc_1;
    int ax;
    int ax2;
    int cx;
    int di;
    int di2;
    int di3;
    int es;
    int si;
    int t1;

    if ((B_7B54 & 4) != 0) {
        si = (int)far_fa2a0(arg_0) * 10;
        di = (int)arg_0;
        es = (int)(arg_0 >> 16);
        t1 = __repne_scas1(MK_FP(es, di), 0, -1);
        cx = ~t1;
        di2 = di + (-1 - t1) - cx;
        di3 = di2 + (cx - __repne_scas1(MK_FP(es, di2), 46, cx));
        if (!CC("==", UNDEF)) {
            di3 = 1;
            es = 0;
        }
        ax = es;
        *(int *)((char *)&loc_4 + 0) = ax;
        *(int *)((char *)&loc_6 + 0) = di3 - 1;
        if ((di3 - 1 | ax) != 0) {
            *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 1;
            ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*loc_6);
            loc_1 = (char)ax2;
        }
    }
    return;
}
