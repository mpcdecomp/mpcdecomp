/* differs: 308 at +5, 1750 bytes; 311 at +5, 1738 bytes; 312 at +5, 1738 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_TBL_882A {
    int f_0;
    char pad_2[2];
    int f_4;
};
struct g_TBL_882C {
    int f_0;
};
struct g_TBL_8830 {
    int f_0;
};
struct g_TBL_8832 {
    int f_0;
};
struct g_TBL_8834 {
    int f_0;
};
struct g_TBL_882E {
    int f_0;
};
extern char B_7B8D;
extern unsigned char B_8A88;
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_9562;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char B_D612[];
extern char B_F240;
extern struct g_TBL_882A TBL_882A;
extern struct g_TBL_882C TBL_882C;
extern struct g_TBL_882E TBL_882E;
extern struct g_TBL_8830 TBL_8830;
extern struct g_TBL_8832 TBL_8832;
extern struct g_TBL_8834 TBL_8834;
extern unsigned char TBL_c9f92[];
extern unsigned char TBL_c9f9e[];
extern unsigned int W_9039;
extern int W_903B;
extern unsigned int W_903D;
extern int W_903F;
extern int W_9045;
extern int W_9047;
extern int W_904B;
extern int W_F23C;
extern int W_F23E;
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b39a2();
extern long far far_b3b9f();
extern long far far_b6cd3();
extern long far far_b90dd();
extern long far far_e51be();
extern long far far_e5a99();
extern long far far_e7069();
extern long far far_e7073();
extern int far far_eadf4();
extern long far far_eb007();
extern long far fn_c9fa6();

long far fn_c9a5b(void)
{
    char loc_6[6];
    int loc_8;
    char loc_a[2];
    char loc_c[2];
    char loc_10[4];
    int loc_12;
    int loc_14;
    int loc_16;
    int ax;
    unsigned int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int bx2;
    int bx3;
    int cx;
    int cx2;
    int cx3;
    int near *di;
    int near *di2;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    unsigned int dx5;
    int dx6;
    unsigned int dx7;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int p32;
    int p34;
    int p36;
    int p38;
    int p40;
    int p42;
    int p44;
    struct s1 near *si;
    int si2;
    struct s1 near *si3;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    int t18;
    long t19;
    long t2;
    long t20;
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
    int t30;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e7069();
    if (B_9562 != 0) {
        return (long)MK_FP((int)(far_b3b9f(-40) >> 16), B_D5DE);
    }
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x6716));
    B_D5DD = (char)3;
    dx = (int)(far_e51be((unsigned char far *)B_901B, B_8A9F, 0) >> 16);
    if ((W_F23C | W_F23E) != 0) {
        ax = W_F23E;
        ax2 = W_904B;
        flags = -(ax < 0) - -(ax2 < 0);
        if (!CC("<", flags) && (CC("!=", flags) || (unsigned int)ax >= (unsigned int)ax2)) {
L1:
            W_F23E = 1;
            W_F23C = 0x100;
        }
    } else {
        goto L1;
    }
    if ((unsigned char)B_F240 > B_8A88) {
        B_F240 = B_8A88;
    }
    if (B_F240 == 0) {
        B_F240 = (char)1;
    }
    far_b1ad0(1, 0);
    t3 = far_b362e(MK_FP(SEG_DATA, 0x6731), (unsigned char far *)B_D612, MK_FP(SEG_DATA, 48), 3);
    far_b1ad0(2, 0);
    t4 = far_b39a2(MK_FP(SEG_DATA, 0x6740), (int far *)&W_F23C);
    far_b1ad0(4, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x675f));
    t5 = fn_c9fa6((char far *)&B_F240, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 0);
    far_b1ad0(5, 0);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x6713), (char far *)&B_F240, 2, 1, 99, 8);
    far_b1ad0(5, 21);
    t7 = far_b3819(MK_FP(SEG_DATA, 0x6589), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), 3, 1, 0x28f, 0);
    p34 = 0;
    p36 = 2;
    p38 = SEG_STACK;
    p40 = (int)(unsigned)&loc_8;
    p42 = SEG_DATA;
    p44 = 0x66a1;
    t8 = far_b3819(p44, p42, p40, p38, p36, p34, 99, 2);
    t9 = far_e5a99((unsigned char far *)B_901B);
    t10 = far_b90dd();
    p32 = 0x6784;
    ax9 = far_b1b05(MK_FP(SEG_DATA, p32));
    *(int *)((char *)&loc_6 + 4) = 0;
    for (;;) {
L2:
        if (*(int *)((char *)&loc_6 + 4) == 0) {
            for (;;) {
                t30 = far_b08f7(4);
                *(int *)((char *)&loc_6 + 4) = t30;
                if (t30 == 0) {
                    ax10 = B_7B8D - 1;
                    if (ax10 > 3) {
                        continue;
                    }
                    switch ((unsigned int)(unsigned)(TBL_c9f9e + (ax10 << 1))) {
                    case 0:
                        p32 = (int)(unsigned)loc_10;
                        p34 = W_F23E;
                        p36 = W_F23C;
                        p38 = SEG_DATA;
                        p40 = (int)(unsigned)B_901B;
                        t17 = far_eb007(((long)p38 << 16 | (unsigned)p40), ((long)p34 << 16 | (unsigned)p36), MK_FP(SEG_STACK, p32));
                        ax12 = *(int *)((char *)&loc_10 + 2);
                        flags2 = ax12 - W_903F;
                        if (!CC(">=u", flags2)) {
                            continue;
                        }
                        if (!CC("!=", flags2) && (unsigned int)*(int *)((char *)&loc_10 + 0) < W_903D) {
                            continue;
                        }
                        p32 = (int)(unsigned)&W_F23C;
                        dx2 = *(int *)((char *)&loc_10 + 0);
                        p34 = *(int *)((char *)&loc_10 + 2) - (dx2 == 0);
                        p36 = dx2 - 1;
                        p38 = SEG_DATA;
                        p40 = (int)(unsigned)B_901B;
                        t18 = far_eadf4(((long)p38 << 16 | (unsigned)p40), p36, p34, MK_FP(SEG_DATA, p32));
                        t19 = far_b1073(1);
                        continue;
                    case 1:
                        p32 = SEG_STACK;
                        p34 = (int)(unsigned)&loc_8;
                        p36 = SEG_STACK;
                        p38 = (int)(unsigned)loc_6;
                        p40 = SEG_DATA;
                        p42 = (int)(unsigned)&B_F240;
                        p44 = 0xc91d;
                        t16 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 1);
                        continue;
                    case 2:
                    case 3:
                        if (B_8A88 == 0) {
                            B_8A88 = (unsigned char)1;
                            TBL_8832.f_0 = 0;
                            TBL_8830.f_0 = 0;
                        }
                        t11 = (long)(int)*(int *)((char *)&loc_6 + 0) * 100L;
                        ax11 = (int)t11 + loc_8;
                        loc_12 = -(ax11 < 0);
                        loc_14 = ax11;
                        t12 = (long)(int)ax11 << 12;
                        t13 = (t12 + 0x1f4L) / 0x2710L;
                        t14 = (long)(signed char)B_F240 * 6L;
                        *(int *)((char *)&TBL_882E + 0 + (int)t14) = (int)t13;
                        p32 = SEG_STACK;
                        p34 = (int)(unsigned)loc_c;
                        p36 = SEG_STACK;
                        p38 = (int)(unsigned)loc_a;
                        p40 = SEG_DATA;
                        p42 = (int)(unsigned)&B_F240;
                        p44 = 0xc91d;
                        t15 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 0);
                        continue;
                    }
                } else {
                    break;
                }
            }
            bx = *(int *)((char *)&loc_6 + 4) - 117;
            if (bx > 5) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_c9f92 + (bx << 1))) {
            case 0:
                B_F240 = (char)(B_F240 + 1);
                p32 = SEG_STACK;
                p34 = (int)(unsigned)&loc_8;
                p36 = SEG_STACK;
                p38 = (int)(unsigned)loc_6;
                p40 = SEG_DATA;
                p42 = (int)(unsigned)&B_F240;
                p44 = 0xc91d;
                t29 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 1);
                *(int *)((char *)&loc_6 + 4) = 0;
                continue;
            case 1:
            case 2:
                continue;
            case 3:
                t24 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&W_F23C + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_10));
                ax13 = (int)t24;
                if (B_8A88 == 0) {
                    B_8A88 = (unsigned char)1;
                    TBL_8832.f_0 = 0;
                    TBL_8830.f_0 = 0;
                    TBL_8834.f_0 = 0x1000;
                }
                ax14 = ((char)(ax13 >> 8) << 8 | (unsigned char)B_8A88);
                loc_16 = (unsigned char)(char)ax14;
                t25 = (long)(int)(unsigned char)(char)ax14 * 6L;
                di = (int near *)(int)t25;
                bx2 = W_903D;
                *(int *)((char *)&TBL_8832 + 0 + (int)t25) = W_903F;
                *(int *)((char *)&TBL_8830 + 0 + (int)t25) = bx2;
                *(int *)((char *)&TBL_8834 + 0 + (unsigned int)(unsigned)di) = 0;
                cx2 = 0;
                si = (struct s1 near *)&TBL_8830;
                for (;;) {
                    if (loc_16 >= cx2) {
                        dx4 = si->f_0;
                        if (si->f_2 == *(int *)((char *)&loc_10 + 2) && dx4 == *(int *)((char *)&loc_10 + 0)) {
                            goto L3;
                        }
                        ax15 = si->f_2;
                        dx5 = si->f_0;
                        flags3 = ax15 - *(int *)((char *)&loc_10 + 2);
                        if (!CC("<u", flags3) && (CC(">u", flags3) || dx5 > (unsigned int)*(int *)((char *)&loc_10 + 0))) {
                            goto L4;
                        }
                        si = (struct s1 near *)((char near *)si + 6);
                        cx2 = cx2 + 1;
                        continue;
                    }
                    break;
                }
                goto L5;
            case 4:
                *(int *)((char *)&loc_6 + 4) = 0;
                if (B_F240 == 1) {
                    if (B_8A88 == 1) {
                        B_8A88 = (unsigned char)(B_8A88 - 1);
                    } else {
                        TBL_8834.f_0 = 0x1000;
                    }
                    p32 = SEG_STACK;
                    p34 = (int)(unsigned)&loc_8;
                    p36 = SEG_STACK;
                    p38 = (int)(unsigned)loc_6;
                    p40 = SEG_DATA;
                    p42 = (int)(unsigned)&B_F240;
                    p44 = 0xc91d;
                    t21 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 1);
                    continue;
                }
                if (B_8A88 == 0) {
                    continue;
                }
                cx = B_F240;
                t22 = (long)(signed char)B_F240 * 6L;
                si = (struct s1 near *)(int)t22;
                di = (int near *)(struct g_TBL_882A near *)((char near *)(struct g_TBL_882A near *)((char near *)&TBL_882A + (int)t22) + 4);
                loc_16 = B_8A88;
                while (loc_16 > cx) {
                    dx3 = *(int *)((char *)&TBL_8830 + 0 + (unsigned int)(unsigned)si);
                    *(int *)((char *)&TBL_882C + 0 + (unsigned int)(unsigned)si) = *(int *)((char *)&TBL_8832 + 0 + (unsigned int)(unsigned)si);
                    *(int *)((char *)&TBL_882A + 0 + (unsigned int)(unsigned)si) = dx3;
                    *di = *(int *)((char *)&TBL_8834 + 0 + (unsigned int)(unsigned)si);
                    si = (struct s1 near *)((char near *)si + 6);
                    di = di + 3;
                    cx = cx + 1;
                }
                B_8A88 = (unsigned char)(B_8A88 - 1);
                p32 = SEG_STACK;
                p34 = (int)(unsigned)&loc_8;
                p36 = SEG_STACK;
                p38 = (int)(unsigned)loc_6;
                p40 = SEG_DATA;
                p42 = (int)(unsigned)&B_F240;
                p44 = 0xc91d;
                t23 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 1);
                continue;
            case 5:
                B_F240 = (char)(B_F240 - 1);
                p32 = SEG_STACK;
                p34 = (int)(unsigned)&loc_8;
                p36 = SEG_STACK;
                p38 = (int)(unsigned)loc_6;
                p40 = SEG_DATA;
                p42 = (int)(unsigned)&B_F240;
                p44 = 0xc91d;
                t20 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 1);
                *(int *)((char *)&loc_6 + 4) = 0;
                continue;
            }
        } else {
            break;
        }
    }
    TBL_882E.f_0 = 0x1000;
    if (B_8A88 != 0) {
        cx3 = 0;
        si3 = (struct s1 near *)&TBL_8830;
        loc_16 = B_8A88;
        while (loc_16 > cx3) {
            ax17 = si3->f_2;
            dx7 = si3->f_0;
            flags4 = ax17 - W_903B;
            if (!CC("<u", flags4)) {
                if (!CC(">u", flags4)) {
                    if (dx7 > W_9039) {
                        goto L6;
                    }
L7:
                    si3 = (struct s1 near *)((char near *)si3 + 6);
                    cx3 = cx3 + 1;
                    continue;
                }
                break;
            }
            goto L7;
        }
        goto L8;
    }
    goto L9;
L3:
    B_F240 = (char)((char)cx2 + 1);
    goto L5;
L4:
    if (B_8A88 < 98) {
        ax16 = ((char)(ax15 >> 8) << 8 | (unsigned char)B_8A88);
        B_8A88 = (unsigned char)((char)ax16 + 1);
        *(int *)((char *)&loc_6 + 2) = (unsigned char)((char)ax16 + 1);
        t26 = (long)(int)(unsigned char)((char)ax16 + 1) * 6L;
        si2 = (int)t26;
        di2 = (int near *)(struct g_TBL_882E near *)((char near *)&TBL_882E + (int)t26);
        while (*(int *)((char *)&loc_6 + 2) > cx2) {
            dx6 = *(int *)((char *)&TBL_882A + 0 + si2);
            *(int *)((char *)&TBL_8832 + 0 + si2) = *(int *)((char *)&TBL_882C + 0 + si2);
            *(int *)((char *)&TBL_8830 + 0 + si2) = dx6;
            *(int *)((char *)&TBL_8834 + 0 + si2) = *di2;
            si2 = si2 - 6;
            di2 = di2 - 3;
            *(int *)((char *)&loc_6 + 2) = *(int *)((char *)&loc_6 + 2) - 1;
        }
        t27 = (long)(int)cx2 * 6L;
        di = (int near *)(int)t27;
        bx3 = *(int *)((char *)&loc_10 + 0);
        si = (struct s1 near *)(int)t27;
        *(int *)((char *)&TBL_8832 + 0 + (unsigned int)(unsigned)si) = *(int *)((char *)&loc_10 + 2);
        *(int *)((char *)&TBL_8830 + 0 + (unsigned int)(unsigned)si) = bx3;
        *(int *)((char *)&TBL_8834 + 0 + (unsigned int)(unsigned)di) = 0x1000;
        B_F240 = (char)((char)cx2 + 1);
    }
L5:
    p32 = SEG_STACK;
    p34 = (int)(unsigned)&loc_8;
    p36 = SEG_STACK;
    p38 = (int)(unsigned)loc_6;
    p40 = SEG_DATA;
    p42 = (int)(unsigned)&B_F240;
    p44 = 0xc91d;
    t28 = fn_c9fa6(((long)p40 << 16 | (unsigned)p42), ((long)p36 << 16 | (unsigned)p38), ((long)p32 << 16 | (unsigned)p34), 1);
    *(int *)((char *)&loc_6 + 4) = 0;
    goto L2;
L6:
L8:
    if (cx3 != 0) {
        TBL_882E.f_0 = *(int *)((char *)&TBL_882A + 4 + cx3 * 6);
    }
L9:
    return (long)MK_FP((int)(far_e7073(W_9045, W_9047) >> 16), *(int *)((char *)&loc_6 + 4));
}
long far fn_c9fa6(char far *p0, char far *p1, int far *p2, int p3) { return 0; }
