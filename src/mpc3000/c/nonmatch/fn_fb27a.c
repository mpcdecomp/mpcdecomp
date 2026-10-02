/* differs: 308 at +0, 183 bytes; 311 at +0, 183 bytes; 312 at +0, 183 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[16];
    int f_10;
};
struct s2 {
    char pad_0[14];
    char f_e;
};
extern int far far_fb6af(void);
extern long far far_fb6de(void);

long far fn_fb27a(void)
{
    int ax;
    int ax2;
    int bp;
    int bp2;
    int bx;
    int near *bx2;
    int bx3;
    int near *cx;
    int dx;
    int dx2;
    int es;
    int flags;
    int flags2;
    int flags3;
    int p10;
    struct s2 near *p8;
    struct s1 near *si;
    long t1;

    *(int *)((char near *)si + 10) = 0;
    *(int *)((char near *)si + 12) = 0;
    *(int *)((char near *)si + 24) = 0;
    *(int *)((char near *)si + 26) = 0;
    *(int *)((char near *)si + 28) = 0;
    *(int *)((char near *)si + 30) = 0;
    *(char *)((char near *)si + 14) = (char)127;
    if ((*(int *)((char near *)si + 2) & 2) != 0) {
        p8 = (struct s2 near *)si;
        ax = SEG_DATA;
        es = ax;
        dx = 4;
        for (;;) {
            bx = si->f_10;
            si = (struct s1 near *)((char near *)si + 2);
            if (bx != 0) {
                p10 = 0xfb00;
                t1 = far_fb6de();
                cx = (int near *)UNDEF;
                es = UNDEF;
                ax = (int)t1;
                dx = (int)(t1 >> 16);
                if (!CC("ns", UNDEF)) {
L1:
                    dx = dx - 1;
                    if (dx == 0) {
                        break;
                    }
                    continue;
                }
                goto L2;
            }
            goto L1;
        }
    }
    goto L3;
L2:
    p8->f_e = (char)*cx;
    dx2 = 6;
    bx2 = cx + 2;
    flags = (int)(unsigned)bx2;
    do {
        *(int far *)MK_FP(SEG_STACK, bp) = *bx2;
        bx3 = (int)(unsigned)(int near *)((char near *)bx2 + 1);
        flags2 = bx3;
        bx2 = (int near *)(bx3 + 1);
        bp2 = bp + 1;
        flags3 = bp2;
        bp = bp2 + 1;
        dx2 = dx2 - 1;
        flags = dx2;
    } while (CC("!=", flags));
    ax2 = far_fb6af();
    dx = UNDEF;
L3:
    _enable();
    return ((long)dx << 16 | (unsigned)SEG_STACK);
}
int far far_fb6af(void) { return 0; }
long far far_fb6de(void) { return 0; }
