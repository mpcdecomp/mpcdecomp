/* differs: 308 at +5, 341 bytes; 311 at +5, 336 bytes; 312 at +5, 334 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D5DD;
extern char B_D5DE;
extern int W_904B;
extern int W_9053;
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1f96();
extern long far far_b3819();
extern long far far_b3cdb();
extern long far far_b6cd3();
extern long far far_b8f3e();
extern long far far_b9102();
extern long far far_b9113();
extern int far far_e0031();
extern long far far_e1d5f();
extern int far far_e1e11();
extern long far far_e51be();
extern long far far_ebda4();

long far fn_b7558(void)
{
    int loc_2;
    int loc_4;
    char loc_5;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int dx;
    int p12;
    int p14;
    int p16;
    int p18;
    int p20;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    int t14;
    long t15;
    long t16;
    int t17;
    int t18;
    int t19;
    long t2;
    int t20;
    int t21;
    int t22;
    long t23;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)4;
    ax = W_9053;
    loc_2 = ax;
    loc_4 = ax;
    t1 = far_b9113((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), W_904B);
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x2fab));
    t3 = far_b1ad0(1, 0);
    loc_5 = B_8A9F;
    t4 = far_b3819(MK_FP(SEG_DATA, 0x2f58), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), 2, 1, 99, 8);
    t5 = far_b8f3e(loc_5, 1, 11);
    far_b1ad0(2, 0);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x2fb7), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 3, 1, 0x3e7, 0);
    far_b1f96(25);
    p12 = 0x3e7;
    p14 = 1;
    p16 = 3;
    p18 = SEG_STACK;
    p20 = (int)(unsigned)&loc_4;
    t7 = far_b3819(MK_FP(SEG_DATA, 0x2fc2), p20, p18, p16, p14, p12, 0);
    t8 = far_b9102();
    for (;;) {
        t14 = far_b08f7(1);
        dx = t14;
        if (t14 != 0) {
            break;
        }
        ax4 = B_7B8D;
        if (ax4 != 0) {
            if (ax4 != 1 && ax4 != 2) {
                continue;
            }
            goto L1;
        }
        t9 = far_b8f3e(loc_5, 1, 11);
        t10 = far_e51be((unsigned char far *)B_901B, loc_5, 1);
L1:
        p12 = SEG_STACK;
        p14 = (int)(unsigned)&loc_4;
        p16 = SEG_STACK;
        p18 = (int)(unsigned)&loc_2;
        p20 = 0xb702;
        t11 = far_b9113(((long)p16 << 16 | (unsigned)p18), ((long)p12 << 16 | (unsigned)p14), W_904B);
        t12 = far_b1073(1);
        t13 = far_b1073(2);
    }
    if (dx == 120) {
        if (W_904B <= 0) {
            dx = B_D5DE;
        } else if (loc_4 - loc_2 + 1 >= W_904B) {
            t15 = far_b3cdb(102, 3, 31);
            t16 = far_b9102();
            dx = (int)far_ebda4(1);
            if (dx == 120) {
                t17 = far_b1ad0(7, 0);
                t18 = far_b1b05(MK_FP(SEG_DATA, 0x2fcc));
                t19 = far_e0031((unsigned char far *)B_901B);
                t20 = far_e1e11(B_8A9F);
                dx = B_D5DE;
            }
        } else {
            t21 = far_b1ad0(7, 0);
            t22 = far_b1b05(MK_FP(SEG_DATA, 0x2fe2));
            t23 = far_e1d5f(loc_2, loc_4 + 1);
            dx = B_D5DE;
        }
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9102(void) { return 0; }
long far far_b9113(int far *p0, int far *p1, int p2) { return 0; }
