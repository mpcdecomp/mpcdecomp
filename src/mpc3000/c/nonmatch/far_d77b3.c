/* differs: 308 at +0, 59 bytes; 311 at +0, 60 bytes; 312 at +0, 60 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_7178;
extern int W_7174;
extern int W_7176;

void far far_d77b3(void)
{
    int ax;

    _disable();
    *(int far *)MK_FP(0, 0x24) = W_7174;
    *(int far *)MK_FP(0, 0x26) = W_7176;
    __insn("popf", __flags(0));
    outp(-0x3ff0, (char)0);
    outp(-0x3fef, B_7178);
    return;
}
