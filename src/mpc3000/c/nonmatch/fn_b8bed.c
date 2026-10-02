/* differs: 308 absent; 311 absent; 312 at +5, 827 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_7B8D;
extern char B_8A9A;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D4BF;
extern char B_D4C0;
extern char B_D5DD;
extern char B_D5DE;
extern char B_E577;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_b8f34[];
extern int W_904B;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern int W_E578;
extern void far far_b05a7(void);
extern long far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1b41(int, int);
extern long far far_b1f96(int);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3723(int, int, long, int, long, int, void far *);
extern long far far_b3819();
extern long far far_b39a2(void far *, int far *);
extern long far far_b8f3e(int, int, int);
extern long far far_b9073(int, int, int, int);
extern long far far_b9102(void);
extern long far far_b915e(long, long, int);
extern long far far_b9755(int, int, int);
extern long far far_b9f33(char far *, int);
extern long far far_da8cb();
extern long far far_da970(int);
extern long far far_e1ee8(int, int, int, int, void far *);
extern long far far_e51be(unsigned char far *, int, int);

void far fn_b8bed(void)
{
    char loc_69[35];
    char loc_46[64];
    char loc_6[3];
    char loc_3;
    int loc_2;
    int ax;
    unsigned int ax2;
    int ax3;
    int di;
    int p80;
    int p82;
    int p84;
    int p86;
    int p88;
    int p90;
    int p92;
    int p94;
    int p96;
    int si;
    long t1;
    int t10;
    int t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    int t17;
    long t18;
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
    long t32;
    int t33;
    long t34;
    long t35;
    long t36;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    int t9;

    B_D5DD = (char)93;
    *(int *)((char *)&loc_6 + 0) = B_8A9F;
    loc_3 = B_8A9A;
    W_9480 = 1;
    W_947E = 0x100;
    W_947C = W_904B + 1;
    W_947A = 0x100;
    loc_2 = 0;
    si = 1;
    p80 = (int)(unsigned)&B_E577;
    t1 = far_da8cb(MK_FP(SEG_DATA, p80));
    if (B_E577 == 0 && W_E578 == 0) {
        W_E578 = 64;
    }
    di = 0;
    for (;;) {
L1:
        if (di != 0) {
            break;
        }
        if (si != 0) {
            si = 0;
            far_b05a7();
            ax = TBL_90C1[TBL_905D[loc_3]] & 4;
            loc_2 = ax;
            t3 = far_b1ad0(1, 0);
            t4 = far_b3819(MK_FP(SEG_DATA, 0x3116), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), 2, 1, 99, 8);
            t5 = far_b8f3e(*(int *)((char *)&loc_6 + 0), 1, 8);
            t6 = far_b1ad0(2, 0);
            p88 = (int)(unsigned)&loc_3;
            p90 = SEG_DATA;
            p92 = 0x305b;
            t7 = far_b3819(p92, p90, MK_FP(SEG_STACK, p88), 2, 1, 99, 8);
            p82 = loc_3;
            p84 = *(int *)((char *)&loc_6 + 0);
            p86 = 0xb702;
            t8 = far_b9073(p84, p82, 2, 8);
            t9 = far_b1ad0(3, 0);
            if (ax != 0) {
                t12 = far_b39a2(MK_FP(SEG_DATA, 0x3062), (int far *)&W_947E);
                t13 = far_b39a2(MK_FP(SEG_DATA, 0x3069), (int far *)&W_947A);
                t14 = far_b1f96(40);
                t15 = far_b1ad0(4, 0);
                t16 = far_b9f33((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46), ax);
                loc_2 = 1;
                t17 = far_b1ad0(5, 0);
                t18 = far_b362e(MK_FP(SEG_DATA, 0x3315), (char far *)&B_E577, MK_FP(SEG_DATA, 0x234), 6);
                p80 = 253;
                p82 = 0;
                p84 = 127;
                p86 = 0;
                p88 = 4;
                p90 = SEG_DATA;
                p92 = (int)(unsigned)&W_E578;
                p94 = SEG_DATA;
                p96 = 0x3329;
                t19 = far_b3723(p96, p94, ((long)p90 << 16 | (unsigned)p92), p88, ((long)p84 << 16 | (unsigned)p86), p82, MK_FP(0xda7e /* SEG_DA7E */, p80));
            } else {
                t10 = far_b1b05(MK_FP(SEG_DATA, 0x32da));
                p80 = 32;
                t11 = far_b1b41(p80, 80);
            }
            t20 = far_b9102();
            t21 = far_da970(5);
        }
        for (;;) {
            t35 = far_b08f7(65);
            di = (int)t35;
            if ((int)t35 != 0) {
                break;
            }
            ax2 = B_7B8D;
            if (ax2 <= 4) {
                switch ((unsigned int)(unsigned)(TBL_b8f34 + (ax2 << 1))) {
                case 0:
                    t24 = far_b8f3e(*(int *)((char *)&loc_6 + 0), 1, 8);
                    t25 = far_e51be((unsigned char far *)B_901B, *(int *)((char *)&loc_6 + 0), 1);
L2:
                    t26 = far_b9073(*(int *)((char *)&loc_6 + 0), loc_3, 2, 8);
                    si = 1;
L3:
                    p80 = SEG_DATA;
                    p82 = (int)(unsigned)&W_947A;
                    p84 = SEG_DATA;
                    p86 = (int)(unsigned)&W_947E;
                    p88 = 0xb702;
                    t27 = far_b915e(((long)p84 << 16 | (unsigned)p86), ((long)p80 << 16 | (unsigned)p82), B_8A9F);
                    t28 = far_b1073(2);
                    t29 = far_b1073(3);
                    break;
                case 1:
                    goto L2;
                case 2:
                case 3:
                    goto L3;
                case 4:
                    t22 = far_da970(5);
                    t23 = far_b1073(5);
                    break;
                }
            }
            if (si == 0) {
                continue;
            }
            goto L4;
        }
        goto L5;
    }
    t36 = far_da8cb(0, 0);
    return;
L4:
L5:
    if (si == 0) {
        ax3 = di;
        if (ax3 == 68) {
            if (loc_2 != 0) {
                __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46), 0, 64);
                t31 = far_b1ad0(4, 6);
                t32 = far_b1f96(40);
                loc_2 = 0;
            }
            t33 = far_b1ad0(4, 6);
            loc_69[B_D4C0] = (char)1;
            p80 = SEG_STACK;
            p82 = (int)(unsigned)loc_46;
            t34 = far_b9755(p82, p80, B_D4BF);
            goto L6;
        }
        if (ax3 == 78) {
L6:
            di = 0;
        } else if (ax3 == 120) {
            p80 = (int)(unsigned)loc_46;
            p82 = W_E578;
            p84 = B_E577;
            p86 = TBL_905D[loc_3];
            p88 = B_8A9F;
            t30 = far_e1ee8(p88, p86, p84, p82, MK_FP(SEG_STACK, p80));
            di = B_D5DE;
        }
    }
    goto L1;
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9073(int p0, int p1, int p2, int p3) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b915e(long p0, long p1, int p2) { return 0; }
