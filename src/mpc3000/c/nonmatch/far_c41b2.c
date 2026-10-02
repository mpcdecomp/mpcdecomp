/* differs: 308 absent; 311 at +5, 972 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct g_B_F21F {
    char pad_0[4];
    char f_4;
};
struct g_B_F21A {
    char pad_0[4];
    char f_4;
};
extern char B_537A;
extern char B_537B;
extern char B_537C;
extern char B_83BA;
extern char B_83BB;
extern char B_83BC;
extern char B_D4BB;
extern struct g_B_F21A B_F21A;
extern struct g_B_F21F B_F21F;
extern int W_537D;
extern int W_83BE;
extern int W_D4B2;
extern long far far_d9e5b(void);
extern long far fn_c3b74(int, int, int, int);
extern void far fn_c3fb9(int, struct g_B_F21F far *);
extern long far fn_c403f(int, int, struct g_B_F21F far *);
extern long far fn_c4174(void);
extern long far fn_c4643(int, int, int);
long far fn_c3b74(int p0, int p1, int p2, int p3) { return 0; }
void far fn_c3fb9(int p0, struct g_B_F21F far *p1) { }
long far fn_c403f(int p0, int p1, struct g_B_F21F far *p2) { return 0; }
long far fn_c4174(void) { return 0; }

long far far_c41b2(void)
{
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    long loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int cx;
    int dx;
    int dx2;
    int es;
    int es2;
    int p22;
    int p24;
    int p26;
    int p28;
    int p30;
    unsigned int si;
    unsigned int si2;
    long t1;
    int t10;
    int t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    int t7;
    int t8;
    long t9;

    loc_2 = 0xa283 /* SEG_A28F */;
    *(int *)((char *)&loc_4 + 0) = 0;
    if (B_537B == 0) {
        ax = 1;
    } else {
        ax = 2;
    }
    loc_e = ax;
    if (B_537A != 0) {
        if (B_537A > 1) {
            goto L1;
        }
        dx = 132;
        if ((inp(dx) & 64) == 0) {
            goto L2;
        }
L1:
        ax9 = B_537A;
        if (ax9 == 1) {
            t16 = fn_c4643(0, B_83BA, 0);
            t17 = fn_c4174();
            ax9 = (int)t17;
            dx = (int)(t17 >> 16);
        } else if (ax9 == 25) {
            t15 = fn_c4643(1, B_83BA, 0);
            ax9 = (int)t15;
            dx = (int)(t15 >> 16);
        } else if (ax9 == 28) {
            if ((inp(132) & 64) == 0) {
                t14 = fn_c4643(1, B_83BA, B_83BB);
                ax9 = (int)t14;
                dx = (int)(t14 >> 16);
                B_537A = (char)0;
            } else {
                t13 = fn_c4643(0, B_83BA, 0);
                ax9 = (int)t13;
                dx = (int)(t13 >> 16);
                B_537A = (char)1;
            }
        }
        B_537A = (char)(B_537A + 1);
        return ((long)dx << 16 | (unsigned)ax9);
    }
L2:
    if (B_537C != 2) {
        goto L3;
    }
    t1 = (long)(int)W_83BE * 10L;
    if ((int)t1 <= W_D4B2) {
        B_537C = (char)3;
        return t1;
    }
L3:
    _disable();
    outp(-0x3fff, (char)2);
    ax2 = 0x2400 - (inpw(-0x3ffe) & -2);
    _enable();
    t2 = far_d9e5b();
    cx = UNDEF;
    dx2 = (int)(t2 >> 16);
    loc_6 = dx2;
    loc_8 = (int)t2;
    loc_a = 0;
    si = W_537D;
    while (si != ax2) {
        if (si >= 0x2400) {
            si = 0;
        }
        es2 = (int)(loc_4 >> 16);
        bx2 = (int)loc_4 + (si << 1);
        ax7 = *(int far *)MK_FP(es2, bx2);
        dx2 = -(ax7 < 0);
        if ((ax7 ^ dx2) - dx2 > loc_a) {
            ax8 = *(int far *)MK_FP(es2, bx2);
            dx2 = -(ax8 < 0);
            loc_a = (ax8 ^ dx2) - dx2;
            if (B_537C == 1) {
                t3 = (long)(signed char)B_83BC * 0x147L;
                dx2 = (int)(t3 >> 16);
                if ((int)t3 <= loc_a) {
                    p22 = loc_6;
                    p24 = loc_8;
                    p26 = ax2;
                    p28 = si;
                    p30 = 0xc2d2;
                    t4 = fn_c3b74(p28, p26, p24, p22);
                    cx = UNDEF;
                    dx2 = (int)(t4 >> 16);
                }
            }
        }
        si = si + loc_e;
    }
    if (B_537B != 0) {
        loc_c = 0;
        si2 = W_537D + 1;
        while (ax2 + 1 != si2) {
            if (si2 >= 0x2400) {
                si2 = 1;
            }
            es = (int)(loc_4 >> 16);
            bx = (int)loc_4 + (si2 << 1);
            ax3 = *(int far *)MK_FP(es, bx);
            dx2 = -(ax3 < 0);
            if ((ax3 ^ dx2) - dx2 > loc_c) {
                ax4 = *(int far *)MK_FP(es, bx);
                dx2 = -(ax4 < 0);
                loc_c = (ax4 ^ dx2) - dx2;
                if (B_537C == 1) {
                    t5 = (long)(signed char)B_83BC * 0x147L;
                    dx2 = (int)(t5 >> 16);
                    if ((int)t5 <= loc_c) {
                        p22 = loc_6;
                        p24 = loc_8;
                        p26 = ax2 + 1;
                        p28 = si2;
                        p30 = 0xc2d2;
                        t6 = fn_c3b74(p28, p26, p24, p22);
                        dx2 = (int)(t6 >> 16);
                    }
                }
            }
            si2 = si2 + loc_e;
        }
    }
    W_537D = ax2;
    ax5 = B_D4BB;
    if (ax5 == 0) {
        fn_c3fb9(loc_a, (struct g_B_F21F far *)&B_F21F);
        dx2 = UNDEF;
        t8 = __repe_cmps1((struct g_B_F21F far *)&B_F21F, MK_FP(SEG_DATA, -0x10dc), 3);
        ax5 = (unsigned char)*(char *)(0xffff + UNDEF) - (unsigned char)*(char *)(0xffff + UNDEF);
        if (ax5 != 0) {
            if (B_83BA != 1) {
                ax6 = 4;
            } else {
                ax6 = 5;
            }
            t9 = fn_c403f(ax6, 6, (struct g_B_F21F far *)&B_F21F);
            ax5 = (int)t9;
            dx2 = (int)(t9 >> 16);
            __movs2(MK_FP(SEG_DATA, -0x10dc), (struct g_B_F21F far *)&B_F21F, 4);
            *(char *)(0xef28) = B_F21F.f_4;
        }
        if (B_537B != 0) {
            fn_c3fb9(loc_c, (struct g_B_F21A far *)&B_F21A);
            dx2 = UNDEF;
            t11 = __repe_cmps1((struct g_B_F21A far *)&B_F21A, MK_FP(SEG_DATA, -0x10d7), 3);
            ax5 = (unsigned char)*(char *)(0xffff + UNDEF) - (unsigned char)*(char *)(0xffff + UNDEF);
            if (ax5 != 0) {
                t12 = fn_c403f(5, 6, (struct g_B_F21A far *)&B_F21A);
                ax5 = (int)t12;
                dx2 = (int)(t12 >> 16);
                __movs2(MK_FP(SEG_DATA, -0x10d7), (struct g_B_F21A far *)&B_F21A, 4);
                *(char *)(0xef2d) = B_F21A.f_4;
            }
        }
    }
    return ((long)dx2 << 16 | (unsigned)ax5);
}
long far fn_c4643(int p0, int p1, int p2) { return 0; }
