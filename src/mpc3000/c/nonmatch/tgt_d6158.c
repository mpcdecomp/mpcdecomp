/* differs: 308 at +0, 117 bytes; 311 at +0, 118 bytes; 312 at +0, 118 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_713F;
extern char B_7142;
extern char B_D4B5;
extern char B_D4BF;
extern int W_713C;
extern int far far_dab06(int);
extern long near tgt_d6186();
extern long near tgt_d62e2();

long near tgt_d6158(void)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int dx;

    if ((unsigned char)(char)ax < 16) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char *)(0x53 + (unsigned char)(char)ax));
        B_7142 = (char)ax2;
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 + B_D4B5));
        B_D4BF = (char)ax3;
        ax = far_dab06((unsigned char)(char)ax3);
        dx = UNDEF;
        B_713F = (char)ax;
        bx = (int)(unsigned)tgt_d6186;
    } else {
        B_713F = (char)ax;
        bx = (int)(unsigned)tgt_d62e2;
    }
    W_713C = bx;
    return ((long)dx << 16 | (unsigned)ax);
}
long near tgt_d6186(void) { return 0; }
long near tgt_d62e2(void) { return 0; }
