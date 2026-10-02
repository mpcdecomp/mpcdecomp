/* differs: 308 at +5, 699 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_7B8D;
extern char B_8A9A;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D4C0;
extern char B_D5DD;
extern char B_D5DE;
extern char B_E575;
extern char B_E576;
extern char TBL_905D[];
extern char TBL_90C1[];
extern unsigned char TBL_b8be1[];
extern int W_904B;
extern int W_947A;
extern int W_947C;
extern int W_947E;
extern int W_9480;
extern void far far_b05a7(void);
extern long far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1b41(int, int);
extern long far far_b1f96(int);
extern long far far_b3819();
extern long far far_b39a2(void far *, int far *);
extern long far far_b6cd3(void far *);
extern long far far_b8f3e(int, int, int);
extern long far far_b9045(int, int, int, int);
extern long far far_b9073(int, int, int, int);
extern long far far_b9102(void);
extern long far far_b915e(long, long, int);
extern long far far_deb78(int, int, int, int);
extern long far far_e51be(unsigned char far *, int, int);

void far fn_b88e1(void)
{
    char loc_6[3];
    char loc_3;
    int loc_2;
    int ax;
    unsigned int ax2;
    int di;
    int p16;
    int p18;
    int p20;
    int p22;
    int p24;
    int p26;
    int p28;
    int si;
    int t1;
    int t10;
    long t11;
    long t12;
    long t13;
    int t14;
    long t15;
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
    long t3;
    long t30;
    long t4;
    int t5;
    long t6;
    long t7;
    int t8;
    int t9;

    B_D5DD = (char)92;
    p16 = 0x2f60;
    ax = (int)far_b6cd3(MK_FP(SEG_DATA, p16));
    if (B_E575 == 0) {
        B_E575 = B_D4C0;
    }
    if (B_E576 == 0) {
        B_E576 = B_D4C0;
    }
    *(int *)((char *)&loc_6 + 0) = B_8A9F;
    loc_3 = B_8A9A;
    W_9480 = 1;
    W_947E = 0x100;
    W_947C = W_904B + 1;
    W_947A = 0x100;
    loc_2 = TBL_90C1[TBL_905D[B_8A9A]] & 4;
    si = 1;
    di = 0;
    for (;;) {
L1:
        if (di != 0) {
            break;
        }
        if (si != 0) {
            si = 0;
            far_b05a7();
            t2 = far_b1ad0(1, 0);
            t3 = far_b3819(MK_FP(SEG_DATA, 0x2dd4), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), 2, 1, 99, 8);
            t4 = far_b8f3e(*(int *)((char *)&loc_6 + 0), 1, 8);
            t5 = far_b1ad0(2, 0);
            p24 = (int)(unsigned)&loc_3;
            p26 = SEG_DATA;
            p28 = 0x2d19;
            t6 = far_b3819(p28, p26, MK_FP(SEG_STACK, p24), 2, 1, 99, 8);
            p18 = loc_3;
            p20 = *(int *)((char *)&loc_6 + 0);
            p22 = 0xbdc0;
            t7 = far_b9073(p20, p18, 2, 8);
            t8 = far_b1ad0(3, 0);
            if (loc_2 != 0) {
                t11 = far_b39a2(MK_FP(SEG_DATA, 0x2d20), (int far *)&W_947E);
                t12 = far_b39a2(MK_FP(SEG_DATA, 0x2d27), (int far *)&W_947A);
                t13 = far_b1f96(40);
                t14 = far_b1ad0(4, 0);
                t15 = far_b3819(MK_FP(SEG_DATA, 0x2f7c), (char far *)&B_E575, 2, 35, 98, 24);
                t16 = far_b9045(B_E575, 4, 15, 16);
                t17 = far_b1ad0(5, 0);
                p24 = (int)(unsigned)&B_E576;
                p26 = SEG_DATA;
                p28 = 0x2f8a;
                t18 = far_b3819(p28, p26, MK_FP(SEG_DATA, p24), 2, 35, 98, 24);
                p16 = 15;
                p18 = 5;
                p20 = B_E576;
                p22 = 0xbdc0;
                t19 = far_b9045(p20, p18, p16, 16);
            } else {
                t9 = far_b1b05(MK_FP(SEG_DATA, 0x2f98));
                p16 = 32;
                t10 = far_b1b41(p16, 80);
            }
            t20 = far_b9102();
        }
        for (;;) {
            t30 = far_b08f7(1);
            di = (int)t30;
            if ((int)t30 != 0) {
                break;
            }
            ax2 = B_7B8D;
            if (ax2 <= 5) {
                switch ((unsigned int)(unsigned)(TBL_b8be1 + (ax2 << 1))) {
                case 0:
                    t23 = far_b8f3e(*(int *)((char *)&loc_6 + 0), 1, 8);
                    t24 = far_e51be((unsigned char far *)B_901B, *(int *)((char *)&loc_6 + 0), 1);
L2:
                    loc_2 = TBL_90C1[TBL_905D[loc_3]] & 4;
                    t25 = far_b9073(*(int *)((char *)&loc_6 + 0), loc_3, 2, 8);
                    si = 1;
L3:
                    p16 = SEG_DATA;
                    p18 = (int)(unsigned)&W_947A;
                    p20 = SEG_DATA;
                    p22 = (int)(unsigned)&W_947E;
                    p24 = 0xbdc0;
                    t26 = far_b915e(((long)p20 << 16 | (unsigned)p22), ((long)p16 << 16 | (unsigned)p18), B_8A9F);
                    t27 = far_b1073(2);
                    t28 = far_b1073(3);
                    break;
                case 1:
                    goto L2;
                case 2:
                case 3:
                    goto L3;
                case 4:
                    p16 = 15;
                    p18 = 4;
                    p20 = B_E575;
                    p22 = 0xbdc0;
                    t22 = far_b9045(p20, p18, p16, 16);
                    break;
                case 5:
                    p16 = 15;
                    p18 = 5;
                    p20 = B_E576;
                    p22 = 0xbdc0;
                    t21 = far_b9045(p20, p18, p16, 16);
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
    return;
L4:
L5:
    if (si == 0) {
        if (di == 120) {
            p16 = B_E575;
            p18 = TBL_905D[loc_3];
            p20 = B_8A9F;
            t29 = far_deb78(p20, p18, p16, B_E576);
            di = B_D5DE;
        }
    }
    goto L1;
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9045(int p0, int p1, int p2, int p3) { return 0; }
long far far_b9073(int p0, int p1, int p2, int p3) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b915e(long p0, long p1, int p2) { return 0; }
