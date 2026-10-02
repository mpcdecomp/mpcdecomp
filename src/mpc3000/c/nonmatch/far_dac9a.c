/* differs: 308 at +0, 120 bytes; 311 at +0, 120 bytes; 312 at +0, 120 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_dac9a(void)
{
    unsigned int ax;
    int ax2;
    int bx;
    int cx;
    int flags;
    int p8;
    unsigned int si;
    int si2;

    p8 = __flags(flags);
    ax = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx);
    _disable();
    si = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx + 2);
    if (si < ax) {
        *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx + 2) = si + 1;
        si2 = *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx + 4);
        if (si2 == 0) {
            si2 = ax;
        }
        *(int far *)MK_FP(0x96e6 /* SEG_A8EC */, bx + 4) = si2 - 1;
        *(char far *)MK_FP(0x96e6 /* SEG_A8EC */, bx + 8 + (si2 - 1)) = (char)cx;
        __insn("popf", p8);
        ax2 = 0;
    } else {
        __insn("popf", p8);
        ax2 = -1;
    }
    return ax2;
}
