/* differs: 308 at +4, 286 bytes; 311 at +4, 286 bytes; 312 at +4, 286 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
void far far_daba8(long arg_0, long arg_4)
{
    char loc_c[12];
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int di;
    int di2;
    int di3;
    int di4;
    int di5;
    int ds;
    int ds2;
    int dx;
    int es;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int flags7;
    int flags8;
    int flags9;
    int si;
    int si2;
    int t1;

    cx = 6;
    di = 0;
    do {
        *(int *)((char *)&loc_c + 0 + di) = 0;
        di = di + 2;
        cx = cx - 1;
    } while (cx != 0);
    dx = 48;
    flags = 0;
    for (;;) {
        bx = (int)arg_0;
        ds = (int)(arg_0 >> 16);
        *(int far *)MK_FP(ds, bx) = *(int far *)MK_FP(ds, bx) + 0 + CC("<u", flags);
        dx = dx - 1;
        if (dx < 0) {
            break;
        }
        cx2 = 6;
        flags2 = 0;
        do {
            *(int far *)MK_FP(ds, bx) = *(int far *)MK_FP(ds, bx) << 1 | CC("<u", flags2);
            flags3 = *(int far *)MK_FP(ds, bx) << 1 | CC("<u", flags2);
            bx2 = bx + 1;
            flags4 = bx2;
            bx = bx2 + 1;
            flags2 = bx;
            cx2 = cx2 - 1;
        } while (cx2 != 0);
        bx3 = (int)arg_0;
        ds2 = (int)(arg_0 >> 16);
        si = (int)arg_4;
        es = (int)(arg_4 >> 16);
        di2 = 0;
        cx3 = 3;
        flags5 = 0;
        do {
            ax = *(int far *)MK_FP(ds2, bx3 + 6 + di2);
            ax2 = ax - *(int far *)MK_FP(es, si) - CC("<u", flags5);
            flags6 = ax2;
            *(int *)((char *)&loc_c + 0 + di2) = ax2;
            si2 = si + 1;
            flags7 = si2;
            si = si2 + 1;
            di3 = di2 + 1;
            flags8 = di3;
            di2 = di3 + 1;
            flags5 = di2;
            cx3 = cx3 - 1;
        } while (cx3 != 0);
        t1 = __insn("cmc ");
        flags = UNDEF;
        if (CC(">=u", flags)) {
            continue;
        }
        di4 = 0;
        cx4 = 3;
        do {
            *(int far *)MK_FP(ds2, bx3 + 6 + di4) = *(int *)((char *)&loc_c + 0 + di4);
            di5 = di4 + 1;
            flags9 = di5;
            di4 = di5 + 1;
            flags = di4;
            cx4 = cx4 - 1;
        } while (cx4 != 0);
    }
    return;
}
