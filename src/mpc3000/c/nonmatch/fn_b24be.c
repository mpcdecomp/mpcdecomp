/* differs: 308 at +0, 184 bytes; 311 at +0, 186 bytes; 312 at +0, 186 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern unsigned char TBL_E223;
extern unsigned char W_E21F;
extern unsigned char W_E221;
extern long far far_cdd52(void);
extern long far far_fb88f(void);
extern long far far_fb8cd(void);

long far fn_b24be(void)
{
    int ax;
    int ax2;
    unsigned int ax3;
    int bx;
    unsigned int cx;
    int di;
    int dx;
    int es;
    int p10;
    int p12;
    int p14;
    int p2;
    int p4;
    int p6;
    int p8;
    int si;
    long t1;

    es = UNDEF;
    ax = (int)far_fb88f();
    dx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_E221);
    cx = -1;
    bx = -2;
    for (;;) {
        bx = bx + 2;
        ax2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_E223 + bx);
        if (ax2 == 0) {
            continue;
        }
        if (ax2 == -1) {
            break;
        }
        ax3 = ax2 - dx;
        if (ax2 > dx) {
            *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_E223 + bx) = ax3;
            if (ax3 >= cx) {
                continue;
            }
            cx = ax3;
            continue;
        }
        *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_E223 + bx) = 0;
        p2 = ax3;
        p4 = bx;
        p6 = cx;
        p8 = dx;
        p10 = si;
        p12 = di;
        p14 = es;
        t1 = far_cdd52();
        es = p14;
        di = p12;
        si = p10;
        dx = p8;
        cx = p6;
        bx = p4;
    }
    if (cx == -1) {
        cx = 0;
    }
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_E21F) = cx;
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_E221) = cx;
    return far_fb8cd();
}
