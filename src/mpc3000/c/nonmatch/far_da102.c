/* differs: 308 at +3, 579 bytes; 311 at +3, 576 bytes; 312 at +3, 575 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_71A2;
extern int W_71A4;
extern int W_71A6;
extern void far far_c46ab(void);
extern void near fn_da0ef(void);
extern long near fn_da207(void);
extern long near fn_da222(void);
void near fn_da0ef(void) { }

long far far_da102(int arg_0, int arg_2)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int dx;
    long t1;
    int t2;
    int t3;
    long t4;
    int t5;
    int t6;
    char t7;

    outpw(104, 0);
    t1 = fn_da207();
    outp(252, (char)(inp(252) & -49));
    if (arg_0 == 0) {
        goto L1;
    }
    if ((inp(128) & 96) == 64) {
        goto L2;
    }
    outp(128, (char)48);
    fn_da0ef();
    outp(128, (char)112);
    fn_da0ef();
    dx = UNDEF;
    if ((inp(132) & 64) == 0) {
        goto L2;
    }
    ax = 1;
    goto L3;
L2:
    outp(-0x3fff, (char)2);
    outpw(-0x3ffc, W_71A2);
    outp(-0x3ffa, (char)((char)W_71A4 | 48));
    outpw(-0x3ffe, W_71A6);
    outp(-0x3ff6, (char)85);
    t4 = fn_da222();
    ax2 = ((char)((int)t4 >> 8) << 8 | (unsigned char)inp(128));
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 & -7));
    if (arg_2 != 0) {
        goto L4;
    }
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 | 2));
    goto L5;
L4:
    if (arg_2 != 1) {
        goto L6;
    }
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 | 4));
    goto L5;
L6:
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 | 6));
L5:
    outp(128, (char)ax4);
    outp(128, (char)((char)ax4 & -97 | 64));
    far_c46ab();
    dx = UNDEF;
    ax = 0;
    goto L3;
L1:
    outp(252, (char)(inp(252) & -49 | -128));
    outp(250, (char)(inp(250) & -17));
    outp(252, (char)(inp(252) & 79));
    outp(128, (char)0);
    fn_da0ef();
    ax5 = ((char)(UNDEF >> 8) << 8 | (unsigned char)(inp(250) & -17));
    outp(250, (char)ax5);
    t7 = inp(252);
    if (arg_2 != 0) {
        goto L7;
    }
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)(t7 | 16));
    goto L8;
L7:
    if (arg_2 != 1) {
        goto L9;
    }
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)(t7 | 32));
    goto L8;
L9:
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)(t7 | 48));
L8:
    outp(252, (char)((char)ax6 | 64));
    outp(-0x3fff, (char)2);
    outpw(-0x3ffc, W_71A2);
    outp(-0x3ffa, (char)((char)W_71A4 | 48));
    outpw(-0x3ffe, W_71A6);
    outp(-0x3ff6, (char)85);
    dx = (int)(fn_da222() >> 16);
    ax = 0;
L3:
    return ((long)dx << 16 | (unsigned)ax);
}
long near fn_da207(void) { return 0; }
long near fn_da222(void) { return 0; }
