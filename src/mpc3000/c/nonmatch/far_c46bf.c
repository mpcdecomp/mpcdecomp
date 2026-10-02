/* differs: 308 at +0, 442 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char B_7B8D;
extern unsigned char B_8186[];
extern unsigned char B_8187[];
extern unsigned char B_826A[];
extern unsigned char B_826B[];
extern char B_826C;
extern unsigned char B_826D[];
extern unsigned char B_826E[];
extern char B_9562;
extern char B_D5DE;
extern char TBL_0F77[];
extern unsigned char TBL_c489c[];
extern int W_881C;
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1d48(void far *);
extern int far far_b1f96(void);
extern long far far_b362e(void far *, unsigned char far *, void far *);
extern long far far_b3819(void far *, unsigned char far *, int, int, int);
extern long far far_b3b9f(void);
extern long far far_b4fc0(void);
extern long far far_b90dd(void);
extern long far far_c6894(void);
extern void far far_e2d6e(void);
extern long far far_e7069(void);
extern long far far_ec03b(int);
extern long far fn_c48a8(void);

long far far_c46bf(void)
{
    int ax;
    int ax10;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int dx;
    long t1;
    int t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_ec03b(0x52bc);
    far_b1ad0(1);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x52c6), (unsigned char far *)B_826A, 3, 0, 100);
    far_b1f96();
    t3 = far_b362e(MK_FP(SEG_DATA, 0x52ce), (unsigned char far *)B_826B, MK_FP(SEG_DATA, 36));
    far_b1f96();
    t4 = far_b362e(MK_FP(SEG_DATA, 0x52d7), (unsigned char far *)B_8187, MK_FP(SEG_DATA, 0x5054));
    far_b1ad0(2);
    t5 = far_b362e(MK_FP(SEG_DATA, 0x52df), (unsigned char far *)B_8186, MK_FP(SEG_DATA, 0x50dc));
    far_b1f96();
    t6 = far_b362e(MK_FP(SEG_DATA, 0x52e9), (char far *)&B_826C, MK_FP(SEG_DATA, 0x507c));
    far_b1ad0(3);
    t7 = far_ec03b(0x52ef);
    far_b1ad0(4);
    t8 = far_b362e(MK_FP(SEG_DATA, 0x530b), (unsigned char far *)B_826D, MK_FP(SEG_DATA, 0x50a0));
    t9 = far_b362e(MK_FP(SEG_DATA, 0x5312), (unsigned char far *)B_826E, MK_FP(SEG_DATA, 0x50a0));
    far_b1ad0(5);
    far_e2d6e();
    far_b1d48(MK_FP(SEG_DATA, 0x531a));
    t11 = far_b90dd();
    ax10 = far_b1b05(0x532d);
    dx = 0;
    goto L1;
L2:
    if (B_7B8D == 4) {
        goto L3;
    }
    goto L4;
L3:
    W_881C = TBL_0F77[B_826C];
L4:
    t17 = far_b08f7();
    dx = t17;
    if (t17 == 0) {
        goto L2;
    }
    bx = dx - 117;
    if (bx > 5) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_c489c + (bx << 1))) {
    case 0:
        goto L5;
    case 1:
    case 2:
        goto L1;
    case 3:
        goto L6;
    case 4:
        goto L7;
    case 5:
        goto L8;
    }
L6:
    t13 = far_e7069();
    if (B_9562 == 0) {
        goto L9;
    }
    t14 = far_b3b9f();
    dx = B_D5DE;
    goto L1;
L9:
    t15 = fn_c48a8();
    dx = (int)t15;
    goto L1;
L7:
    t12 = far_c6894();
    dx = (int)t12;
    goto L1;
L8:
    dx = 0;
    goto L1;
L5:
    t16 = far_b4fc0();
    dx = (char)(int)t16;
L1:
    if (dx == 0) {
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far fn_c48a8(void) { return 0; }
