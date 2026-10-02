/* differs: 308 at +0, 95 bytes; 311 at +0, 95 bytes; 312 at +0, 95 bytes */
#define UNDEF 0
struct s1 {
    int f_0;
    char f_2;
};
extern void far far_fb380(void);
extern int far far_fb4a2(int);
extern int far far_fb548(void);
extern long far far_fb6de(void);
extern int near fn_fb903(void);

long far far_fb8cd(void)
{
    int ax;
    int ax2;
    struct s1 near *di;
    int dx;
    int flags;
    int p2;
    long t1;
    int t2;
    int t3;

L1:
    ax = 0;
    __insn("popf", p2);
L2:
L3:
    return ((long)dx << 16 | (unsigned)ax);
    ax = fn_fb903();
    dx = UNDEF;
    if (CC("!=", UNDEF)) {
        goto L3;
    }
    ax2 = far_fb548();
    dx = UNDEF;
    flags = (char)ax2 - di->f_2;
    if (CC("==", flags)) {
        goto L4;
    }
    ax = -12;
    goto L2;
L4:
    p2 = __flags(flags);
    _disable();
    di->f_2 = (char)-1;
    di->f_0 = di->f_0 - 1;
    if (di->f_0 - 1 < 0) {
        goto L1;
    }
    t1 = far_fb6de();
    di->f_2 = (char)UNDEF;
    t2 = far_fb4a2((int)(t1 >> 16));
    far_fb380();
    dx = UNDEF;
    goto L1;
}
int near fn_fb903(void) { return 0; }
