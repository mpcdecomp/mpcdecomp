/* differs: 308 absent; 311 at +3, 206 bytes; 312 at +3, 206 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_D4BE;
extern long far far_fb6af(void);
extern long far far_fb71b(void);

void far far_d7a09(int far *arg_0)
{
    int ax;
    int bx;
    int cx;
    int dx;
    int es;
    int flags;
    int p6;
    long t1;
    long t2;

    ax = SEG_DATA;
    es = ax;
    bx = 0x12c6;
    dx = 1;
    for (;;) {
        if (*(int far *)MK_FP(es, bx + 2) == 0) {
            cx = ((char)(cx >> 8) << 8 | (unsigned char)B_D4BE);
            if ((char)cx == 0) {
                continue;
            }
            break;
        }
        t1 = far_fb71b();
        bx = UNDEF;
        cx = UNDEF;
        es = UNDEF;
        ax = (int)t1;
        dx = (int)(t1 >> 16);
        flags = UNDEF;
        if (CC("s", flags)) {
            continue;
        }
        goto L1;
    }
    B_D4BE = (char)0;
    goto L2;
L1:
    if (!CC("!=", flags)) {
        for (;;) {
            p6 = __flags(flags);
            _disable();
            t2 = far_fb71b();
            if ((char)UNDEF != (char)(UNDEF >> 8)) {
                break;
            }
            __insn("popf", p6);
            dx = (int)(t2 >> 16) + 1;
            flags = (int)t2;
            if (CC("==", flags)) {
                continue;
            }
            goto L3;
        }
        dx = (int)(far_fb6af() >> 16);
        __insn("popf", p6);
    }
    goto L2;
    goto L2;
L3:
L2:
    *arg_0 = dx;
    return;
}
