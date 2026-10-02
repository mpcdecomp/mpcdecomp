/* differs: 308 at +5, 803 bytes; 311 at +5, 715 bytes; 312 at +5, 716 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7AC4;
extern unsigned char B_8435[];
extern char B_D5DD;
extern int W_7ACC;
extern long far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1b41(int, int);
extern long far far_b1d48(void far *, int);
extern long far far_b362e(void far *, unsigned char far *, void far *, int);
extern long far far_b3819(void far *, int far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_b9102(void);
extern void far far_d51e6(void);
extern void far far_d526f(int, int);
extern long far far_d5756(int);
extern long far far_d5801(void);
extern int far far_d78b2(void);
extern void far fn_b6f20(int, int, int far *);

void far fn_b6353(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int di;
    int dx;
    int si;
    long t1;
    long t10;
    int t11;
    long t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    long t2;
    long t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    int t26;
    int t27;
    int t28;
    long t29;
    long t3;
    int t30;
    long t31;
    int t32;
    long t33;
    int t34;
    long t35;
    long t36;
    long t37;
    int t38;
    int t39;
    long t4;
    int t40;
    long t41;
    int t42;
    long t43;
    int t44;
    long t45;
    long t46;
    long t5;
    int t6;
    int t7;
    int t8;
    long t9;

    B_D5DD = (char)95;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x29cd));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x29de));
    far_b1ad0(4, 0);
    t2 = far_b362e(MK_FP(SEG_DATA, 0x2a11), (unsigned char far *)B_8435, MK_FP(SEG_DATA, 0x22dc), 4);
    t3 = far_b90dd();
    ax4 = far_b1b05(MK_FP(SEG_DATA, 0x2a32));
    do {
        t4 = far_b08f7(1);
    } while ((int)t4 == 0);
    if ((int)t4 != 120) {
        goto L1;
    }
    B_D5DD = (char)97;
    t5 = far_b6cd3(MK_FP(SEG_DATA, 0x29cd));
    B_7AC4 = (char)(int)far_d5801();
    if (B_7AC4 != 1 && B_7AC4 != 2) {
        t6 = far_b1ad0(1, 0);
        t7 = far_b1b05(MK_FP(SEG_DATA, 0x2a40));
        t8 = far_b1ad0(1, 34);
        t9 = far_b1d48(MK_FP(SEG_DATA, 0x2ae6), W_7ACC);
        t10 = far_b90dd();
        t11 = far_b1b05(MK_FP(SEG_DATA, 0x2ae9));
        ax5 = far_d78b2();
        do {
            t12 = far_b08f7(2);
        } while ((int)t12 == 0);
        if ((int)t12 != 120) {
            if ((int)t12 != 121) {
                goto L1;
            }
            goto L2;
        }
        t13 = far_b1ad0(1, 0);
        t14 = far_b1b41(32, 200);
        t15 = far_b1ad0(3, 0);
        t16 = far_b1b05(MK_FP(SEG_DATA, 0x2af6));
        t17 = far_b1ad0(7, 0);
        t18 = far_b1b05(MK_FP(SEG_DATA, 0x2b19));
        far_d51e6();
        if (UNDEF != 0) {
            t20 = far_b3b9f(-175);
            return;
        }
L2:
        t21 = far_b6cd3(MK_FP(SEG_DATA, 0x29cd));
        B_D5DD = (char)96;
        t22 = far_d5756(W_7ACC);
        if ((int)(t22 >> 16) <= 0 && ((int)(t22 >> 16) != 0 || (int)t22 == 0)) {
            t23 = far_b3b9f(-175);
            return;
        }
        t24 = t22 << 6;
        t25 = t24 / 125L;
        si = (int)((t25 + 0x1f4L) / 0x3e8L);
        t26 = far_b1ad0(1, 0);
        t27 = far_b1b05(MK_FP(SEG_DATA, 0x2b31));
        loc_2 = 1;
        fn_b6f20((int)t22, (int)(t22 >> 16), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
        di = UNDEF;
        if (di == 0) {
            t29 = far_b3b9f(-175);
            return;
        }
        t30 = far_b1ad0(4, 27);
        t31 = far_b3819(MK_FP(SEG_DATA, 0x239f), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 26, 2);
        t32 = far_b1ad0(4, 27);
        t33 = far_b1d48(MK_FP(SEG_DATA, 0x2bcb), loc_2);
        t34 = far_b1ad0(5, 28);
        if (si > 0x30c) {
            si = 0x30c;
        }
        t35 = far_b1d48(MK_FP(SEG_DATA, 0x2bcf), si);
        t36 = far_b9102();
        for (;;) {
            t37 = far_b08f7(1);
            if ((int)t37 != 0) {
                break;
            }
            fn_b6f20((int)t22, (int)(t22 >> 16), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
            di = UNDEF;
            t43 = far_b1073(0);
            t44 = far_b1ad0(4, 27);
            t45 = far_b1d48(MK_FP(SEG_DATA, 0x2bcb), loc_2);
        }
        t38 = far_b1ad0(7, 0);
        t39 = far_b1b05(MK_FP(SEG_DATA, 0x2bd3));
        far_d526f(di, loc_2);
        dx = UNDEF;
        if (dx == 0) {
            dx = (int)far_d5801();
        }
        if (dx != 0) {
            t41 = far_b3b9f(-175);
        } else {
            B_7AC4 = (char)0;
        }
L1:
        return;
    }
    t46 = far_b3b9f(-184);
    return;
}
long far far_b6cd3(void far *p0) { return 0; }
void far fn_b6f20(int p0, int p1, int far *p2) { }
