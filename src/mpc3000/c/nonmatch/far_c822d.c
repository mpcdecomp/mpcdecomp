/* differs: 308 at +5, 367 bytes; 311 at +5, 360 bytes; 312 at +5, 366 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_8A9A;
extern char B_8A9C;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D5DE;
extern char TBL_905C[];
extern char TBL_905D[];
extern char TBL_905E[];
extern void far far_b05a7(void);
extern int far far_b08f7(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b8f3e(int, int, int);
extern long far far_b9073(int, int, int, int);
extern long far far_b9102(void);
extern long far far_e51be(long, int, int);
extern long far far_ec03b(void far *);

long far far_c822d(void)
{
    int loc_2;
    int loc_4;
    char loc_5;
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
    int p14;
    int p16;
    int p18;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    int t14;
    long t2;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    loc_2 = 1;
    loc_4 = 2;
    far_b1aac();
    t1 = far_ec03b(MK_FP(SEG_DATA, 0x61fe));
    far_b1ad0(4, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x6211));
    t2 = far_b9102();
    far_b05a7();
    loc_5 = B_8A9F;
    far_b1ad0(1, 0);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x6239), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), 2, 1, 99, 8);
    t5 = far_b8f3e(loc_5, 1, 15);
    far_b1ad0(2, 0);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x6247), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 99, 0);
    t7 = far_b9073(loc_5, loc_2, 2, 15);
    far_b1ad0(3, 0);
    t8 = far_b3819(MK_FP(SEG_DATA, 0x6255), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2, 1, 99, 0);
    p14 = 3;
    p16 = loc_4;
    p18 = loc_5;
    ax7 = (int)far_b9073(p18, p16, p14, 15);
    dx = 0;
    for (;;) {
        if (dx == 0) {
            for (;;) {
                t14 = far_b08f7(1);
                dx = t14;
                if (t14 != 0) {
                    break;
                }
                ax12 = B_7B8D;
                if (ax12 != 0) {
                    if (ax12 != 1) {
                        if (ax12 != 2) {
                            continue;
                        }
                        p14 = 3;
                        p16 = loc_4;
                        p18 = loc_5;
                        t10 = far_b9073(p18, p16, p14, 15);
                        continue;
                    }
                    goto L1;
                }
                t11 = far_b8f3e(loc_5, 1, 15);
                t12 = far_b9073(loc_5, loc_4, 3, 15);
L1:
                p14 = 2;
                p16 = loc_2;
                p18 = loc_5;
                t13 = far_b9073(p18, p16, p14, 15);
            }
            if (dx != 120) {
                continue;
            }
            p14 = loc_5;
            p16 = SEG_DATA;
            p18 = (int)(unsigned)B_901B;
            t9 = far_e51be(((long)p16 << 16 | (unsigned)p18), p14, 0);
            ax8 = (int)t9;
            if (ax8 == -1) {
                dx = 0;
                continue;
            }
            ax9 = ((char)(ax8 >> 8) << 8 | (unsigned char)TBL_905D[loc_2]);
            ax10 = loc_2;
            if (ax10 < loc_4) {
                si = loc_2 + 1;
                if (si < loc_4) {
                    do {
                        ax10 = ((char)(ax10 >> 8) << 8 | (unsigned char)TBL_905D[si]);
                        TBL_905C[si] = (char)ax10;
                        si = si + 1;
                    } while (si < loc_4);
                }
                TBL_905C[loc_4] = (char)ax9;
            } else {
                ax11 = loc_2;
                if (ax11 > loc_4) {
                    si = loc_2 - 1;
                    while (si >= loc_4) {
                        ax11 = ((char)(ax11 >> 8) << 8 | (unsigned char)TBL_905D[si]);
                        TBL_905E[si] = (char)ax11;
                        si = si - 1;
                    }
                    TBL_905D[loc_4] = (char)ax9;
                }
            }
            B_8A9C = TBL_905D[B_8A9A];
            dx = B_D5DE;
            continue;
        }
        break;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
