/* differs: 308 at +5, 1058 bytes; 311 at +5, 1074 bytes; 312 at +5, 1076 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1524];
    int f_5f4;
};
struct s2 {
    char pad_0[1508];
    int f_5e4;
    int f_5e6;
};
struct g_TBL_D62B {
    int f_0;
};
extern char B_7B8D;
extern char B_7B8E;
extern char B_7FCB;
extern char B_7FCE;
extern unsigned char B_7FCF[];
extern unsigned char B_7FD0[];
extern char B_7FD1;
extern unsigned char B_7FD2[];
extern char B_7FD3;
extern unsigned char B_7FD4[];
extern unsigned char B_8A94;
extern unsigned char B_8A95[];
extern unsigned char B_8A96[];
extern unsigned char B_8A97[];
extern char B_D5DD;
extern char TBL_662C[];
extern unsigned char TBL_8A93[];
extern struct g_TBL_D62B TBL_D62B;
extern unsigned char TBL_c9a43[];
extern unsigned char TBL_c9a51[];
extern int W_D60E;
extern int W_D631;
extern int W_D633;
extern void far far_b05a7();
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b130a();
extern int far far_b1aac();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1b41();
extern int far far_b1f96();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b90dd();
extern long far far_d7801();
extern long far far_eb6bd();
extern long far far_eb7cc();
extern long far fn_c9655();
extern long far fn_ca16c();
long far fn_c9655(void) { return 0; }

long far fn_c9682(void)
{
    char loc_2[2];
    int loc_4;
    int ax;
    int ax2;
    unsigned int ax3;
    int ax4;
    unsigned int ax5;
    int ax6;
    struct s2 near *ax7;
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
    struct s1 near *si;
    int t1;
    int t10;
    long t11;
    long t12;
    int t13;
    long t14;
    long t15;
    long t16;
    int t17;
    long t18;
    long t19;
    long t2;
    long t20;
    long t21;
    long t22;
    long t23;
    int t24;
    int t25;
    long t26;
    int t27;
    long t28;
    int t29;
    long t3;
    int t30;
    int t31;
    int t32;
    long t33;
    int t34;
    int t35;
    int t36;
    long t37;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    far_b05a7();
    far_b1aac();
    ax2 = far_b1b05(MK_FP(SEG_DATA, 0x5fc5));
    dx = UNDEF;
    loc_4 = 0;
    loc_2[1] = (char)0;
L1:
    if (loc_2[1] == 0) {
        far_b05a7();
        B_D5DD = (char)(B_7FD1 + 10);
        t25 = far_b1ad0(1, 0);
        loc_2[0] = B_7FD1;
        t26 = far_b362e(MK_FP(SEG_DATA, 0x5fee), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), MK_FP(SEG_DATA, 0x5ea0), 15);
        t27 = far_b1f96(22);
        t28 = far_b362e(MK_FP(SEG_DATA, 0x5ff4), (unsigned char far *)B_7FD0, MK_FP(SEG_DATA, 0x5ec4), 5);
        t29 = far_b1ad0(2, 0);
        if (B_7FD1 != 1 && B_7FD1 != 2) {
            p16 = 0;
            p18 = 2;
            t2 = far_b3819(MK_FP(SEG_DATA, 0x6008), (char far *)&B_7FCE, p18, p16, 20, 8);
        } else {
            t3 = far_b3819(MK_FP(SEG_DATA, 0x5fff), (unsigned char far *)B_8A97, 2, 0, 99, 10);
            t4 = far_b3819(MK_FP(SEG_DATA, 0x5f63), (unsigned char far *)B_8A96, 2, 0, 59, 10);
            t5 = far_b3819(MK_FP(SEG_DATA, 0x5f63), (unsigned char far *)B_8A95, 2, 0, 59, 10);
            t6 = far_b3819(MK_FP(SEG_DATA, 0x5f63), (unsigned char far *)&B_8A94, 2, 0, 29, 10);
            p16 = 0;
            p18 = 2;
            t7 = far_b3819(MK_FP(SEG_DATA, 0x6006), (unsigned char far *)TBL_8A93, p18, p16, 99, 10);
        }
        t30 = far_b1ad0(3, 0);
        t31 = far_b1b41(32, 120);
        t32 = far_b1ad0(3, 0);
        ax3 = B_7FD1;
        if (ax3 <= 4) {
            switch ((unsigned int)(unsigned)(TBL_c9a51 + (ax3 << 1))) {
            case 0:
                t12 = far_b3819(MK_FP(SEG_DATA, 0x601b), (unsigned char far *)B_7FCF, 1, 1, 2, 8);
                t13 = far_b1ad0(4, 0);
                p16 = 48;
                p18 = SEG_DATA;
                t14 = far_b362e(MK_FP(SEG_DATA, 0x6027), ((long)p18 << 16 | (unsigned)(unsigned int)(unsigned)B_7FD4), MK_FP(SEG_DATA, p16), 3);
                break;
            case 1:
            case 2:
                p16 = 0x214;
                p18 = SEG_DATA;
                t9 = far_b362e(MK_FP(SEG_DATA, 0x5f89), ((long)p18 << 16 | (unsigned)(unsigned int)(unsigned)&B_7FCB), MK_FP(SEG_DATA, p16), 10);
                if (B_7FD1 == 1) {
                    t10 = far_b1ad0(4, 0);
                    p16 = 1;
                    p18 = 1;
                    t11 = far_b3819(MK_FP(SEG_DATA, 0x6035), (unsigned char far *)B_7FCF, p18, p16, 2, 8);
                }
                break;
            case 3:
                break;
            case 4:
                p16 = 0x5edc;
                p18 = SEG_DATA;
                t8 = far_b362e(MK_FP(SEG_DATA, 0x603e), ((long)p18 << 16 | (unsigned)(unsigned int)(unsigned)B_7FD2), MK_FP(SEG_DATA, p16), 8);
                break;
            }
        }
        t33 = far_b90dd();
        t34 = far_b1b05(MK_FP(SEG_DATA, 0x6049));
        t35 = far_b1ad0(6, 20);
        p14 = 0x606a;
        t36 = far_b1b05(MK_FP(SEG_DATA, p14));
        t37 = fn_c9655();
        if (loc_4 != 0) {
            B_7B8E = (char)1;
            loc_4 = 0;
        }
        for (;;) {
            ax4 = far_b08f7(3);
            dx = UNDEF;
            loc_2[1] = (char)ax4;
            if ((char)ax4 == 0) {
                if (B_7B8D == 0) {
                    goto L2;
                }
                if (B_7FD1 != 1 && B_7FD1 != 2) {
                    if (B_7B8D != 2) {
                        continue;
                    }
                    t18 = (long)(signed char)B_7FCE * 0x7d0L;
                    W_D60E = (int)t18;
                    continue;
                }
                ax5 = B_7B8D - 2;
                if (ax5 > 5) {
                    continue;
                }
                switch ((unsigned int)(unsigned)(TBL_c9a43 + (ax5 << 1))) {
                case 0:
                case 1:
                case 2:
                case 4:
                    break;
                case 3:
                    goto L3;
                case 5:
                    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)B_7FCB);
                    ax7 = (struct s2 near *)((char)ax6 << 2);
                    dx2 = ax7->f_5e4;
                    W_D633 = ax7->f_5e6;
                    W_D631 = dx2;
                    cx = 0;
                    si = 0;
                    t19 = (long)(signed char)(char)ax6 * 6L;
                    dx3 = (int)t19;
                    do {
                        *(int *)((char *)&TBL_D62B + 0 + (unsigned int)(unsigned)si) = *(int *)((char near *)si + 1524 + dx3);
                        si = (struct s1 near *)((char near *)si + 2);
                        cx = cx + 1;
                    } while ((unsigned int)(unsigned)si != 6);
L3:
                    di = B_7FCB;
                    ax8 = ((char)-(B_7FCB < 0) << 8 | (unsigned char)TBL_662C[B_7FCB]);
                    if ((unsigned char)(char)ax8 < B_8A94) {
                        B_8A94 = (char)ax8;
                        t20 = far_b1073(6);
                    }
                    break;
                }
                p14 = 0x7e5f;
                p16 = SEG_DATA;
                p18 = (int)(unsigned)TBL_8A93;
                t21 = far_eb6bd(p18, p16, MK_FP(SEG_DATA, p14));
                continue;
            }
            break;
        }
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)loc_2[1]);
L2:
    loc_4 = 1;
    B_D5DD = (char)10;
    while (B_D5DD <= 15) {
        t17 = far_b130a(B_7B8D);
        B_D5DD = (char)(B_D5DD + 1);
    }
    if (loc_2[0] == 2) {
        t15 = far_d7801();
        if ((int)t15 == 0) {
            if (loc_2[0] > B_7FD1) {
                loc_2[0] = (char)(loc_2[0] + 1);
            } else {
                loc_2[0] = (char)(loc_2[0] - 1);
            }
        }
    }
    t16 = far_eb7cc(loc_2[0]);
    dx = (int)(t16 >> 16);
L4:
    ax9 = loc_2[1];
    if (ax9 != 120) {
        if (ax9 != 121) {
            if (ax9 == 122) {
                t22 = fn_ca16c();
                dx = (int)(t22 >> 16);
                loc_2[1] = (char)(int)t22;
            }
        } else {
            goto L5;
        }
    } else {
        B_7FD3 = (char)((char)(0 - (B_7FD3 != 0)) + 1);
        t23 = fn_c9655();
        dx = (int)(t23 >> 16);
L5:
        loc_2[1] = (char)0;
    }
    goto L1;
}
long far fn_ca16c(void) { return 0; }
