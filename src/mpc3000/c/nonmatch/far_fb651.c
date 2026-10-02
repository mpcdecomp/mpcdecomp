/* differs: 308 at +0, 87 bytes; 311 at +0, 87 bytes; 312 at +0, 87 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_fb651(void)
{
    unsigned int ax;
    int ax2;
    unsigned int ax3;
    int bx;
    int cx;
    int es;
    int flags;

    ax = ax2 - 1 & 3;
    ax3 = ax >> 1 | ax << 15;
    _disable();
    *(int far *)MK_FP(es, bx) = ax3 >> 1 | ax3 << 15 | cx;
    *(int far *)MK_FP(es, bx + 2) = 0;
    *(int far *)MK_FP(es, bx + 4) = 0;
    *(int far *)MK_FP(es, bx + 6) = 0;
    __insn("popf", __flags(flags));
    return;
}
