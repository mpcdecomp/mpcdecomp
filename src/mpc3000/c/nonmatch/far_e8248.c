/* differs: 308 at +0, 76 bytes; 311 at +0, 76 bytes; 312 at +0, 76 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern int W_7464;
extern int W_7466;
extern long near fn_e7fcd(void);
long near fn_e7fcd(void) { return 0; }

int far far_e8248(void)
{
    int ax;
    long t1;

    if (W_7464 != 0) {
        t1 = fn_e7fcd();
        _disable();
        *(int far *)MK_FP(0, 44) = W_7464;
        ax = W_7466;
        *(int far *)MK_FP(0, 46) = ax;
        __insn("popf", __flags(0));
        W_7464 = 0;
        W_7466 = 0;
    }
    return ax;
}
