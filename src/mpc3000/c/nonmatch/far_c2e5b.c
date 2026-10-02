/* differs: 308 at +5, 1846 bytes; 311 at +5, 1850 bytes; 312 at +5, 1854 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_W_F000 {
    long f_0;
};
struct g_W_EFFC {
    long f_0;
};
struct g_W_EFF8 {
    long f_0;
};
struct g_W_EFF4 {
    long f_0;
};
extern char B_5378;
extern char B_5379;
extern char B_537A;
extern char B_537B;
extern char B_537C;
extern char B_7B8D;
extern char B_83B9;
extern char B_83BA;
extern char B_83BB;
extern unsigned char B_83BC[];
extern unsigned char B_83BD[];
extern char B_956A;
extern char B_CEBF;
extern char B_D5DD;
extern char B_F008;
extern unsigned char TBL_c33fe[];
extern int W_83BE;
extern int W_EFEC;
extern int W_EFEE;
extern int W_EFF0;
extern int W_EFF2;
extern struct g_W_EFF4 W_EFF4;
extern int W_EFF6;
extern struct g_W_EFF8 W_EFF8;
extern int W_EFFA;
extern struct g_W_EFFC W_EFFC;
extern int W_EFFE;
extern struct g_W_F000 W_F000;
extern int W_F002;
extern long far far_b059a(int);
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern long far far_b1206(int, int, int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3819(void far *, int far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern void far far_c458d(void far *);
extern long far far_cc62d(void);
extern long far far_cca70(void);
extern long far far_ccbdd(int, long);
extern long far far_cce4b(void far *, long, int);
extern long far far_cd353(int, int);
extern long far far_cdc78(int);
extern int far far_d7903(void);
extern int far far_d9e1a(void);
extern long far far_d9e7b(void far *, int);
extern long far far_d9ea7(int, int, int, int, int, int, int, int);
extern long far far_fa0c8(int, int, int);
extern long far fn_c3ed1(void);
extern long far fn_c3f4a(void);
extern int far fn_c4122(void);
extern long far fn_c4174(void);
extern long far fn_c4195(void);
extern long far fn_c4643(int, int, int);

long far far_c2e5b(void)
{
    int loc_2;
    unsigned long loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    unsigned int loc_10;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    unsigned int ax18;
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
    int bx3;
    int bx4;
    unsigned int cx;
    unsigned int cx2;
    int cx3;
    unsigned int cx4;
    unsigned int cx5;
    int cx6;
    unsigned int cx7;
    unsigned int cx8;
    unsigned int di;
    unsigned int di2;
    int di3;
    int di4;
    int dx;
    unsigned int dx10;
    int dx11;
    int dx12;
    unsigned int dx13;
    unsigned int dx14;
    int dx15;
    int dx2;
    int dx3;
    unsigned int dx4;
    unsigned int dx5;
    int dx6;
    unsigned int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int es;
    int es2;
    int es3;
    int flags;
    int p26;
    int p28;
    int p30;
    int si;
    int si2;
    int si3;
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
    int t19;
    long t2;
    int t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    long t3;
    long t30;
    long t31;
    long t32;
    int t33;
    int t34;
    long t35;
    long t36;
    long t37;
    long t38;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)5;
    B_537A = B_83B9;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x4d91));
    t2 = far_cc62d();
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x4da2));
    t3 = far_ccbdd(0, -1L);
    far_c458d(MK_FP(SEG_DATA, -0x1fc1));
    t5 = far_cca70();
    loc_2 = (int)(t5 >> 16);
    *(int *)((char *)&loc_4 + 0) = (int)t5;
    flags = loc_2;
    if (!CC(">", flags) && (CC("<", flags) || (unsigned int)*(int *)((char *)&loc_4 + 0) < 0x4020)) {
        return (long)MK_FP((int)(far_b3b9f(2) >> 16), 76);
    }
    t6 = far_cce4b(MK_FP(SEG_DATA, -0x1fc1), loc_4, 0);
    B_5379 = (char)(int)t6;
    if (B_5379 < 0) {
        return (long)MK_FP((int)(far_b3b9f(-(char)(int)t6) >> 16), 76);
    }
    t7 = (long)(signed char)B_5379 * 36L;
    W_F002 = 0xa853 /* SEG_A28F */;
    *(int *)((char *)&W_F000 + 0) = (int)t7 + 0x4800;
    bx = (int)W_F000.f_0;
    es = (int)(W_F000.f_0 >> 16);
    dx = *(int far *)MK_FP(es, bx + 32);
    loc_6 = *(int far *)MK_FP(es, bx + 34);
    loc_8 = dx;
    dx2 = *(int far *)MK_FP(es, bx + 28);
    loc_a = *(int far *)MK_FP(es, bx + 30);
    loc_c = dx2;
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) - 32;
    loc_2 = (int)(loc_4 - 32L >> 16);
    dx3 = (int)(loc_4 / 0x1000L);
    if ((dx3 & 1) == 0) {
        dx3 = dx3 - 1;
    }
    W_EFEE = 0;
    W_EFEC = 0x1000;
    ax3 = dx3 - -(dx3 < 0) >> 1;
    t8 = far_fa0c8(0x1000, ax3, -(ax3 < 0));
    W_EFF2 = (int)(t8 >> 16);
    W_EFF0 = (int)t8;
    bx2 = (int)W_F000.f_0;
    es2 = (int)(W_F000.f_0 >> 16);
    ax4 = *(int far *)MK_FP(es2, bx2 + 34);
    dx4 = *(int far *)MK_FP(es2, bx2 + 32);
    W_EFFE = ax4;
    *(int *)((char *)&W_EFFC + 0) = dx4;
    dx5 = dx4 + W_EFF0;
    cx = *(int *)((char *)&W_EFFC + 0);
    cx2 = cx + W_EFF0;
    cx3 = cx2 & -16;
    loc_e = (int)(((long)(ax4 + W_EFF2 + (dx5 < dx4)) << 16 | (unsigned)dx5) - ((long)(W_EFFE + W_EFF2 + (cx2 < cx)) << 16 | (unsigned)cx3) >> 16);
    loc_10 = dx5 - cx3;
    dx6 = 16 - loc_10;
    *(int *)((char *)&W_EFFC + 0) = *(int *)((char *)&W_EFFC + 0) + dx6;
    W_EFFE = (int)(W_EFFC.f_0 + ((long)(0 - loc_e - (loc_10 > 16)) << 16 | (unsigned)dx6) >> 16);
    dx7 = *(int *)((char *)&W_EFFC + 0);
    dx8 = dx7 + W_EFF0;
    dx9 = dx8 + W_EFEC;
    ax5 = W_EFFE + W_EFF2 + (dx8 < dx7) + W_EFEE + (dx9 < dx8);
    W_EFFA = ax5;
    *(int *)((char *)&W_EFF8 + 0) = dx9;
    dx10 = dx9 + W_EFF0;
    cx4 = *(int *)((char *)&W_EFF8 + 0);
    cx5 = cx4 + W_EFF0;
    cx6 = cx5 & -16;
    loc_e = (int)(((long)(ax5 + W_EFF2 + (dx10 < dx9)) << 16 | (unsigned)dx10) - ((long)(W_EFFA + W_EFF2 + (cx5 < cx4)) << 16 | (unsigned)cx6) >> 16);
    loc_10 = dx10 - cx6;
    dx11 = 16 - loc_10;
    *(int *)((char *)&W_EFF8 + 0) = *(int *)((char *)&W_EFF8 + 0) + dx11;
    W_EFFA = (int)(W_EFF8.f_0 + ((long)(0 - loc_e - (loc_10 > 16)) << 16 | (unsigned)dx11) >> 16);
    bx3 = *(int *)((char *)&W_F000 + 0);
    dx12 = *(int far *)MK_FP(es2, bx3 + 32);
    W_EFF6 = *(int far *)MK_FP(es2, bx3 + 34);
    *(int *)((char *)&W_EFF4 + 0) = dx12;
    dx13 = W_EFF0;
    cx7 = *(int *)((char *)&W_EFF4 + 0);
    cx8 = cx7 + (dx13 << 1);
    dx14 = W_EFF0;
    di = *(int *)((char *)&W_EFF4 + 0);
    di2 = di + (dx14 << 1);
    di3 = di2 & -16;
    loc_e = (int)(((long)(W_EFF6 + (W_EFF2 << 1 | dx13 >> 15 & 1) + (cx8 < cx7)) << 16 | (unsigned)cx8) - ((long)(W_EFF6 + (W_EFF2 << 1 | dx14 >> 15 & 1) + (di2 < di)) << 16 | (unsigned)di3) >> 16);
    loc_10 = cx8 - di3;
    dx15 = 16 - loc_10;
    *(int *)((char *)&W_EFF4 + 0) = *(int *)((char *)&W_EFF4 + 0) + dx15;
    W_EFF6 = (int)(W_EFF4.f_0 + ((long)(0 - loc_e - (loc_10 > 16)) << 16 | (unsigned)dx15) >> 16);
    if (B_83BA < 2) {
        B_537B = (char)0;
    } else {
        B_537B = (char)1;
    }
    t9 = far_d9e7b(MK_FP(0xa853 /* SEG_A28F */, 0), 0x4800);
    t10 = far_d9ea7(*(int *)((char *)&W_EFFC + 0), W_EFFE, *(int *)((char *)&W_EFF8 + 0), W_EFFA, *(int *)((char *)&W_EFF4 + 0), W_EFF6, W_EFF0, W_EFF2);
    far_b1ad0(1, 0);
    t11 = far_b362e(MK_FP(SEG_DATA, 0x4dbd), (char far *)&B_83B9, MK_FP(SEG_DATA, 0x4d54), 7);
    far_b1ad0(1, 15);
    t12 = far_b362e(MK_FP(SEG_DATA, 0x4dc4), (char far *)&B_83BA, MK_FP(SEG_DATA, 0x4d44), 8);
    far_b1ad0(1, 29);
    t13 = far_b362e(MK_FP(SEG_DATA, 0x4dca), (char far *)&B_83BB, MK_FP(SEG_DATA, 48), 3);
    far_b1ad0(2, 0);
    si = (int)(*(long *)((char *)&W_EFF0 + 0) / 0x113aL);
    if (B_537B == 0) {
        si = si * 2;
    }
    if (si > W_83BE) {
        ax10 = W_83BE;
    } else {
        ax10 = si;
    }
    W_83BE = ax10;
    t14 = far_b3819(MK_FP(SEG_DATA, 0x4dd3), (int far *)&W_83BE, 5, 1, si, 4);
    far_b1ad0(2, 15);
    t15 = far_b3819(MK_FP(SEG_DATA, 0x4ddb), (unsigned char far *)B_83BC, 3, 0, 100, 8);
    far_b1ad0(2, 29);
    t16 = far_b3819(MK_FP(SEG_DATA, 0x4de2), (unsigned char far *)B_83BD, 3, 0, 100, 8);
    t17 = fn_c3ed1();
    t18 = far_b90dd();
    far_b1ad0(7, 0);
    t19 = far_b1b05(MK_FP(SEG_DATA, 0x4deb));
    B_F008 = (char)-1;
    p26 = B_83BA;
    p28 = B_83B9;
    p30 = 0xcc36;
    ax14 = (int)fn_c4643(p28, p26, B_83BB);
    B_537C = (char)0;
    B_CEBF = (char)1;
    B_956A = (char)(B_956A + 1);
    si2 = 0;
    while (si2 == 0) {
        for (;;) {
            ax17 = far_b08f7(2);
            si2 = ax17;
            if (ax17 == 0) {
                ax18 = B_7B8D;
                if (ax18 > 4) {
                    continue;
                }
                switch ((unsigned int)(unsigned)(TBL_c33fe + (ax18 << 1))) {
                case 0:
                    p26 = B_83BA;
                    p28 = B_83B9;
                    p30 = 0xcc36;
                    t28 = fn_c4643(p28, p26, B_83BB);
                    if ((int)t28 == 0) {
                        continue;
                    }
                    B_537A = B_83B9;
                    t29 = fn_c4174();
                    t30 = far_b059a(5);
                    continue;
                case 1:
                    if (B_83BA < 2) {
                        B_537B = (char)0;
                    } else {
                        B_537B = (char)1;
                    }
                    p26 = B_83BA;
                    p28 = B_83B9;
                    p30 = 0xcc36;
                    t22 = fn_c4643(p28, p26, B_83BB);
                    if ((int)t22 != 0) {
                        t23 = fn_c3ed1();
                        p30 = W_EFF0;
                        t24 = ((long)W_EFF2 << 16 | (unsigned)p30) / 0x113aL;
                        si3 = (int)t24;
                        if (B_537B == 0) {
                            t25 = (long)(int)si3 * 2L;
                            si3 = (int)t25;
                        }
                        p26 = 0;
                        p28 = 3;
                        t26 = far_b1206(p28, p26, si3);
                        if (W_83BE > si3) {
                            W_83BE = si3;
                        }
                        t27 = far_b1073(3);
                        continue;
                    }
                    continue;
                case 2:
                    p26 = B_83BA;
                    p28 = B_83B9;
                    p30 = 0xcc36;
                    t21 = fn_c4643(p28, p26, B_83BB);
                    continue;
                case 3:
                    continue;
                case 4:
                    t20 = fn_c4122();
                    continue;
                }
            } else {
                break;
            }
        }
        if (ax17 != 120) {
            if (ax17 != 121) {
                continue;
            }
            if (B_537C == 0) {
                t31 = fn_c4195();
            }
            si2 = 0;
            continue;
        }
        si2 = 0;
        if (B_537C == 0) {
            B_5378 = (char)0;
            B_537C = (char)1;
            t32 = fn_c4174();
            t33 = far_b1ad0(7, 0);
            p26 = 0x4e14;
            t34 = far_b1b05(MK_FP(SEG_DATA, p26));
            t35 = fn_c3f4a();
            si2 = (int)t35;
            continue;
        }
    }
    B_CEBF = (char)0;
    t36 = fn_c4643(0, B_83BA, B_83BB);
    ax15 = far_d9e1a();
    if (B_537C != 4) {
        bx4 = (int)W_F000.f_0;
        es3 = (int)(W_F000.f_0 >> 16);
        *(int far *)MK_FP(es3, bx4 + 34) = loc_6;
        *(int far *)MK_FP(es3, bx4 + 32) = loc_8;
        *(int far *)MK_FP(es3, bx4 + 30) = loc_a;
        *(int far *)MK_FP(es3, bx4 + 28) = loc_c;
        t37 = far_cd353(B_5379, 0);
    }
    ax16 = far_d7903();
    B_956A = (char)(B_956A - 1);
    di4 = 0;
    do {
        t38 = far_cdc78(di4);
        di4 = di4 + 1;
    } while (di4 < 32);
    return (long)MK_FP((int)(t38 >> 16), si2);
}
void far far_c458d(void far *p0) { }
long far fn_c3ed1(void) { return 0; }
long far fn_c3f4a(void) { return 0; }
int far fn_c4122(void) { return 0; }
long far fn_c4174(void) { return 0; }
long far fn_c4195(void) { return 0; }
long far fn_c4643(int p0, int p1, int p2) { return 0; }
