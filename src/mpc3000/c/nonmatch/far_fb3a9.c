/* differs: 308 at +0, 305 bytes; 311 at +0, 305 bytes; 312 at +0, 305 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[12];
    char f_c;
    char pad_d[3];
    char f_10;
    char f_11;
};
struct s2 {
    int f_0;
    char pad_2[6];
    int f_8;
};
extern int far far_fb6af(void);
extern long far far_fb6de(void);
extern int far fn_fb1c5(void);
extern int near fn_fb52d(void);
int far fn_fb1c5(void) { return 0; }

int far far_fb3a9(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bp;
    int bp2;
    int bp3;
    char near *bx;
    int near *bx2;
    int bx3;
    int cx;
    int cx2;
    int cx3;
    struct s1 near *di;
    int dx;
    int es;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int p18;
    struct s2 near *si;
    int t1;

    cx = UNDEF;
    ax = fn_fb52d();
    flags = UNDEF;
    if (!CC("s", flags)) {
        bp = (int)(unsigned)si;
        ax2 = *(int *)((char near *)si + 16 + (cx & 3) * 2);
        si = (struct s2 near *)bp;
        if (ax2 != 0) {
            cx = UNDEF;
            dx = (int)(far_fb6de() >> 16);
            flags = UNDEF;
            ax = -2;
L1:
            if (!CC("s", flags)) {
                bx = (char near *)cx;
                ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)(cx2 >> 8) & -128));
                ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 | di->f_c));
                if (di->f_10 <= 0) {
                    ax4 = ((char)(ax4 >> 8) << 8 | (unsigned char)127);
                }
                *bx = (char)ax4;
                bp2 = (int)*(long far *)MK_FP(SEG_STACK, bp + 10);
                es = (int)(*(long far *)MK_FP(SEG_STACK, bp2 + 10) >> 16);
                cx3 = 6;
                bx2 = (int near *)(bx + 4);
                flags2 = (int)(unsigned)bx2;
                do {
                    *bx2 = *(int far *)MK_FP(es, bp2);
                    bx3 = (int)(unsigned)(int near *)((char near *)bx2 + 1);
                    flags3 = bx3;
                    bx2 = (int near *)(bx3 + 1);
                    bp3 = bp2 + 1;
                    flags4 = bp3;
                    bp2 = bp3 + 1;
                    flags2 = bp2;
                    cx3 = cx3 - 1;
                } while (cx3 != 0);
                p18 = __flags(bx2 - 8);
                _disable();
                ax5 = far_fb6af();
                if (!CC("ns", UNDEF)) {
                    t1 = far_fb6af();
                    __insn("popf", p18);
                    ax = -4;
                    goto L2;
                }
                si->f_8 = si->f_8 + 1;
                si->f_0 = si->f_0 | 1;
                if ((unsigned char)(char)UNDEF < (unsigned char)di->f_11) {
                    di->f_11 = (char)UNDEF;
                }
                if (UNDEF < 0) {
                    ax6 = (int)fn_fb1c5();
                }
                __insn("popf", p18);
                ax = 0;
            } else {
                goto L2;
            }
        } else {
            ax = -3;
L2:
        }
    } else {
        goto L1;
    }
    return ax;
}
int far far_fb6af(void) { return 0; }
long far far_fb6de(void) { return 0; }
int near fn_fb52d(void) { return 0; }
