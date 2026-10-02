/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern unsigned char TBL_f83d8[];
extern int near fn_f8ee3(void);

int far pascal isr_f8364(void)
{
    unsigned int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int flags;
    int si;

    _enable();
    if (ax < 16) {
        if (ax == 0 || ax == 11 || (ax == 13 || ax == 15)) {
            goto L1;
        }
        ax3 = (*(char far *)MK_FP(64, 0x1a) << 8 | (unsigned char)(char)ax);
        flags = (char)(ax3 >> 8) - *(char far *)MK_FP(64, 0x1b);
        *(char far *)MK_FP(64, 0x1b) = (char)(ax3 >> 8);
        if (CC("!=", flags)) {
            goto L2;
        }
        ax4 = __insn("int 0x40", (6 << 8 | (unsigned char)(char)ax3), bx, cx, ((char)(dx >> 8) << 8 | (unsigned char)0), ax, di, SEG_DATA, 64);
        if (CC(">=u", UNDEF)) {
            goto L1;
        }
        if ((char)(ax4 >> 8) != 6) {
            goto L3;
        }
L2:
        ax4 = fn_f8ee3();
        if (CC(">=u", UNDEF)) {
L1:
            ax2 = (int)(*(long (*)())*(int far *)MK_FP(0xf800, (unsigned int)(unsigned)(TBL_f83d8 + (ax << 1))))(MK_FP(es, si), SEG_DATA);
        } else {
L3:
            ax2 = (-1 << 8 | (unsigned char)(char)(ax4 >> 8));
            *(char far *)MK_FP(64, 0x1b) = (char)-1;
        }
    } else {
        ax2 = -0x900;
    }
    return ax2;
}
int near fn_f8ee3(void) { return 0; }
