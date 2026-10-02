/* differs: 308 at +0, 232 bytes; 311 at +0, 232 bytes; 312 at +0, 231 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_A5C2;
extern char B_D60A;

void far far_dd8ff(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    int t1;

    ax = (unsigned char)(char)ax2;
    if ((B_A5C2 & 21) != 0) {
        ax = (1 << 8 | (unsigned char)(char)ax);
    }
    ax3 = (unsigned char)(char)__insn("int 0x46", ((char)(ax >> 8) << 8 | (unsigned char)8), bx, cx, dx, si, di, es, SEG_DATA);
    if ((B_A5C2 & 6) != 0) {
        ax3 = (1 << 8 | (unsigned char)(char)ax3);
    }
    t1 = __insn("int 0x46", ((char)(ax3 >> 8) << 8 | (unsigned char)6), UNDEF, UNDEF, UNDEF, si, di, UNDEF, SEG_DATA);
    ax4 = (unsigned char)(char)__insn("int 0x46", ((char)(t1 >> 8) << 8 | (unsigned char)6), UNDEF, UNDEF, UNDEF, si, di, UNDEF, SEG_DATA);
    if ((B_A5C2 & 24) != 0) {
        ax4 = (1 << 8 | (unsigned char)(char)ax4);
    }
    __insn("int 0x46", ((char)(ax4 >> 8) << 8 | (unsigned char)7), UNDEF, UNDEF, UNDEF, si, di, UNDEF, SEG_DATA);
    if ((B_A5C2 & 63) == 0 && B_D60A != 0) {
        if (B_D60A >= 16) {
            B_D60A = (char)16;
        } else {
            B_D60A = (char)14;
        }
    }
    return;
}
