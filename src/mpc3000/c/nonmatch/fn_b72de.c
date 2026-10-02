/* differs: 308 at +5, 635 bytes; 311 at +5, 632 bytes; 312 at +5, 632 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8287;
extern char B_8288;
extern char B_8A9F;
extern char B_901B;
extern char B_D5DD;
extern char B_D5DE;
extern int W_8281;
extern int W_904B;
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b3b9f();
extern long far far_b6cd3();
extern long far far_b8f3e();
extern long far far_b9102();
extern int far far_deee8();
extern long far far_e15e2();
extern long far far_e3ad2();
extern long far far_e51be();

long far fn_b72de(void)
{
    unsigned char loc_1;
    int loc_4;
    int loc_6;
    int loc_8;
    char loc_11[9];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int dx;
    int p24;
    int p26;
    int p28;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    int t18;
    long t19;
    int t2;
    long t20;
    long t21;
    long t22;
    long t3;
    long t4;
    long t5;
    int t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)3;
    loc_8 = 1;
    loc_6 = 1;
    if (W_904B >= 0x3e7) {
        loc_6 = 0;
    }
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2f46));
    t2 = far_b1ad0(1, 0);
    loc_11[0] = B_8A9F;
    t3 = far_b3819(MK_FP(SEG_DATA, 0x2f58), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_11), 2, 1, 99, 8);
    t4 = far_b8f3e(loc_11[0], 1, 11);
    far_b1ad0(2, 0);
    t5 = far_b3819(MK_FP(SEG_DATA, 0x2f62), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 3, 0, 0x3e7, 0);
    t6 = far_b1ad0(3, 0);
    loc_4 = B_8287;
    t7 = far_b3819(MK_FP(SEG_DATA, 0x2f72), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2, 1, 31, 8);
    loc_1 = B_8288;
    t8 = far_b362e(MK_FP(SEG_DATA, 0x2f83), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), MK_FP(SEG_DATA, 0x5c4), 2);
    far_b1ad0(4, 0);
    p24 = 0x3e7;
    p26 = 1;
    p28 = 3;
    t9 = far_b3819(MK_FP(SEG_DATA, 0x2f85), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), p28, p26, p24, 0);
    t10 = far_b9102();
    for (;;) {
        ax3 = far_b08f7(1);
        dx = ax3;
        if (ax3 == 0) {
            ax4 = B_7B8D;
            if (ax4 != 0) {
                if (ax4 != 1) {
                    if (ax4 != 4) {
                        continue;
                    }
                    goto L1;
                }
                goto L2;
            }
            t11 = far_b8f3e(loc_11[0], 1, 11);
            p24 = loc_11[0];
            p26 = SEG_DATA;
            p28 = (int)(unsigned)&B_901B;
            t12 = far_e51be(((long)p26 << 16 | (unsigned)p28), p24, 1);
            loc_4 = B_8287;
            t13 = far_b1073(2);
            loc_1 = B_8288;
            t14 = far_b1073(3);
L2:
            if (loc_6 + W_904B > 0x3e7) {
                loc_6 = 0x3e7 - W_904B;
            }
            t15 = far_b1073(1);
L1:
            if (loc_8 > W_904B) {
                loc_8 = W_904B + 1;
            }
            t16 = far_b1073(4);
            continue;
        }
        break;
    }
    if (dx == 120) {
        if (loc_6 != 0) {
            t17 = far_b1ad0(7, 0);
            t18 = far_b1b05(MK_FP(SEG_DATA, 0x2f98));
            t19 = far_e51be((char far *)&B_901B, B_8A9F, 0);
            if (B_901B < 0) {
                *(int *)((char *)&loc_11 + 7) = B_8287;
                *(int *)((char *)&loc_11 + 5) = B_8288;
                *(int *)((char *)&loc_11 + 3) = W_8281;
                B_8287 = *(char *)((char *)&loc_4 + 0);
                B_8288 = loc_1;
                W_8281 = loc_6;
                t20 = far_e15e2(B_8A9F);
                B_8287 = loc_11[7];
                B_8288 = loc_11[5];
                W_8281 = *(int *)((char *)&loc_11 + 3);
            } else {
                t21 = far_e3ad2(loc_6, loc_8, loc_4, 4 << loc_1);
                *(int *)((char *)&loc_11 + 1) = (int)t21;
                if ((int)t21 < 0) {
                    t22 = far_b3b9f((int)t21);
                }
            }
            ax5 = far_deee8((char far *)&B_901B, loc_8);
        }
        dx = B_D5DE;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9102(void) { return 0; }
