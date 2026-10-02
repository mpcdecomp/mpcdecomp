/* differs: 308 at +5, 544 bytes; 311 at +5, 544 bytes; 312 at +5, 544 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern int W_9563;
extern long far far_fa2a0(long);

long far far_b2b84(long arg_0, int arg_2)
{
    int loc_e;
    long loc_c;
    char loc_b;
    int loc_a;
    unsigned int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int cx;
    int cx2;
    int di;
    int di2;
    int di3;
    int di4;
    int di5;
    int di6;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    long t1;
    int t2;
    long t3;
    int t4;
    long t5;

    loc_b = (char)1;
    *(char *)((char *)&loc_c + 0) = (char)0;
    t1 = far_fa2a0(arg_0);
    loc_6 = (int)(t1 >> 16);
    loc_8 = (int)t1;
    ax = W_9563;
    loc_e = ax + 1;
    dx = -(ax + 1 < 0);
    flags = dx - loc_6;
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)(ax + 1) > loc_8)) {
        loc_a = loc_e;
        return loc_c;
    }
    flags2 = loc_6;
    if (!CC("<", flags2) && (CC(">", flags2) || loc_8 > 0x3e7)) {
        loc_a = 0x3e7;
        return loc_c;
    }
    loc_a = loc_8;
    di = (int)arg_0;
    es = (int)(arg_0 >> 16);
    t2 = __repne_scas1(MK_FP(es, di), 0, -1);
    cx = ~t2;
    di2 = di + (-1 - t2) - cx;
    di3 = di2 + (cx - __repne_scas1(MK_FP(es, di2), 46, cx));
    if (!CC("==", UNDEF)) {
        di3 = 1;
        es = 0;
    }
    ax2 = es;
    loc_2 = ax2;
    loc_4 = di3 - 1;
    if ((di3 - 1 | ax2) != 0) {
        dx2 = loc_4;
        arg_2 = ax2;
        *(int *)((char *)&arg_0 + 0) = dx2 + 1;
        t3 = far_fa2a0(((long)ax2 << 16 | (unsigned)(dx2 + 1)));
        loc_6 = (int)(t3 >> 16);
        loc_8 = (int)t3;
        flags3 = loc_6;
        if (!CC(">", flags3) && (CC("<", flags3) || loc_8 == 0)) {
            loc_6 = 0;
            loc_8 = 1;
        }
        flags4 = loc_6;
        if (!CC("<", flags4) && (CC(">", flags4) || loc_8 > 32)) {
            loc_6 = 0;
            loc_8 = 32;
        }
        loc_b = *(char *)((char *)&loc_8 + 0);
        di4 = (int)arg_0;
        es2 = (int)(arg_0 >> 16);
        t4 = __repne_scas1(MK_FP(es2, di4), 0, -1);
        cx2 = ~t4;
        di5 = di4 + (-1 - t4) - cx2;
        di6 = di5 + (cx2 - __repne_scas1(MK_FP(es2, di5), 46, cx2));
        if (!CC("==", UNDEF)) {
            di6 = 1;
            es2 = 0;
        }
        ax3 = es2;
        loc_2 = ax3;
        loc_4 = di6 - 1;
        if ((di6 - 1 | ax3) != 0) {
            dx3 = loc_4;
            arg_2 = ax3;
            *(int *)((char *)&arg_0 + 0) = dx3 + 1;
            t5 = far_fa2a0(((long)ax3 << 16 | (unsigned)(dx3 + 1)));
            loc_6 = (int)(t5 >> 16);
            loc_8 = (int)t5;
            flags5 = loc_6;
            if (!CC("<", flags5) && (CC(">", flags5) || loc_8 > 95)) {
                loc_6 = 0;
                loc_8 = 95;
            }
            *(char *)((char *)&loc_c + 0) = *(char *)((char *)&loc_8 + 0);
        }
    }
    return loc_c;
}
