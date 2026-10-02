/* differs: 308 at +0, 93 bytes; 311 at +0, 93 bytes; 312 at +0, 93 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
    int f_4;
};

int far far_dac6a(void)
{
    unsigned int ax;
    int ax2;
    struct s1 near *bx;
    int cx;
    int flags;
    int p6;
    unsigned int si;
    char near *si2;

    p6 = __flags(flags);
    ax = bx->f_0;
    _disable();
    si = bx->f_2;
    if (si < ax) {
        bx->f_2 = si + 1;
        si2 = (char near *)bx->f_4;
        if (si2 == 0) {
            si2 = (char near *)ax;
        }
        bx->f_4 = (int)(unsigned)(si2 - 1);
        si2[(unsigned int)(unsigned)bx + 7] = (char)cx;
        __insn("popf", p6);
        ax2 = 0;
    } else {
        __insn("popf", p6);
        ax2 = -1;
    }
    return ax2;
}
