/* differs: 308 at +5, 988 bytes; 311 at +5, 987 bytes; 312 at +5, 988 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_83B6;
extern char B_83B7;
extern char B_8A9A;
extern unsigned char B_901B[];
extern char B_9561;
extern char B_9562;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_b95ea[];
extern int W_904B;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern void far far_b05a7(void);
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern int far far_b1ad0(int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b362e(int, int, long, void far *);
extern long far far_b3819(void far *, char far *, int, int, int);
extern long far far_b38d8(char near *);
extern long far far_b39a2(void far *, int near *);
extern long far far_b3b9f(void);
extern long far far_b6cd3(int);
extern long far far_b8f3e(int, int);
extern long far far_b9073(int, int, int);
extern long far far_b90dd(void);
extern long far far_b915e(long, long);
extern long far far_b9f33(void far *);
extern long far far_b9fbd(int, int, int, int, long, int);
extern int far far_c036b(void);
extern long far far_e51be(unsigned char far *, int);
extern long far far_e7341(int, int, int, int);
extern long far fn_b95f6(void);
extern long far fn_b96dc(void);
extern int far fn_b9817(void);
extern long far fn_b9a31(void);

int far far_b9205(void)
{
    char loc_6[6];
    char loc_7;
    char loc_8;
    char loc_9;
    char loc_4a[65];
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    int di;
    int flags;
    int p84;
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
    int t13;
    long t14;
    long t15;
    int t16;
    long t17;
    long t18;
    int t19;
    int t2;
    int t20;
    int t21;
    int t22;
    long t23;
    int t24;
    long t25;
    int t26;
    int t27;
    int t28;
    int t29;
    int t3;
    int t30;
    long t31;
    long t32;
    long t33;
    int t34;
    long t35;
    int t36;
    long t37;
    long t38;
    long t39;
    int t4;
    long t40;
    long t41;
    long t42;
    long t43;
    long t44;
    long t45;
    long t46;
    int t47;
    int t48;
    int t49;
    int t5;
    long t50;
    long t6;
    long t7;
    int t8;
    long t9;

    p84 = 0x38d3;
    t1 = far_b6cd3(p84);
    W_9480 = 1;
    W_947E = 0x100;
    W_947C = W_904B + 1;
    W_947A = 0x100;
    t2 = far_c036b();
    loc_8 = (char)t2;
    ax = ((char)(t2 >> 8) << 8 | (unsigned char)B_8A9A);
    loc_9 = (char)ax;
    ax2 = TBL_90C1[TBL_905D[(char)ax]] & 4;
    *(int *)((char *)&loc_6 + 4) = ax2;
    *(int *)((char *)&loc_6 + 0) = ax2;
    si = 1;
    loc_7 = B_83B7;
    di = 0;
L1:
    if (di == 0) {
        if (si != 0) {
            si = 0;
            far_b05a7();
            t4 = fn_b9817();
            *(int *)((char *)&loc_6 + 2) = t4;
            t5 = far_b1ad0(1);
            t6 = far_b3819(MK_FP(SEG_DATA, 0x38d9), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 2, 1, 99);
            t7 = far_b8f3e(loc_8, 1);
            t8 = far_b1ad0(2);
            p96 = 0x38e0;
            t9 = far_b3819(MK_FP(SEG_DATA, p96), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), 2, 0, 99);
            t10 = far_b9073(loc_8, loc_9, 2);
            t11 = far_b1f96();
            t12 = far_b1b05(0x38e7);
            t13 = far_b1ad0(3);
            t14 = far_b39a2(MK_FP(SEG_DATA, 0x38f1), &W_947E);
            t15 = far_b39a2(MK_FP(SEG_DATA, 0x38f8), &W_947A);
            t16 = far_b1ad0(4);
            p86 = 4;
            p88 = SEG_DATA;
            p90 = (int)(unsigned)&B_83B6;
            p92 = SEG_DATA;
            p94 = 0x38fa;
            t17 = far_b362e(p94, p92, ((long)p88 << 16 | (unsigned)p90), MK_FP(SEG_DATA, p86));
            t18 = far_b38d8(&loc_7);
            if (B_83B6 == 0) {
                t19 = far_b1ad0(4);
                t20 = far_b1f96();
            }
            t21 = far_b1ad0(5);
            if (*(int *)((char *)&loc_6 + 2) != 0) {
                if (loc_9 == 0) {
                    t22 = far_b1b05(0x3901);
                } else {
                    *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 4);
                    p86 = (int)(unsigned)loc_4a;
                    p88 = 0xb91f;
                    t23 = far_b9f33(MK_FP(SEG_STACK, p86));
                }
            }
            t24 = far_b1f96();
            t25 = far_b90dd();
            p84 = 0x390b;
            t26 = far_b1b05(p84);
        }
        for (;;) {
            ax3 = far_b08f7();
            di = ax3;
            if (ax3 == 0) {
                ax4 = B_7B8D;
                if (ax4 <= 5) {
                    switch ((unsigned int)(unsigned)(TBL_b95ea + (ax4 << 1))) {
                    case 0:
                        if (B_9562 != 0) {
                            t34 = far_b1af9();
                            t35 = far_b3b9f();
                            t36 = far_b1aff();
                            loc_8 = B_9561;
                            t37 = far_b1073();
                        } else {
                            t38 = far_b8f3e(loc_8, 1);
                            t39 = far_e51be((unsigned char far *)B_901B, loc_8);
                            p84 = SEG_DATA;
                            p86 = (int)(unsigned)&W_947A;
                            p88 = SEG_DATA;
                            p90 = (int)(unsigned)&W_947E;
                            t40 = far_b915e(((long)p88 << 16 | (unsigned)p90), ((long)p84 << 16 | (unsigned)p86));
                            t41 = far_b1073();
                            t42 = far_b1073();
L2:
                            ax5 = TBL_90C1[TBL_905D[loc_9]] & 4;
                            *(int *)((char *)&loc_6 + 4) = ax5;
                            *(int *)((char *)&loc_6 + 0) = ax5;
                            si = 1;
                        }
                        break;
                    case 1:
                        goto L2;
                    case 2:
                    case 3:
                        p84 = SEG_DATA;
                        p86 = (int)(unsigned)&W_947A;
                        p88 = SEG_DATA;
                        p90 = (int)(unsigned)&W_947E;
                        t31 = far_b915e(((long)p88 << 16 | (unsigned)p90), ((long)p84 << 16 | (unsigned)p86));
                        t32 = far_b1073();
                        t33 = far_b1073();
                        break;
                    case 4:
                        if (B_83B6 == 0) {
                            p84 = 4;
                            t29 = far_b1ad0(p84);
                            t30 = far_b1f96();
                        }
                        si = 1;
                        break;
                    case 5:
                        if (B_83B6 == 0) {
                            p84 = 4;
                            t27 = far_b1ad0(p84);
                            t28 = far_b1f96();
                            loc_7 = B_83B7;
                        } else {
                            B_83B7 = loc_7;
                        }
                        si = 1;
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
    return di;
L3:
L4:
    if (si == 0) {
        ax6 = di;
        flags = ax6 - 120;
        if (!CC("==", flags)) {
            if (!CC(">", flags)) {
                if (ax6 != 68 && ax6 != 78) {
                    if (ax6 == 117) {
                        t43 = fn_b96dc();
                        di = (int)t43;
                    }
                } else if (*(int *)((char *)&loc_6 + 2) != 0 && loc_9 != 0) {
                    p84 = (int)(unsigned)loc_6;
                    p86 = SEG_STACK;
                    p88 = (int)(unsigned)loc_4a;
                    p90 = *(int *)((char *)&loc_6 + 4);
                    p92 = 6;
                    p94 = 5;
                    p96 = di;
                    p98 = 0xb91f;
                    t44 = far_b9fbd(p96, p94, p92, p90, ((long)p86 << 16 | (unsigned)p88), p84);
                    di = (int)t44;
                } else {
                    di = 0;
                }
            } else if (ax6 != 121) {
                if (ax6 == 122) {
                    t45 = fn_b95f6();
                    di = (int)t45;
                }
            } else {
                t46 = fn_b9a31();
                di = (int)t46;
            }
        } else {
            t47 = far_b1ad0(7);
            t48 = far_b1b05(0x3934);
            t49 = far_b1f96();
            p84 = B_83B6;
            p86 = SEG_STACK;
            p88 = (int)(unsigned)loc_4a;
            p90 = loc_9;
            t50 = far_e7341(p90, p88, p86, p84);
            di = 77;
        }
    }
    goto L1;
}
long far far_b9f33(void far *p0) { return 0; }
long far far_b9fbd(int p0, int p1, int p2, int p3, long p4, int p5) { return 0; }
long far fn_b95f6(void) { return 0; }
long far fn_b96dc(void) { return 0; }
int far fn_b9817(void) { return 0; }
long far fn_b9a31(void) { return 0; }
