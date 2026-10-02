/* differs: 308 at +5, 699 bytes; 311 at +5, 702 bytes; 312 at +5, 704 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8A9F;
extern char B_9469;
extern char B_946B;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char TBL_b79dc[];
extern int W_904B;
extern int W_9466;
extern int W_946C;
extern int W_946E;
extern int W_9470;
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1f96();
extern long far far_b3819();
extern long far far_b3b9f();
extern long far far_b6cd3();
extern long far far_b8f3e();
extern long far far_b9102();
extern long far far_b9113();
extern long far far_e0e31();
extern long far far_e49dd();
extern long far far_ec03b();
extern long far fn_b8379();

long far fn_b7743(void)
{
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
    unsigned int ax9;
    int di;
    int dx;
    int dx2;
    int dx3;
    int p12;
    int p14;
    int p16;
    int p18;
    int p20;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    long t21;
    long t22;
    long t23;
    int t24;
    int t25;
    int t26;
    long t27;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)5;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2cb2));
    ax = ((char)((int)t1 >> 8) << 8 | (unsigned char)B_8A9F);
    B_9469 = (char)ax;
    B_946B = (char)ax;
    W_9466 = 1;
    W_9470 = 1;
    ax2 = W_904B;
    W_946E = ax2;
    W_946C = ax2 + 1;
    di = W_904B;
    si = di;
    t2 = far_b9113((int far *)&W_9470, (int far *)&W_946E, si);
    t3 = far_b3819(MK_FP(SEG_DATA, 0x2cc1), (char far *)&B_946B, 2, 1, 99, 8);
    t4 = far_b8f3e(B_946B, 1, 6);
    far_b1ad0(2, 0);
    t5 = far_b3819(MK_FP(SEG_DATA, 0x2c75), (int far *)&W_9470, 3, 1, 0x3e7, 0);
    far_b1f96(25);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x2c80), (int far *)&W_946E, 3, 1, 0x3e7, 0);
    far_b1ad0(3, 0);
    t7 = far_ec03b(MK_FP(SEG_DATA, 0x2cc6));
    far_b1ad0(4, 0);
    t8 = far_b3819(MK_FP(SEG_DATA, 0x2cc1), (char far *)&B_9469, 2, 1, 99, 8);
    t9 = far_b8f3e(B_9469, 4, 6);
    far_b1f96(25);
    t10 = far_b3819(MK_FP(SEG_DATA, 0x2cd3), (int far *)&W_946C, 3, 1, 0x3e7, 0);
    far_b1ad0(5, 0);
    p12 = 0x3e7;
    p14 = 1;
    p16 = 3;
    p18 = SEG_DATA;
    p20 = (int)(unsigned)&W_9466;
    t11 = far_b3819(MK_FP(SEG_DATA, 0x2cdf), p20, p18, p16, p14, p12, 0);
    t12 = far_b9102();
    for (;;) {
        t24 = far_b08f7(1);
        dx = t24;
        if (t24 == 0) {
            ax9 = B_7B8D;
            if (ax9 > 5) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_b79dc + (ax9 << 1))) {
            case 0:
                t19 = far_e49dd(B_946B);
                si = (int)t19;
                t20 = far_b8f3e(B_946B, 1, 6);
L1:
                p12 = SEG_DATA;
                p14 = (int)(unsigned)&W_946E;
                p16 = SEG_DATA;
                p18 = (int)(unsigned)&W_9470;
                p20 = 0xbdc0;
                t21 = far_b9113(((long)p16 << 16 | (unsigned)p18), ((long)p12 << 16 | (unsigned)p14), si);
                t22 = far_b1073(1);
                t23 = far_b1073(2);
                continue;
            case 1:
            case 2:
                goto L1;
            case 3:
                t16 = far_e49dd(B_9469);
                di = (int)t16;
                dx3 = (int)t16 + 1;
                if ((int)t16 + 1 < W_946C) {
                    W_946C = dx3;
                    t17 = far_b1073(4);
                }
                p12 = 4;
                p14 = B_9469;
                p16 = 0xbdc0;
                t18 = far_b8f3e(p14, p12, 6);
                continue;
            case 4:
                goto L2;
            case 5:
                p12 = W_946E;
                p14 = W_9470;
                p16 = SEG_DATA;
                p18 = (int)(unsigned)&W_9466;
                p20 = 0xbdc0;
                t13 = fn_b8379(((long)p16 << 16 | (unsigned)p18), p14, p12, si);
                t14 = far_b1073(5);
L2:
                dx2 = di + 1;
                if (di + 1 < W_946C) {
                    W_946C = dx2;
                    t15 = far_b1073(4);
                    continue;
                }
                continue;
            }
        } else {
            break;
        }
    }
    if (dx == 120) {
        t25 = far_b1ad0(7, 0);
        t26 = far_b1b05(MK_FP(SEG_DATA, 0x2ce7));
        t27 = far_e0e31();
        loc_2 = (int)t27;
        if ((int)t27 < 0) {
            ax10 = (int)far_b3b9f((int)t27);
        }
        dx = B_D5DE;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b9113(int far *p0, int far *p1, int p2) { return 0; }
long far fn_b8379(long p0, int p1, int p2, int p3) { return 0; }
