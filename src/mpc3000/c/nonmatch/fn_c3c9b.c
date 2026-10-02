/* differs: 308 absent; 311 at +5, 523 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_5379;
extern char B_537B;
extern char B_537C;
extern char B_83B9;
extern char B_83BA;
extern char B_83BB;
extern char B_CEBF;
extern char B_F008;
extern char B_F21C;
extern char B_F221;
extern int W_537D;
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern int far far_b1b2b(char far *, char far *);
extern long far far_c41b2(void);
extern long far far_cc583(int);
extern int far far_cc60f(void);
extern long far far_cc62d(void);
extern long far far_cdcc2(void);
extern void far far_d9e1a(void);
extern long far far_ebda4(int);
extern long far fn_c3a13(void);
extern long far fn_c3ed1(void);
extern long far fn_c4174(void);
extern long far fn_c4439(int);
extern long far fn_c4643(int, int, int);
long far fn_c3a13(void) { return 0; }

long far fn_c3c9b(void)
{
    char loc_26[32];
    char loc_6;
    char loc_5;
    char loc_4[2];
    char loc_2;
    char loc_1;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int dx;
    int dx2;
    int si;
    int t1;
    long t10;
    long t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_CEBF = (char)0;
    far_d9e1a();
    B_F008 = (char)-1;
    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x53d4));
    dx = (int)(fn_c3a13() >> 16);
    __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26), 0x2020, 36);
    loc_4[0] = (char)0;
    if (B_F221 <= 32) {
        loc_26[B_F221] = (char)80;
    } else {
        loc_5 = (char)33;
        loc_6 = (char)80;
    }
    if (B_83BA != 1) {
        ax4 = 4;
    } else {
        ax4 = 5;
    }
    far_b1ad0(ax4, 6);
    ax6 = far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26));
    if (B_537B != 0) {
        __stos2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26), 0x2020, 36);
        loc_4[0] = (char)0;
        if (B_F21C <= 32) {
            loc_26[B_F21C] = (char)80;
        } else {
            loc_5 = (char)33;
            loc_6 = (char)80;
        }
        t2 = far_b1ad0(5, 6);
        ax7 = far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_26));
    }
    far_b1af9();
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x53fd));
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x544e));
    dx2 = (int)(far_cdcc2() >> 16);
    while (B_537C == 3) {
        t8 = far_ebda4(3);
        dx2 = (int)(t8 >> 16);
        si = (int)t8;
        if ((int)t8 == 120) {
            t5 = far_cc60f();
            if (t5 == 0) {
                t7 = far_cc583(B_5379);
                dx2 = (int)(t7 >> 16);
            } else {
                t6 = far_cc62d();
                dx2 = (int)(t6 >> 16);
            }
            si = 0;
            continue;
        }
        if ((int)t8 == 121) {
            goto L1;
        }
        if ((int)t8 != 122) {
            B_537C = (char)0;
            continue;
        }
        B_537C = (char)0;
        t3 = fn_c4174();
        _disable();
        outp(-0x3fff, (char)2);
        dx2 = -0x3ffe;
        t4 = inpw(dx2);
        W_537D = t4 & -2;
        W_537D = 0x2400 - W_537D;
        _enable();
        si = 0;
    }
    if (si == 0) {
        B_CEBF = (char)0;
        t10 = fn_c3ed1();
        t11 = fn_c4643(B_83B9, B_83BA, B_83BB);
        t12 = far_b1aff();
        t13 = far_b1ad0(7, 0);
        t14 = far_b1b05(MK_FP(SEG_DATA, 0x5359));
        t15 = far_b1ad0(loc_1, loc_2);
        dx2 = (int)(far_c41b2() >> 16);
        B_CEBF = (char)1;
    }
    return ((long)dx2 << 16 | (unsigned)si);
L1:
    t9 = fn_c4439(B_5379);
    B_537C = (char)4;
    return t9;
}
long far far_c41b2(void) { return 0; }
long far fn_c3ed1(void) { return 0; }
long far fn_c4174(void) { return 0; }
long far fn_c4439(int p0) { return 0; }
long far fn_c4643(int p0, int p1, int p2) { return 0; }
