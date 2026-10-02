/* differs: 308 absent; 311 at +5, 1072 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_7FE1;
extern char B_7FE2;
extern char B_7FE3;
extern unsigned char B_8808;
extern char B_8A9A;
extern char B_8A9F;
extern char B_901B;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_ca7f8[];
extern int W_880C;
extern int W_904B;
extern int W_9051;
extern int W_9053;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern long far far_b059a(void);
extern void far far_b05a7(void);
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b362e(void far *, char far *, void far *);
extern long far far_b3819();
extern long far far_b39a2();
extern long far far_b9073(int, int, int);
extern long far far_b915e(long, long);
extern long far far_b9f33(void far *);
extern long far far_b9fbd(int, int, int, int, long, int);
extern long far far_ca806(void);
extern long far far_e4a4b(int, int);
extern long far far_e5612(int);
extern long far far_ec03b(int);

long far far_ca3c4(void)
{
    char loc_4c[64];
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    char loc_4;
    char loc_3;
    char loc_2;
    char loc_1;
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
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
    long t12;
    int t13;
    long t14;
    long t15;
    int t16;
    long t17;
    long t18;
    int t19;
    int t2;
    int t20;
    long t21;
    int t22;
    int t23;
    int t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    int t3;
    int t30;
    int t31;
    int t32;
    int t33;
    long t34;
    long t35;
    long t36;
    int t37;
    int t38;
    long t39;
    long t4;
    int t40;
    long t41;
    long t42;
    long t43;
    long t5;
    int t6;
    int t7;
    int t8;
    long t9;

    p86 = 0x6872;
    t1 = far_ec03b(p86);
    W_9480 = 1;
    W_947E = 0x100;
    dx = 0x100;
    W_947C = W_904B + 1 + (dx < 0);
    W_947A = dx;
    loc_4 = B_8A9A;
    loc_8 = 0;
    si = 1;
    loc_1 = (char)0;
    for (;;) {
L1:
        if (loc_1 != 0) {
            break;
        }
        if (si != 0) {
            si = 0;
            far_b05a7();
            ax = TBL_90C1[TBL_905D[loc_4]] & 4;
            di = ax;
            loc_8 = ax;
            t3 = far_b1ad0(1);
            t4 = far_b362e(MK_FP(SEG_DATA, 0x688d), (char far *)&B_7FE3, MK_FP(SEG_DATA, 0x67fe));
            t5 = far_b3819(MK_FP(SEG_DATA, 0x6899), (char far *)&B_7FE2, 2, 50, 75);
            if (B_7FE3 != 1 && B_7FE3 != 3) {
                t6 = far_b1ad0(1);
                t7 = far_b1b05(0x68a5);
            }
            t8 = far_b1ad0(2);
            loc_2 = (char)1;
            ax2 = ((char)(t8 >> 8) << 8 | (unsigned char)B_7FE1);
            loc_3 = (char)ax2;
            if (B_7FE1 < 0) {
                loc_2 = (char)0;
                loc_3 = -(char)ax2;
            }
            t9 = far_b362e(MK_FP(SEG_DATA, 0x68af), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), MK_FP(SEG_DATA, 0x228));
            t10 = far_b3819(MK_FP(SEG_DATA, 0x68bd), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), 2, 0, 99);
            t11 = far_b1ad0(3);
            t12 = far_ec03b(0x68d0);
            t13 = far_b1ad0(4);
            p92 = SEG_STACK;
            p94 = (int)(unsigned)&loc_4;
            p96 = SEG_DATA;
            p98 = 0x68e4;
            t14 = far_b3819(p98, p96, p94, p92, 2, 0, 99);
            t15 = far_b9073(B_8A9F, loc_4, 4);
            t16 = far_b1ad0(5);
            t17 = far_b39a2(MK_FP(SEG_DATA, 0x68eb), &W_947E);
            p88 = SEG_DATA;
            p90 = 0x68f2;
            t18 = far_b39a2(p90, p88, &W_947A);
            t19 = far_b1ad0(6);
            if (loc_4 != 0) {
                loc_8 = di;
                p88 = (int)(unsigned)loc_4c;
                t21 = far_b9f33(MK_FP(SEG_STACK, p88));
            } else {
                t20 = far_b1b05(0x68f4);
            }
            t22 = far_b1f96();
            t23 = far_b1ad0(7);
            p86 = 0x68fe;
            t24 = far_b1b05(p86);
        }
        loc_6 = 0;
        for (;;) {
            ax3 = far_b08f7();
            dx = UNDEF;
            loc_1 = (char)ax3;
            if ((char)ax3 != 0) {
                break;
            }
            ax4 = B_7B8D;
            if (ax4 <= 6) {
                switch ((unsigned int)(unsigned)(TBL_ca7f8 + (ax4 << 1))) {
                case 0:
                case 1:
                    if (B_7FE3 != 1 && B_7FE3 != 3) {
                        B_7FE2 = (char)50;
                    }
L2:
                    t29 = far_ca806();
                    ax7 = B_8808 - W_880C;
                    dx2 = ax7 - -(ax7 < 0) >> 1;
                    if (loc_3 >= dx2) {
                        loc_3 = (char)((char)dx2 - 1);
                    }
                    if (loc_3 < 0) {
                        loc_3 = (char)0;
                    }
                    if (loc_2 == 0) {
                        B_7FE1 = -loc_3;
                    } else {
                        B_7FE1 = loc_3;
                    }
                    if (B_7FE3 == 1 || B_7FE3 == 3) {
                        t32 = far_b1ad0(1);
                        p86 = 0x689d;
                        t33 = far_b1b05(p86);
                        t34 = far_b1073();
                    } else {
                        t30 = far_b1ad0(1);
                        p86 = 0x68a5;
                        t31 = far_b1b05(p86);
                    }
                    t35 = far_b1073();
                    dx = (int)(t35 >> 16);
                    loc_6 = 1;
                    break;
                case 2:
                case 3:
                    goto L2;
                case 4:
                    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)loc_4);
                    ax6 = TBL_90C1[TBL_905D[(char)ax5]] & 4;
                    di = ax6;
                    loc_8 = ax6;
                    p86 = 4;
                    p88 = (char)ax5;
                    p90 = B_8A9F;
                    t28 = far_b9073(p90, p88, p86);
                    dx = (int)(t28 >> 16);
                    si = 1;
                    break;
                case 5:
                case 6:
                    p86 = SEG_DATA;
                    p88 = (int)(unsigned)&W_947A;
                    p90 = SEG_DATA;
                    p92 = (int)(unsigned)&W_947E;
                    t25 = far_b915e(((long)p90 << 16 | (unsigned)p92), ((long)p86 << 16 | (unsigned)p88));
                    t26 = far_b1073();
                    t27 = far_b1073();
                    dx = (int)(t27 >> 16);
                    break;
                }
            }
            if (si == 0) {
                continue;
            }
            goto L3;
        }
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)loc_1);
L3:
L4:
    if (si == 0) {
        if (loc_6 != 0 && B_901B >= 0) {
            dx3 = W_9051;
            loc_a = W_9053;
            loc_c = dx3;
            W_9053 = 0;
            p86 = W_9051;
            t36 = far_e5612(p86);
        }
        ax8 = loc_1;
        dx = ax8;
        if (ax8 == 68 || ax8 == 78) {
            if (loc_4 != 0) {
                p86 = (int)(unsigned)&loc_8;
                p88 = SEG_STACK;
                p90 = (int)(unsigned)loc_4c;
                p92 = di;
                p94 = 7;
                p96 = 6;
                p98 = dx;
                t43 = far_b9fbd(p98, p96, p94, p92, ((long)p88 << 16 | (unsigned)p90), p86);
                dx = (int)(t43 >> 16);
                loc_1 = (char)(int)t43;
            } else {
                loc_1 = (char)0;
            }
        } else if (ax8 == 120) {
            t37 = far_b1ad0(7);
            if (B_7FE3 != 0) {
                t40 = far_b1b05(0x6948);
                TBL_905D[0] = (char)0;
                t41 = far_e5612(W_947E);
                p86 = (int)(unsigned)loc_4c;
                p88 = TBL_905D[loc_4];
                t42 = far_e4a4b(p88, p86);
                dx = (int)(t42 >> 16);
                loc_1 = (char)77;
            } else {
                p86 = 0x6927;
                t38 = far_b1b05(p86);
                t39 = far_b059a();
                dx = (int)(t39 >> 16);
                loc_1 = (char)0;
                si = 1;
            }
        }
    }
    goto L1;
}
long far far_ca806(void) { return 0; }
