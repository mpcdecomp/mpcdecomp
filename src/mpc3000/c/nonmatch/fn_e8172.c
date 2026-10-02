/* differs: 308 at +0, 264 bytes; 311 at +0, 264 bytes; 312 at +0, 263 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
    char f_3;
    char f_4;
    char f_5;
};
extern unsigned char B_7412;
extern unsigned char B_7414;
extern char B_7438;
extern char B_7439;
extern unsigned char B_744A;
extern int W_7384;
extern unsigned int W_7410;
extern int near fn_e80bc(void);
extern int near fn_e80f2(void);
int near fn_e80bc(void) { return 0; }
int near fn_e80f2(void) { return 0; }

int near fn_e8172(void)
{
    unsigned int ax;
    unsigned int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    struct s1 near *bx;

    ax = (unsigned)((unsigned long)(unsigned int)ax2 * 0x100L / (unsigned long)(unsigned int)W_7410);
    ax3 = ((char)(ax % B_7412) << 8 | (unsigned char)(char)(ax / B_7412));
    bx->f_3 = (char)ax3;
    B_7439 = (char)ax3;
    ax4 = ((char)((unsigned int)(char)(ax3 >> 8) % B_7414) << 8 | (unsigned char)(char)((unsigned int)(char)(ax3 >> 8) / B_7414));
    ax5 = ((char)(ax4 >> 8) + 1 << 8 | (unsigned char)(char)ax4);
    bx->f_5 = (char)(ax5 >> 8);
    bx->f_4 = (char)ax5;
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 << 2));
    bx->f_2 = (char)ax6;
    B_7438 = (char)ax6;
    outp(162, (char)(inp(162) & -2));
    outp(-0x3fef, (char)(inp(-0x3fef) & -9));
    fn_e80bc();
    while ((W_7384 & -0x8000) == 0) {
        B_744A = (unsigned char)((unsigned int)B_744A >> 1);
        if (B_744A & 1) {
            goto L1;
        }
    }
    return 196;
L1:
    ax8 = fn_e80bc();
    if (!CC("<u", UNDEF)) {
        ax8 = fn_e80f2();
    }
    return ax8;
}
