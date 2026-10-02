/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_83CA;
extern char B_8A9A;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_9446;
extern char B_9468;
extern char B_9469;
extern char B_946A;
extern char B_946B;
extern char B_D5DD;
extern char B_D5DE;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_b7ef7[];
extern int W_904B;
extern int W_9466;
extern int W_9476;
extern int W_9478;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern void far far_b05a7(void);
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b130a(int);
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3819();
extern long far far_b39a2();
extern long far far_b3b9f(int);
extern long far far_b3cdb(int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b9073(int, int, int, int);
extern long far far_b9102(void);
extern long far far_b915e(int far *, int far *, int);
extern long far far_b9f33(char far *, int);
extern long far far_b9fbd(int, int, int, int, long, void far *);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_ebda4(int);
extern long far far_ec03b(void far *);
extern long far far_ff332(int, char far *);
extern long far far_ffa1e(void);

long far fn_b79e8(void)
{
    char loc_4c[65];
    char loc_b;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
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
    int di;
    unsigned int dx;
    int dx2;
    int dx3;
    int p86;
    int p88;
    int p90;
    int p92;
    int p94;
    int p96;
    int p98;
    int si;
    long t1;
    long t10;
    int t11;
    int t12;
    long t13;
    int t14;
    int t15;
    long t16;
    int t17;
    long t18;
    int t19;
    int t2;
    long t20;
    long t21;
    int t22;
    long t23;
    int t24;
    long t25;
    int t26;
    long t27;
    int t28;
    int t29;
    int t3;
    int t30;
    int t31;
    long t32;
    long t33;
    long t34;
    long t35;
    long t36;
    long t37;
    long t38;
    long t39;
    long t4;
    long t40;
    long t41;
    long t42;
    long t43;
    long t44;
    int t45;
    long t46;
    long t47;
    long t48;
    int t49;
    int t5;
    int t50;
    int t51;
    long t52;
    long t53;
    long t54;
    long t55;
    long t6;
    long t7;
    int t8;
    long t9;

    B_D5DD = (char)6;
    p86 = 0x2d08;
    t1 = far_b6cd3(MK_FP(SEG_DATA, p86));
    W_9466 = 1;
    ax = ((char)((int)t1 >> 8) << 8 | (unsigned char)B_8A9F);
    B_9469 = (char)ax;
    B_946B = (char)ax;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_8A9A);
    loc_b = (char)ax2;
    B_9468 = (char)ax2;
    B_946A = (char)ax2;
    W_9480 = 1;
    W_947E = 0x100;
    dx = 0x100;
    W_947C = W_904B + 1 + (dx < 0);
    W_947A = dx;
    W_9478 = 1;
    W_9476 = 0x100;
    ax3 = TBL_90C1[TBL_905D[B_946A]] & 4;
    si = ax3;
    loc_4 = ax3;
    loc_2 = 1;
    di = 0;
    for (;;) {
L1:
        if (di != 0) {
            break;
        }
        if (loc_2 != 0) {
            loc_2 = 0;
            far_b05a7();
            t3 = far_b1ad0(1, 0);
            t4 = far_b3819(MK_FP(SEG_DATA, 0x2c16), (char far *)&B_946B, 2, 1, 99, 8);
            t5 = far_b1f96(14);
            t6 = far_b3819(MK_FP(SEG_DATA, 0x2d19), (char far *)&B_946A, 2, 0, 99, 8);
            t7 = far_b9073(B_946B, B_946A, 1, 22);
            t8 = far_b1ad0(2, 0);
            t9 = far_b39a2(MK_FP(SEG_DATA, 0x2d20), (int far *)&W_947E);
            t10 = far_b39a2(MK_FP(SEG_DATA, 0x2d27), (int far *)&W_947A);
            t11 = far_b1ad0(3, 0);
            if (B_946A != 0) {
                loc_4 = si;
                t13 = far_b9f33((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4c), si);
            } else {
                t12 = far_b1b05(MK_FP(SEG_DATA, 0x2d29));
            }
            t14 = far_b1f96(40);
            t15 = far_b1ad0(4, 0);
            t16 = far_ec03b(MK_FP(SEG_DATA, 0x2d33));
            t17 = far_b1ad0(5, 0);
            t18 = far_b3819(MK_FP(SEG_DATA, 0x2c16), (char far *)&B_9469, 2, 1, 99, 8);
            t19 = far_b1ad0(5, 14);
            t20 = far_b3819(MK_FP(SEG_DATA, 0x2d19), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_b), 2, 0, 99, 8);
            t21 = far_b9073(B_9469, loc_b, 5, 22);
            t22 = far_b1ad0(6, 0);
            t23 = far_b362e(MK_FP(SEG_DATA, 0x2d42), (char far *)&B_83CA, MK_FP(SEG_DATA, 0x2ab0), 7);
            t24 = far_b1ad0(6, 14);
            p92 = SEG_DATA;
            p94 = (int)(unsigned)&W_9466;
            p96 = SEG_DATA;
            p98 = 0x2cdf;
            t25 = far_b3819(p98, p96, p94, p92, 3, 1, 0x3e7, 0);
            t26 = far_b1ad0(6, 25);
            p88 = SEG_DATA;
            p90 = 0x2d48;
            t27 = far_b39a2(p90, p88, (int far *)&W_9476);
            t28 = far_b1ad0(7, 0);
            p86 = 0x2d4f;
            t29 = far_b1b05(MK_FP(SEG_DATA, p86));
            ax3 = t29;
        }
        if (si == 0) {
            ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)60);
        } else {
            ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)6);
        }
        B_D5DD = (char)ax4;
        B_9446 = (char)1;
        for (;;) {
            ax3 = far_b08f7(65);
            dx = UNDEF;
            di = ax3;
            if (ax3 != 0) {
                break;
            }
            if (B_7B8D <= 3) {
                B_D5DD = (char)6;
                t30 = far_b130a(B_7B8D);
                B_D5DD = (char)60;
                t31 = far_b130a(B_7B8D);
                ax5 = t31;
                dx = UNDEF;
                if (si == 0) {
                    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)60);
                } else {
                    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)6);
                }
                B_D5DD = (char)ax6;
            }
            ax3 = B_7B8D;
            bx = ax3;
            if (bx <= 3) {
                switch ((unsigned int)(unsigned)(TBL_b7ef7 + (bx << 1))) {
                case 0:
                    t35 = far_e51be((unsigned char far *)B_901B, B_946B, 1);
                    p94 = 0xbdc0;
                    t36 = far_b915e((int far *)&W_947E, (int far *)&W_947A, B_946B);
                    t37 = far_b1073(2);
                    t38 = far_b1073(3);
L2:
                    p86 = 1;
                    p88 = B_946A;
                    p90 = B_946B;
                    p92 = 0xbdc0;
                    t39 = far_b9073(p90, p88, p86, 23);
                    dx = (int)(t39 >> 16);
                    ax3 = TBL_90C1[TBL_905D[B_946A]] & 4;
                    si = ax3;
                    loc_4 = ax3;
                    if (B_946A != 0) {
                        ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_9468);
                        loc_b = (char)ax3;
                    } else {
                        loc_b = (char)0;
                    }
                    loc_2 = 1;
                    break;
                case 1:
                    goto L2;
                case 2:
                case 3:
                    p86 = SEG_DATA;
                    p88 = (int)(unsigned)&W_947A;
                    p90 = SEG_DATA;
                    p92 = (int)(unsigned)&W_947E;
                    p94 = 0xbdc0;
                    t32 = far_b915e(((long)p90 << 16 | (unsigned)p92), ((long)p86 << 16 | (unsigned)p88), B_946B);
                    t33 = far_b1073(2);
                    t34 = far_b1073(3);
                    ax3 = (int)t34;
                    dx = (int)(t34 >> 16);
                    break;
                }
            }
            if (loc_2 != 0) {
                goto L3;
            }
            if (si == 0) {
                ax7 = 2;
            } else {
                ax7 = 0;
            }
            loc_6 = ax7;
            ax8 = B_7B8D - loc_6;
            if (ax8 == 4) {
                goto L4;
            }
            if (ax8 == 5) {
                goto L5;
            }
            if (ax8 != 8) {
                continue;
            }
L4:
            loc_8 = 1;
            loc_a = 0x100;
            p94 = 0xbdc0;
            t40 = far_b915e((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), (int far *)&W_9476, B_9469);
            t41 = far_b1073((char)(*(char *)((char *)&loc_6 + 0) + 8));
L5:
            if (B_946A == 0) {
                loc_b = (char)0;
            } else {
                if (loc_b == 0) {
                    loc_b = (char)1;
                }
                B_9468 = loc_b;
            }
            t42 = far_b1073((char)(*(char *)((char *)&loc_6 + 0) + 5));
            p86 = 5;
            p88 = loc_b;
            p90 = B_9469;
            p92 = 0xbdc0;
            t43 = far_b9073(p90, p88, p86, 22);
        }
        goto L6;
    }
    return ((long)dx << 16 | (unsigned)di);
L3:
L6:
    B_9446 = (char)0;
    if (loc_2 != 0) {
        goto L1;
    }
    ax3 = di;
    if (ax3 == 68 || ax3 == 78) {
        if (B_946A != 0) {
            p86 = (int)(unsigned)&loc_4;
            p88 = SEG_STACK;
            p90 = (int)(unsigned)loc_4c;
            p92 = si;
            p94 = 4;
            p96 = 3;
            p98 = di;
            t55 = far_b9fbd(p98, p96, p94, p92, ((long)p88 << 16 | (unsigned)p90), MK_FP(SEG_STACK, p86));
            ax3 = (int)t55;
            dx = (int)(t55 >> 16);
            di = ax3;
        } else {
            di = 0;
        }
        goto L1;
    }
    if (ax3 != 120) {
        goto L1;
    }
    t44 = far_ffa1e();
    dx2 = (int)t44;
    if ((int)t44 == 0) {
        goto L7;
    }
    if (dx2 != -3) {
        return (long)MK_FP((int)(far_b3b9f(dx2) >> 16), B_D5DE);
    }
    t45 = far_b1af9();
    t46 = far_b3cdb(102, 1, 11);
    t47 = far_b9102();
    t48 = far_ebda4(1);
    ax9 = (int)t48;
    dx3 = (int)(t48 >> 16);
    if (ax9 != 120) {
        return ((long)dx3 << 16 | (unsigned)ax9);
    }
    t49 = far_b1aff();
L7:
    t50 = far_b1ad0(7, 0);
    t51 = far_b1b05(MK_FP(SEG_DATA, 0x2d57));
    t52 = far_ff332(B_83CA, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4c));
    ax10 = (int)t52;
    if (ax10 < 0) {
        t53 = far_b3b9f(ax10);
    }
    p86 = B_8A9F;
    p88 = SEG_DATA;
    p90 = (int)(unsigned)B_901B;
    t54 = far_e51be(((long)p88 << 16 | (unsigned)p90), p86, 0);
    dx = (int)(t54 >> 16);
    ax3 = B_D5DE;
    di = ax3;
    goto L1;
}
long far far_b9073(int p0, int p1, int p2, int p3) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b915e(int far *p0, int far *p1, int p2) { return 0; }
