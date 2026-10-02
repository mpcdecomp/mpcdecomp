/* differs: 308 at +5, 501 bytes; 311 at +5, 544 bytes; 312 at +5, 543 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_955F;
extern char B_9783;
extern char B_D4C1;
extern char TBL_905D[];
extern unsigned char TBL_caa94[];
extern int W_904B;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b3819();
extern long far far_b39a2();
extern long far far_b9073(int, int, int);
extern long far far_b90dd(void);
extern long far far_b915e(long, long);
extern long far far_d7b8f(int);
extern long far far_e37be(unsigned char near *);
extern long far far_e7069(void);
extern long far far_e7db2(int, int);
extern long far far_ec03b(int);

long far far_ca832(void)
{
    int loc_2;
    char loc_4[2];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    unsigned int ax7;
    int ax8;
    int dx;
    int p10;
    int p12;
    int p14;
    int p16;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    int t18;
    long t19;
    int t2;
    int t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_ec03b(0x62c6);
    W_9480 = 1;
    W_947E = 0x100;
    W_947C = W_904B + 1;
    W_947A = 0x100;
    t2 = far_b1ad0(1);
    loc_4[0] = B_9783;
    t3 = far_b3819(MK_FP(SEG_DATA, 0x62d0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 2, 0, 99);
    t4 = far_b9073(B_8A9F, loc_4[0], 1);
    t5 = far_b1ad0(1);
    loc_2 = B_955F;
    p16 = SEG_STACK;
    t6 = far_b3819(MK_FP(SEG_DATA, 0x62d7), &loc_2, p16, 3, -99, 99);
    far_b1ad0(2);
    far_b1b05(0x62df);
    far_b1ad0(3);
    t7 = far_ec03b(0x62fe);
    far_b1ad0(4);
    t8 = far_b39a2(MK_FP(SEG_DATA, 0x6312), &W_947E);
    p12 = SEG_DATA;
    p14 = 0x6319;
    t9 = far_b39a2(p14, p12, &W_947A);
    t10 = far_b90dd();
    p10 = 0x631b;
    ax5 = far_b1b05(p10);
    dx = 0;
    goto L1;
L2:
    ax7 = B_7B8D;
    if (ax7 > 3) {
        goto L3;
    }
    switch ((unsigned int)(unsigned)(TBL_caa94 + (ax7 << 1))) {
    case 0:
        goto L4;
    case 1:
        goto L5;
    case 2:
    case 3:
        goto L6;
    }
L4:
    if (TBL_905D[loc_4[0]] != -1) {
        goto L7;
    }
    t15 = far_e37be(B_901B);
L7:
    p10 = 1;
    p12 = loc_4[0];
    p14 = B_8A9F;
    t16 = far_b9073(p14, p12, p10);
    B_9783 = loc_4[0];
    goto L3;
L5:
    B_955F = *(char *)((char *)&loc_2 + 0);
    p10 = 2;
    t14 = far_d7b8f(p10);
    goto L3;
L6:
    p10 = SEG_DATA;
    p12 = (int)(unsigned)&W_947A;
    p14 = SEG_DATA;
    p16 = (int)(unsigned)&W_947E;
    t11 = far_b915e(((long)p14 << 16 | (unsigned)p16), ((long)p10 << 16 | (unsigned)p12));
    t12 = far_b1073();
    t13 = far_b1073();
L3:
    ax6 = far_b08f7();
    dx = ax6;
    if (ax6 != 0) {
        goto L8;
    }
    goto L2;
L8:
    if (ax6 != 68) {
        goto L9;
    }
    goto L10;
L9:
    if (ax6 == 78) {
        goto L11;
    }
    if (ax6 == 120) {
        goto L12;
    }
    goto L1;
L12:
    t17 = far_b1ad0(7);
    t18 = far_b1b05(0x6331);
    t19 = far_e7069();
    loc_4[1] = B_8A9F;
    t20 = far_b1f96();
    p12 = B_955F;
    t21 = far_e7db2(p12, TBL_905D[B_9783]);
    B_955F = (char)0;
    p10 = 2;
    t22 = far_d7b8f(p10);
    dx = 77;
    goto L1;
L11:
    ax8 = B_D4C1 - 60;
    loc_2 = ax8;
    B_955F = (char)ax8;
    p10 = 2;
    t23 = far_d7b8f(p10);
    t24 = far_b1073();
L10:
    dx = 0;
L1:
    if (dx != 0) {
        goto L13;
    }
    goto L3;
L13:
    return ((long)dx << 16 | (unsigned)dx);
}
