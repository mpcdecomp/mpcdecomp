/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_7B8D;
extern char B_7FCA;
extern char B_7FCB;
extern unsigned char B_8287[];
extern unsigned char B_8288[];
extern char B_8289;
extern char B_8A9A;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D4C2;
extern char B_D5DD;
extern unsigned char TBL_b9f07[];
extern unsigned char TBL_b9f13[];
extern int W_8281;
extern int W_8283;
extern int W_8285;
extern long far L_d2667(int);
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern long far far_b1206(int, int);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b362e(void far *, unsigned char far *, void far *);
extern long far far_b3819(void far *, char far *, int, int, int);
extern long far far_b8f3e(int, int);
extern long far far_b90dd(void);
extern long far far_de7ae(int, int);
extern int far far_de88f(int, int);
extern int far far_e0031(unsigned char near *);
extern long far far_e15e2(void);
extern int far far_e1e11(void);
extern long far far_e51be(unsigned char far *, int);
extern int far fn_b984c(int, char near *);
extern long far fn_b98d8(int, char near *);
extern long far fn_b9967(int, int);
int far fn_b984c(int p0, char near *p1) { return 0; }
long far fn_b98d8(int p0, char near *p1) { return 0; }
long far fn_b9967(int p0, int p1) { return 0; }

long far fn_b9a31(void)
{
    char loc_c;
    char loc_b;
    char loc_a;
    char loc_9;
    char loc_8[1];
    char loc_7[1];
    char loc_6[1];
    char loc_5[1];
    char loc_4[2];
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    unsigned int ax16;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int di;
    int p22;
    int p24;
    int p26;
    int si;
    long t1;
    long t10;
    long t11;
    int t12;
    long t13;
    long t14;
    int t15;
    long t16;
    long t17;
    int t18;
    long t19;
    long t2;
    long t20;
    int t21;
    long t22;
    long t23;
    int t24;
    long t25;
    long t26;
    int t27;
    long t28;
    long t29;
    long t3;
    int t30;
    int t31;
    long t32;
    long t33;
    long t34;
    int t35;
    int t36;
    int t37;
    int t38;
    long t39;
    long t4;
    long t40;
    long t41;
    int t42;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    loc_b = B_8A9F;
    loc_c = B_8A9A;
    fn_b984c(B_8A9A, &loc_a);
    far_b1ad0(1);
    t1 = far_b8f3e(loc_b, 1);
    far_b1ad0(2);
    far_b1b05(0x3725);
    far_b1ad0(2);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x3551), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 2, 1, 99);
    far_b1ad0(3);
    t3 = far_b3819(MK_FP(SEG_DATA, 0x374e), (int far *)&W_8281, 3, 1, 0x3e7);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x3754), (unsigned char far *)B_8287, 2, 1, 31);
    t5 = far_b362e(MK_FP(SEG_DATA, 0x375b), (unsigned char far *)B_8288, MK_FP(SEG_DATA, 0x5c4));
    far_b1ad0(3);
    t6 = far_b362e(MK_FP(SEG_DATA, 0x375d), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), MK_FP(SEG_DATA, 0x3542));
    t7 = (long)(signed char)B_7FCA * (long)(int)(B_7FCB + 1);
    di = (int)far_de7ae(W_8285, 0);
    loc_2 = far_de88f(di, B_7FCA);
    t8 = far_b362e(MK_FP(SEG_DATA, 0x3551), (char far *)&B_7FCA, MK_FP(SEG_DATA, 0x1fc));
    t9 = far_b3819(MK_FP(SEG_DATA, 0x3572), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 5, *(int *)(0x248 + ((int)t7 << 1)), *(int *)(0x252 + ((int)t7 << 1)));
    far_b1f96();
    t10 = far_b362e(MK_FP(SEG_DATA, 0x3765), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), MK_FP(SEG_DATA, 0x208));
    t11 = far_b3819(MK_FP(SEG_DATA, 0x376b), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 3, 0, 128);
    if (loc_4[0] == 0) {
        t12 = far_b1ad0(4);
        ax9 = far_b1b05(0x354e);
    }
    far_b1ad0(5);
    t13 = far_b362e(MK_FP(SEG_DATA, 0x3772), (char far *)&B_8289, MK_FP(SEG_DATA, 0x3536));
    t14 = far_b3819(MK_FP(SEG_DATA, 0x3551), (int far *)&W_8283, 3, 1, 0x3e7);
    if (B_8289 == 0) {
        t15 = far_b1ad0(5);
        ax11 = far_b1b05(0x3778);
    }
    far_b1f96();
    t16 = far_b3819(MK_FP(SEG_DATA, 0x377c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 2, 0, 16);
    t17 = far_b362e(MK_FP(SEG_DATA, 0x3551), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), MK_FP(SEG_DATA, 0x25c));
    if (loc_a == 0) {
        t18 = far_b1ad0(5);
        ax13 = far_b1b05(0x354e);
    }
    t19 = far_b3819(MK_FP(SEG_DATA, 0x3781), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), 2, 0, 16);
    p24 = 0x25c;
    p26 = SEG_STACK;
    t20 = far_b362e(MK_FP(SEG_DATA, 0x3551), ((long)p26 << 16 | (unsigned)(unsigned int)(unsigned)loc_7), MK_FP(SEG_DATA, p24));
    if (loc_9 == 0) {
        t21 = far_b1ad0(5);
        ax14 = far_b1b05(0x354e);
    }
    t22 = far_b90dd();
    p22 = 0x3788;
    ax15 = far_b1b05(p22);
    B_D5DD = (char)1;
    si = 0;
    while (si == 0) {
        for (;;) {
            t42 = far_b08f7();
            si = t42;
            if (t42 != 0) {
                break;
            }
            ax16 = B_7B8D;
            if (ax16 > 15) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_b9f13 + (ax16 << 1))) {
            case 0:
                p22 = 1;
                p24 = loc_b;
                t34 = far_b8f3e(p24, p22);
                continue;
            case 1:
                goto L1;
            case 2:
            case 11:
                if (W_8283 > W_8281) {
                    W_8283 = W_8281;
                }
L2:
                if (B_8289 != 0) {
                    t32 = far_b1073();
                    continue;
                }
                t30 = far_b1ad0(5);
                p22 = 0x3778;
                t31 = far_b1b05(p22);
                continue;
            case 3:
            case 4:
                continue;
            case 5:
            case 8:
            case 9:
            case 12:
            case 13:
            case 14:
            case 15:
                t29 = fn_b98d8(loc_c, &loc_a);
L1:
                p22 = (int)(unsigned)&loc_a;
                p24 = loc_c;
                p26 = 0xc32b;
                t33 = fn_b9967(p24, p22);
                continue;
            case 6:
                t25 = (long)(signed char)B_7FCA * (long)(int)(B_7FCB + 1);
                t26 = far_b1206(7, *(int *)(0x248 + ((int)t25 << 1)));
                p22 = B_7FCA;
                p24 = di;
                t27 = far_de88f(p24, p22);
                loc_2 = t27;
                t28 = far_b1073();
                continue;
            case 7:
                t23 = far_de7ae(loc_2, B_7FCA);
                di = (int)t23;
                p22 = B_7FCA;
                p24 = di;
                t24 = far_de88f(p24, p22);
                W_8285 = t24;
                continue;
            case 10:
                goto L2;
            }
        }
        bx = si - 117;
        if (bx > 5) {
            continue;
        }
        switch ((unsigned int)(unsigned)(TBL_b9f07 + (bx << 1))) {
        case 0:
        case 5:
            if (si != 122) {
                if (loc_c < 99) {
                    loc_c = (char)(loc_c + 1);
                }
            } else if (loc_c > 1) {
                loc_c = (char)(loc_c - 1);
            }
            p22 = (int)(unsigned)&loc_a;
            p24 = loc_c;
            p26 = 0xc32b;
            t41 = fn_b9967(p24, p22);
            si = 0;
            continue;
        case 1:
        case 2:
            continue;
        case 3:
            t35 = far_b1ad0(7);
            t36 = far_b1b05(0x37b1);
            t37 = far_e0031(B_901B);
            t38 = far_e1e11();
            t39 = far_e15e2();
            p22 = loc_b;
            t40 = L_d2667(p22);
            si = B_D4C2;
            continue;
        case 4:
            si = 0;
            continue;
        }
    }
    return (long)MK_FP((int)(far_e51be((unsigned char far *)B_901B, B_8A9F) >> 16), si);
}
