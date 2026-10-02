/* differs: 308 at +0, 142 bytes; 311 at +0, 142 bytes; 312 at +0, 142 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    char f_2;
};
extern void far far_fb45f(void);
extern int far far_fb548(void);
extern int far far_fb6af(void);
extern int near fn_fb903(void);

long far far_fb88f(void)
{
    int ax;
    int ax2;
    struct s1 near *di;
    int dx;
    int p2;
    int t1;
    int t2;

    ax = fn_fb903();
    dx = UNDEF;
    if (!CC("!=", UNDEF)) {
        ax2 = far_fb548();
        dx = UNDEF;
        p2 = __flags(UNDEF);
        _disable();
        di->f_0 = di->f_0 + 1;
        if (di->f_0 == -1) {
            di->f_2 = (char)ax2;
            goto L1;
        }
        if ((char)ax2 != di->f_2) {
            t1 = far_fb6af();
            dx = UNDEF;
            if (!CC("s", UNDEF)) {
                far_fb45f();
                dx = UNDEF;
                goto L1;
            }
            di->f_0 = di->f_0 - 1;
            ax = -11;
        } else {
            di->f_0 = di->f_0 - 1;
L1:
            ax = 0;
        }
        __insn("popf", p2);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
int near fn_fb903(void) { return 0; }
