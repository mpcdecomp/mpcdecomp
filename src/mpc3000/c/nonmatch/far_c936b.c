/* differs: 308 at +5, 800 bytes; 311 at +5, 793 bytes; 312 at +5, 795 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1508];
    int f_5e4;
    int f_5e6;
};
struct s2 {
    char pad_0[1524];
    int f_5f4;
};
struct g_TBL_D62B {
    int f_0;
};
extern char B_7B8D;
extern char B_7FCA;
extern char B_7FCB;
extern char B_7FCC;
extern unsigned char B_7FCD[];
extern char B_7FD1;
extern char B_8802;
extern char B_901B;
extern char B_D60A;
extern unsigned char TBL_8A93[];
extern struct g_TBL_D62B TBL_D62B;
extern unsigned char TBL_c964d[];
extern int W_7FC8;
extern int W_8A98;
extern int W_9045;
extern unsigned char W_D5F3[];
extern int W_D631;
extern int W_D633;
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern long far far_b1206(int, int);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b362e(void far *, char far *, void far *);
extern long far far_b3819();
extern long far far_b90dd(void);
extern long far far_de7ae(int, int, int);
extern int far far_de88f(int);
extern long far far_e15e2(void);
extern long far far_e7069(void);
extern long far far_e70e6(void);
extern long far far_eb6bd(int, int, int);
extern long far far_eb86b(long, unsigned char near *);
extern long far far_ec03b(int);
extern long far fn_c9682(void);
extern long far fn_c9a5b(void);
extern long far fn_ca373(void);

long far far_c936b(void)
{
    char loc_4[4];
    int ax;
    unsigned int ax10;
    struct s1 near *ax11;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int cx;
    int di;
    int dx;
    int dx2;
    int dx3;
    int p14;
    int p16;
    int p18;
    int p20;
    int si;
    struct s2 near *si2;
    long t1;
    int t10;
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
    int t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    int t27;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_ec03b(0x65f2);
    ax = (int)far_e7069();
    if (B_901B < 0) {
        ax2 = (int)far_e15e2();
    }
    si = B_7FCA * (B_7FCB + 1);
    *(int *)((char *)&loc_4 + 0) = (int)fn_ca373();
    t2 = far_b3819(MK_FP(SEG_DATA, 0x65f8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 5, *(int *)(0x248 + (si << 1)), *(int *)(0x252 + (si << 1)));
    far_b1f96();
    t3 = far_b362e(MK_FP(SEG_DATA, 0x65ff), (char far *)&B_7FCC, MK_FP(SEG_DATA, 60));
    far_b1ad0(2);
    t4 = far_ec03b(0x660d);
    far_b1ad0(3);
    t5 = far_b362e(MK_FP(SEG_DATA, 0x661a), (char far *)&B_7FCA, MK_FP(SEG_DATA, 0x1fc));
    far_b1f96();
    t6 = far_b362e(MK_FP(SEG_DATA, 0x6623), (char far *)&B_7FCB, MK_FP(SEG_DATA, 0x214));
    far_b1ad0(4);
    t7 = far_ec03b(0x662b);
    far_b1ad0(5);
    p16 = 2;
    p18 = 1;
    p20 = SEG_DATA;
    t8 = far_b3819(MK_FP(SEG_DATA, 0x6635), B_7FCD, p20, p18, p16, 4);
    t9 = far_b90dd();
    p14 = 0x6644;
    t10 = far_b1b05(p14);
    dx = UNDEF;
    ax9 = ((char)(t10 >> 8) << 8 | (unsigned char)0);
    while ((char)ax9 == 0) {
        for (;;) {
            t27 = far_b08f7();
            dx = UNDEF;
            loc_4[3] = (char)t27;
            if ((char)t27 == 0) {
                B_8802 = (char)0;
                ax10 = B_7B8D;
                if (ax10 > 3) {
                    continue;
                }
                switch ((unsigned int)(unsigned)(TBL_c964d + (ax10 << 1))) {
                case 0:
                    p18 = B_7FCA;
                    p20 = *(int *)((char *)&loc_4 + 0);
                    t20 = far_de7ae(p20, p18, B_7FCB);
                    p16 = (int)t20;
                    t21 = far_de88f(p16);
                    si = t21;
                    if (B_7FCC == 0) {
                        W_7FC8 = si;
                    } else {
                        W_8A98 = si;
                        B_8802 = (char)0;
                    }
                    t22 = far_e70e6();
                    p14 = 0xc91d;
                    t23 = fn_ca373();
                    *(int *)((char *)&loc_4 + 0) = (int)t23;
                    t24 = far_b1073();
                    continue;
                case 1:
                    t17 = far_e70e6();
                    p14 = 0xc91d;
                    t18 = fn_ca373();
                    *(int *)((char *)&loc_4 + 0) = (int)t18;
                    t19 = far_b1073();
                    continue;
                case 2:
                case 3:
                    di = B_7FCB;
                    ax11 = (struct s1 near *)(B_7FCB << 2);
                    dx2 = ax11->f_5e4;
                    W_D633 = ax11->f_5e6;
                    W_D631 = dx2;
                    cx = 0;
                    si2 = 0;
                    t11 = (long)(int)di * 6L;
                    dx3 = (int)t11;
                    do {
                        *(int *)((char *)&TBL_D62B + 0 + (unsigned int)(unsigned)si2) = *(int *)((char near *)si2 + 1524 + dx3);
                        si2 = (struct s2 near *)((char near *)si2 + 2);
                        cx = cx + 1;
                    } while ((unsigned int)(unsigned)si2 != 6);
                    t12 = fn_ca373();
                    *(int *)((char *)&loc_4 + 0) = (int)t12;
                    t13 = (long)(signed char)B_7FCA * (long)(int)(B_7FCB + 1);
                    si = (int)t13;
                    t14 = far_b1206(0, *(int *)(0x248 + (si << 1)));
                    t15 = far_b1073();
                    p14 = -0x762f;
                    p16 = SEG_DATA;
                    p18 = (int)(unsigned)TBL_8A93;
                    t16 = far_eb6bd(p18, p16, p14);
                    continue;
                }
            } else {
                break;
            }
        }
        if ((char)t27 != 120) {
            if ((char)t27 != 121) {
                ax9 = ((char)-((char)t27 < 0) << 8 | (unsigned char)1);
                continue;
            }
            t25 = fn_c9a5b();
            dx = (int)(t25 >> 16);
            loc_4[3] = (char)(int)t25;
            ax9 = ((char)((int)t25 >> 8) << 8 | (unsigned char)1);
            continue;
        }
        t26 = fn_c9682();
        dx = (int)(t26 >> 16);
        loc_4[3] = (char)(int)t26;
        ax9 = ((char)((int)t26 >> 8) << 8 | (unsigned char)1);
    }
    if (B_7FD1 != 2 || B_D60A == 0) {
        dx = (int)(far_eb86b(*(long *)((char *)&W_9045 + 0), W_D5F3) >> 16);
    }
    return ((long)dx << 16 | (unsigned)loc_4[3]);
}
long far fn_c9682(void) { return 0; }
long far fn_c9a5b(void) { return 0; }
long far fn_ca373(void) { return 0; }
