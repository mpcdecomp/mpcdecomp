/* differs: 308 at +0, 812 bytes; 311 at +0, 803 bytes; 312 at +0, 804 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_713F;
extern char B_7143;
extern char B_7B5D;
extern char B_7FE3;
extern char B_955C;
extern char B_A571;
extern char B_A5C1;
extern char B_A5C4;
extern char B_A5C6;
extern char B_A5C7;
extern char B_A5C8;
extern char B_D4AA;
extern char B_D4AC;
extern char B_D4BC;
extern unsigned char TBL_d6056[];
extern unsigned char TBL_d605f[];
extern int W_713C;
extern int W_945C;
extern int W_D4B2;
extern int W_D5E3;
extern int far L_e5c00(void);
extern long far L_e5d36(void);
extern int far far_dac6a(void);
extern long far far_fb38c(void);
extern int far far_fb4a2(void);
extern void near tgt_d612d();
void near tgt_d612d(void) { }

long near tgt_d62e2(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int di;
    int dx;
    int es;
    int p2;
    int p22;
    int si;
    int t1;
    long t2;
    int t3;
    int t4;
    long t5;

    B_A5C8 = (char)0;
    B_A5C7 = (char)0;
    B_A571 = (char)0;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)B_713F);
    if ((char)ax2 != 0) {
        goto L1;
    }
    goto L2;
L1:
    B_7143 = (char)1;
    ax4 = (1 << 8 | (unsigned char)((char)ax & 127));
    ax3 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 - 64));
    if ((unsigned char)(char)ax4 < 64) {
        goto L3;
    }
    cx2 = ((char)ax3 << 8 | (unsigned char)(char)cx3);
    ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char *)(0x4 + (unsigned char)(char)ax3));
    if ((char)ax3 == 0) {
        goto L3;
    }
    if (B_7B5D == 0) {
        goto L4;
    }
    goto L5;
L4:
    if ((char)ax3 != 84) {
        goto L6;
    }
    W_D5E3 = W_D4B2;
    goto L5;
L6:
    if ((char)ax3 != 97) {
        goto L7;
    }
    B_D4AC = (char)(B_D4AC ^ 1);
    p2 = ax3;
    ax5 = (unsigned char)(char)ax3;
    if ((B_D4AC ^ 1) == 0) {
        goto L8;
    }
    ax5 = (1 << 8 | (unsigned char)(char)ax5);
L8:
    t3 = __insn("int 0x46", ((char)(ax5 >> 8) << 8 | (unsigned char)15), 4, cx2, dx, si, di, es, SEG_DATA);
    dx = UNDEF;
    ax3 = p2;
    goto L9;
L7:
    if ((char)ax3 != 99) {
        goto L10;
    }
    B_D4AA = (char)(B_D4AA ^ 1);
    p22 = ax3;
    ax6 = (unsigned char)(char)ax3;
    if ((B_D4AA ^ 1) == 0) {
        goto L11;
    }
    ax6 = (1 << 8 | (unsigned char)(char)ax6);
L11:
    t4 = __insn("int 0x46", ((char)(ax6 >> 8) << 8 | (unsigned char)13), 4, cx2, dx, si, di, es, SEG_DATA);
    dx = UNDEF;
    ax3 = p22;
L3:
    goto L9;
L10:
    if ((char)ax3 != 82) {
        goto L12;
    }
    if (B_A5C1 == 0) {
        goto L13;
    }
    if (B_7FE3 == 0) {
        goto L13;
    }
    B_A5C8 = (char)1;
    B_A571 = (char)1;
    B_955C = (char)(B_955C | 64);
    goto L5;
L12:
    if ((char)ax3 != 69) {
        goto L14;
    }
    if (B_A5C1 == 0) {
        goto L13;
    }
    B_A5C7 = (char)1;
    B_A571 = (char)1;
    B_955C = (char)(B_955C | 64);
L13:
    goto L5;
L14:
    if ((char)ax3 == 43) {
        goto L15;
    }
    if ((char)ax3 == 45) {
        goto L15;
    }
    if ((char)ax3 == 33) {
        goto L15;
    }
    if ((char)ax3 == 94) {
        goto L15;
    }
    if ((char)ax3 == 62) {
        goto L15;
    }
    if ((char)ax3 == 60) {
        goto L15;
    }
    if ((char)ax3 == 91) {
        goto L15;
    }
    if ((char)ax3 == 123) {
        goto L15;
    }
    if ((char)ax3 == 125) {
        goto L15;
    }
    if ((char)ax3 != 93) {
        goto L16;
    }
L15:
    B_D4BC = (char)ax3;
    t5 = far_fb38c();
    goto L5;
L16:
    cx4 = ((char)(cx2 >> 8) << 8 | (unsigned char)(char)ax3);
    if ((char)ax3 == 105) {
        goto L17;
    }
    if ((unsigned char)(char)(cx4 >> 8) >= 52) {
        goto L18;
    }
L17:
    goto L19;
L18:
    if ((char)ax3 == 89) {
        goto L20;
    }
    if ((char)ax3 != 90) {
        goto L21;
    }
L20:
    B_A5C6 = (char)(B_A5C6 | 1);
    goto L22;
L21:
    if ((char)ax3 != 86) {
        goto L23;
    }
    B_A5C4 = (char)(B_A5C4 | 1);
    goto L22;
L23:
    if ((char)ax3 != 87) {
        goto L22;
    }
    B_A5C4 = (char)(B_A5C4 | 2);
L22:
    ax3 = L_e5c00();
    dx = UNDEF;
    goto L9;
L2:
    B_7143 = (char)0;
    B_D4BC = (char)0;
    t1 = far_fb4a2();
    dx = UNDEF;
    ax3 = (unsigned char)(char)ax;
    bx = -1;
L24:
    bx = bx + 1;
    ax3 = (*(char far *)MK_FP(0xdf0e, (unsigned int)(unsigned)(TBL_d6056 + -0x1d0 + bx)) << 8 | (unsigned char)(char)ax3);
    if ((char)(ax3 >> 8) == 0) {
        goto L9;
    }
    if ((char)ax3 != (char)(ax3 >> 8)) {
        goto L24;
    }
    cx = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xdf0e, (unsigned int)(unsigned)(TBL_d605f + -0x1d0 + bx)));
    if ((unsigned char)(char)ax3 < 116) {
        goto L19;
    }
    if ((char)cx != 112) {
        goto L25;
    }
    B_A5C6 = (char)(B_A5C6 & -2);
    goto L26;
L25:
    if ((char)cx != 118) {
        goto L27;
    }
    B_A5C4 = (char)(B_A5C4 & -2);
    goto L26;
L27:
    if ((char)cx != 119) {
        goto L26;
    }
    B_A5C4 = (char)(B_A5C4 & -3);
L26:
    t2 = L_e5d36();
    ax3 = (int)t2;
    dx = (int)(t2 >> 16);
    goto L9;
L5:
L19:
    ax3 = far_dac6a();
    dx = UNDEF;
    if (CC("ns", UNDEF)) {
        goto L9;
    }
    W_945C = W_945C + 1;
L9:
    W_713C = (int)(unsigned)tgt_d612d;
    return ((long)dx << 16 | (unsigned)ax3);
}
