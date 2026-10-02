/* differs: 308 at +0, 79 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern int W_7464;
extern int W_7466;

int far far_e821c(void)
{
    int ax;
    int p4;

    if (W_7464 == 0) {
        p4 = __flags(0);
        _disable();
        W_7464 = *(int far *)MK_FP(0, 44);
        ax = *(int far *)MK_FP(0, 46);
        W_7466 = ax;
        *(int far *)MK_FP(0, 44) = 0x30f;
        *(int far *)MK_FP(0, 46) = 0xf0b9 /* SEG_E7F0 */;
        __insn("popf", p4);
    }
    return ax;
}
