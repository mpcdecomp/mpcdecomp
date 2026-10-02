/* differs: 308 at +5, 136 bytes; 311 at +5, 127 bytes; 312 at +5, 127 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern unsigned char B_8804;
extern char B_D5DE;
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3819(void far *, int far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b8f3e(int, int, int);
extern long far far_b9102(void);
extern int far far_d78b2(void);
extern long far far_e6006(void);
extern long far far_e611c(int, int);
extern long far far_e6fef(void);
extern long far fn_b49c4(int, int, int);
long far fn_b49c4(int p0, int p1, int p2) { return 0; }

long far fn_b4e71(void)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int dx;
    int p12;
    int p14;
    int p16;
    long t1;
    long t10;
    int t11;
    int t12;
    int t13;
    long t14;
    int t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e6fef();
    t2 = far_d78b2();
    loc_2 = B_8804;
    loc_4 = (int)far_e6006();
    t3 = far_b6cd3(MK_FP(SEG_DATA, 0x20fd));
    far_b1ad0(1, 0);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x2116), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 20, 8);
    t5 = fn_b49c4(loc_2, 1, 20);
    far_b1ad0(2, 6);
    p16 = 2;
    t6 = far_b3819(MK_FP(SEG_DATA, 0x2129), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), p16, 1, 99, 8);
    p14 = loc_4;
    t7 = far_b8f3e(p14, 2, 20);
    far_b1ad0(4, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x2136));
    far_b1ad0(5, 0);
    p12 = 0x2154;
    far_b1b05(MK_FP(SEG_DATA, p12));
    t8 = far_b9102();
    for (;;) {
        t11 = far_b08f7(1);
        dx = t11;
        if (t11 != 0) {
            break;
        }
        ax8 = B_7B8D;
        if (ax8 != 0) {
            if (ax8 != 1) {
                continue;
            }
            p12 = 2;
            p14 = loc_4;
            t9 = far_b8f3e(p14, p12, 20);
            continue;
        }
        p12 = 1;
        p14 = loc_2;
        p16 = 0xb3ef;
        t10 = fn_b49c4(p14, p12, 20);
    }
    if (dx == 120) {
        t12 = far_b1ad0(7, 0);
        t13 = far_b1b05(MK_FP(SEG_DATA, 0x217b));
        t14 = far_e611c(loc_2 - 1, loc_4);
        loc_6 = (int)t14;
        if ((int)t14 != 0) {
            ax7 = (int)far_b3b9f((int)t14);
        }
        dx = B_D5DE;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
