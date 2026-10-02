/* differs: 308 at +5, 994 bytes; 311 at +5, 988 bytes; 312 at +5, 986 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_83CB;
extern char B_83CC;
extern char B_8A9A;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D5DD;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_b88d3[];
extern int W_83CD;
extern int W_904B;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern void far far_b05a7();
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1f96();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b39a2();
extern long far far_b6cd3();
extern long far far_b8f3e();
extern long far far_b9073();
extern long far far_b9102();
extern long far far_b915e();
extern long far far_b9f33();
extern long far far_b9fbd();
extern long far far_e51be();
extern long far far_e7a8c();

long far fn_b85a6(void)
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
    int dx;
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
    int t20;
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
    long t31;
    long t32;
    int t33;
    int t34;
    int t35;
    long t36;
    long t4;
    long t5;
    int t6;
    long t7;
    int t8;
    long t9;

    B_D5DD = (char)91;
    p80 = 0x3265;
    t1 = far_b6cd3(MK_FP(SEG_DATA, p80));
    W_9480 = 1;
    W_947E = 0x100;
    dx = 0x100;
    ax = W_904B + 1 + ((unsigned int)dx < 0);
    W_947C = ax;
    W_947A = dx;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_8A9F);
    loc_6 = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_8A9A);
    loc_5[0] = (char)ax3;
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
            t4 = far_b3819(MK_FP(SEG_DATA, 0x3116), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2, 1, 99, 8);
            t5 = far_b8f3e(loc_6, 1, 8);
            t6 = far_b1f96(27);
            t7 = far_b362e(MK_FP(SEG_DATA, 0x327c), (char far *)&B_83CB, MK_FP(SEG_DATA, 0x2dd2), 8);
            t8 = far_b1ad0(2, 0);
            t9 = far_b3819(MK_FP(SEG_DATA, 0x305b), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), 2, 1, 99, 8);
            t10 = far_b9073(loc_6, loc_5[0], 2, 8);
            t11 = far_b1f96(27);
            t12 = far_b362e(MK_FP(SEG_DATA, 0x3282), (char far *)&B_83CC, MK_FP(SEG_DATA, 0x2dde), 10);
            t13 = far_b1ad0(3, 0);
            t14 = far_b39a2(MK_FP(SEG_DATA, 0x3062), (int far *)&W_947E);
            t15 = far_b39a2(MK_FP(SEG_DATA, 0x3069), (int far *)&W_947A);
            t16 = far_b1f96(27);
            p84 = 4;
            p86 = SEG_DATA;
            p88 = (int)(unsigned)&W_83CD;
            p90 = SEG_DATA;
            p92 = 0x3286;
            t17 = far_b3819(p92, p90, p88, p86, p84, 0, 0x270f, 0);
            t18 = far_b1ad0(4, 0);
            p80 = SEG_STACK;
            p82 = (int)(unsigned)loc_46;
            t19 = far_b9f33(((long)p80 << 16 | (unsigned)p82), *(int *)((char *)&loc_5 + 1));
            t20 = far_b1f96(40);
            t21 = far_b9102();
        }
        for (;;) {
            ax5 = far_b08f7(65);
            dx = UNDEF;
            di = ax5;
            if (ax5 == 0) {
                ax6 = B_7B8D;
                if (ax6 <= 6) {
                    switch ((unsigned int)(unsigned)(TBL_b88d3 + (ax6 << 1))) {
                    case 0:
                        t25 = far_b8f3e(loc_6, 1, 8);
                        t26 = far_e51be((unsigned char far *)B_901B, loc_6, 1);
                        p88 = 0xb702;
                        t27 = far_b915e((int far *)&W_947E, (int far *)&W_947A, B_8A9F);
                        t28 = far_b1073(4);
                        t29 = far_b1073(5);
L2:
                        ax7 = TBL_90C1[TBL_905D[loc_5[0]]] & 4;
                        *(int *)((char *)&loc_5 + 1) = ax7;
                        loc_2 = ax7;
                        p80 = 2;
                        p82 = loc_5[0];
                        p84 = loc_6;
                        p86 = 0xb702;
                        t30 = far_b9073(p84, p82, p80, 8);
                        si = 1;
L3:
                        if (B_83CB != 0) {
                            ax8 = 0x270f;
                        } else {
                            ax8 = 127;
                        }
                        dx = ax8;
                        if (B_83CC == 2) {
                            dx = 200;
                        }
                        if (W_83CD > dx) {
                            W_83CD = dx;
                            t31 = far_b1073(6);
                            dx = (int)(t31 >> 16);
                        }
                        break;
                    case 1:
                    case 3:
                    case 6:
                        goto L3;
                    case 2:
                        goto L2;
                    case 4:
                    case 5:
                        p80 = SEG_DATA;
                        p82 = (int)(unsigned)&W_947A;
                        p84 = SEG_DATA;
                        p86 = (int)(unsigned)&W_947E;
                        p88 = 0xb702;
                        t22 = far_b915e(((long)p84 << 16 | (unsigned)p86), ((long)p80 << 16 | (unsigned)p82), B_8A9F);
                        t23 = far_b1073(4);
                        t24 = far_b1073(5);
                        dx = (int)(t24 >> 16);
                        break;
                    }
                }
                if (si != 0) {
                    goto L4;
                }
                continue;
            }
            break;
        }
        goto L5;
    }
    return ((long)dx << 16 | (unsigned)di);
L4:
L5:
    if (si == 0) {
        p80 = (int)(unsigned)&loc_2;
        p82 = SEG_STACK;
        p84 = (int)(unsigned)loc_46;
        p86 = *(int *)((char *)&loc_5 + 1);
        p88 = 7;
        p90 = 4;
        p92 = di;
        t32 = far_b9fbd(p92, p90, p88, p86, ((long)p82 << 16 | (unsigned)p84), MK_FP(SEG_STACK, p80));
        dx = (int)(t32 >> 16);
        di = (int)t32;
        if ((int)t32 == 120) {
            t33 = far_b1ad0(7, 0);
            t34 = far_b1b05(MK_FP(SEG_DATA, 0x328d));
            t35 = far_b1f96(40);
            p80 = (int)(unsigned)loc_46;
            p82 = ((char)((unsigned int)(unsigned)loc_46 >> 8) << 8 | (unsigned char)B_8A9F);
            p84 = ((char)-(loc_5[0] < 0) << 8 | (unsigned char)TBL_905D[loc_5[0]]);
            p86 = W_83CD;
            p88 = B_83CC;
            p90 = ((char)-(B_83CC < 0) << 8 | (unsigned char)B_83CB);
            t36 = far_e7a8c(p90, p88, p86, p84, p82, MK_FP(SEG_STACK, p80));
            dx = (int)(t36 >> 16);
            di = 77;
        }
    }
    goto L1;
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9073(int p0, int p1, int p2, int p3) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b915e(int far *p0, int far *p1, int p2) { return 0; }
