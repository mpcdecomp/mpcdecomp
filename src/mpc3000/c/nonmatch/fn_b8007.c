/* differs: 308 at +5, 835 bytes; 311 at +5, 838 bytes; 312 at +5, 837 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8A9A;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D5DD;
extern char B_D5DE;
extern char B_E572;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_b82f4[];
extern int W_904B;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern int W_E573;
extern void far far_b05a7();
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1f96();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b39a2();
extern long far far_b3b9f();
extern long far far_b6cd3();
extern long far far_b8f3e();
extern long far far_b9073();
extern long far far_b9102();
extern long far far_b915e();
extern long far far_b9f33();
extern long far far_b9fbd();
extern long far far_e51be();
extern long far far_ffbb1();

long far fn_b8007(void)
{
    int loc_2;
    char loc_5[3];
    char loc_6;
    char loc_46[64];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    unsigned int ax6;
    int ax7;
    int ax8;
    int di;
    unsigned int dx;
    int p80;
    int p82;
    int p84;
    int p86;
    int p88;
    int p90;
    int p92;
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
    int t18;
    long t19;
    int t2;
    long t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    int t3;
    long t30;
    int t31;
    int t32;
    long t33;
    long t34;
    long t35;
    long t4;
    long t5;
    int t6;
    long t7;
    int t8;
    long t9;

    B_D5DD = (char)8;
    p80 = 0x2dc7;
    t1 = far_b6cd3(MK_FP(SEG_DATA, p80));
    W_9480 = 1;
    W_947E = 0x100;
    dx = 0x100;
    ax = W_904B + 1 + (dx < 0);
    W_947C = ax;
    W_947A = dx;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_8A9F);
    loc_5[0] = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9A);
    loc_6 = (char)ax3;
    ax4 = TBL_90C1[TBL_905D[(char)ax3]] & 4;
    *(int *)((char *)&loc_5 + 1) = ax4;
    loc_2 = ax4;
    si = 1;
    di = 0;
L1:
    if (di == 0) {
        if (si != 0) {
            si = 0;
            far_b05a7();
            t3 = far_b1ad0(1, 0);
            t4 = far_b3819(MK_FP(SEG_DATA, 0x2dd4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), 2, 1, 99, 8);
            t5 = far_b8f3e(loc_5[0], 1, 8);
            t6 = far_b1ad0(1, 27);
            t7 = far_b362e(MK_FP(SEG_DATA, 0x2ddb), (char far *)&B_E572, MK_FP(SEG_DATA, 0x228), 7);
            t8 = far_b1ad0(2, 0);
            t9 = far_b3819(MK_FP(SEG_DATA, 0x2d19), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2, 1, 99, 8);
            t10 = far_b9073(loc_5[0], loc_6, 2, 8);
            t11 = far_b1ad0(2, 27);
            p86 = SEG_DATA;
            p88 = (int)(unsigned)&W_E573;
            p90 = SEG_DATA;
            p92 = 0x2de0;
            t12 = far_b3819(p92, p90, p88, p86, 3, 0, 0x3e7, 0);
            t13 = far_b1ad0(3, 0);
            t14 = far_b39a2(MK_FP(SEG_DATA, 0x2d20), (int far *)&W_947E);
            p84 = 0x2d27;
            t15 = far_b39a2(MK_FP(SEG_DATA, p84), (int far *)&W_947A);
            t16 = far_b1ad0(4, 0);
            p80 = SEG_STACK;
            p82 = (int)(unsigned)loc_46;
            t17 = far_b9f33(((long)p80 << 16 | (unsigned)p82), *(int *)((char *)&loc_5 + 1));
            t18 = far_b1f96(40);
            t19 = far_b9102();
        }
        for (;;) {
            ax5 = far_b08f7(65);
            dx = UNDEF;
            di = ax5;
            if (ax5 == 0) {
                ax6 = B_7B8D;
                if (ax6 <= 5) {
                    switch ((unsigned int)(unsigned)(TBL_b82f4 + (ax6 << 1))) {
                    case 0:
                        t25 = far_b8f3e(loc_5[0], 1, 8);
                        t26 = far_e51be((unsigned char far *)B_901B, loc_5[0], 1);
                        p80 = SEG_DATA;
                        p82 = (int)(unsigned)&W_947A;
                        p84 = SEG_DATA;
                        p86 = (int)(unsigned)&W_947E;
                        p88 = 0xbdc0;
                        t27 = far_b915e(((long)p84 << 16 | (unsigned)p86), ((long)p80 << 16 | (unsigned)p82), B_8A9F);
                        t28 = far_b1073(4);
                        t29 = far_b1073(5);
                        dx = (int)(t29 >> 16);
L2:
                        ax7 = TBL_90C1[TBL_905D[loc_6]] & 4;
                        *(int *)((char *)&loc_5 + 1) = ax7;
                        loc_2 = ax7;
                        si = 1;
                        break;
                    case 1:
                    case 3:
                        t23 = far_b1073(1);
                        t24 = far_b1073(3);
                        dx = (int)(t24 >> 16);
                        break;
                    case 2:
                        goto L2;
                    case 4:
                    case 5:
                        p80 = SEG_DATA;
                        p82 = (int)(unsigned)&W_947A;
                        p84 = SEG_DATA;
                        p86 = (int)(unsigned)&W_947E;
                        p88 = 0xbdc0;
                        t20 = far_b915e(((long)p84 << 16 | (unsigned)p86), ((long)p80 << 16 | (unsigned)p82), B_8A9F);
                        t21 = far_b1073(4);
                        t22 = far_b1073(5);
                        dx = (int)(t22 >> 16);
                        break;
                    }
                }
                if (si != 0) {
                    goto L3;
                }
                continue;
            }
            break;
        }
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)di);
L3:
L4:
    if (si == 0) {
        p80 = (int)(unsigned)&loc_2;
        p82 = SEG_STACK;
        p84 = (int)(unsigned)loc_46;
        p86 = *(int *)((char *)&loc_5 + 1);
        p88 = 4;
        p90 = 4;
        p92 = di;
        t30 = far_b9fbd(p92, p90, p88, p86, ((long)p82 << 16 | (unsigned)p84), MK_FP(SEG_STACK, p80));
        dx = (int)(t30 >> 16);
        di = (int)t30;
        if (di == 120) {
            t31 = far_b1ad0(7, 0);
            t32 = far_b1b05(MK_FP(SEG_DATA, 0x2de8));
            p80 = (int)(unsigned)loc_46;
            p82 = W_E573;
            p84 = B_E572;
            p86 = loc_6;
            t33 = far_ffbb1(p86, p84, p82, MK_FP(SEG_STACK, p80));
            ax8 = (int)t33;
            dx = ax8;
            if (ax8 < 0) {
                t34 = far_b3b9f(ax8);
                p80 = B_8A9F;
                p82 = SEG_DATA;
                p84 = (int)(unsigned)B_901B;
                t35 = far_e51be(((long)p82 << 16 | (unsigned)p84), p80, 0);
                dx = (int)(t35 >> 16);
            }
            di = B_D5DE;
        }
    }
    goto L1;
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9073(int p0, int p1, int p2, int p3) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b915e(long p0, long p1, int p2) { return 0; }
