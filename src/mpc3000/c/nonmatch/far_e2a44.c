/* differs: 308 at +5, 863 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
struct s1 {
    long f_0;
};
struct g_TBL_8834 {
    int f_0;
};
struct g_TBL_882A {
    int f_0;
};
struct g_TBL_882C {
    int f_0;
};
struct g_TBL_8832 {
    int f_0;
};
struct g_TBL_8830 {
    int f_0;
};
extern unsigned char B_8A88;
extern unsigned char B_901B[];
extern struct g_TBL_882A TBL_882A;
extern struct g_TBL_882C TBL_882C;
extern unsigned char TBL_882E[];
extern struct g_TBL_8830 TBL_8830;
extern struct g_TBL_8832 TBL_8832;
extern struct g_TBL_8834 TBL_8834;
extern int W_903D;
extern int W_903F;
extern int W_904D;
extern long far far_e5a99(unsigned char far *);
extern long far far_eb007(unsigned char far *, long, unsigned long far *);

void far far_e2a44(int arg_0, int arg_2, int arg_4)
{
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    unsigned int loc_10;
    int loc_e;
    unsigned long loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int near *di2;
    int near *di3;
    int near *di4;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    unsigned int dx8;
    int dx9;
    int flags;
    int flags2;
    int flags3;
    struct s1 near *si2;
    int si3;
    int si4;
    struct s1 near *si5;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;

    if (W_904D >= arg_0) {
        dx = arg_2 - arg_0;
        if (arg_4 == 0) {
            if (W_904D < arg_2) {
                W_904D = 1;
            } else {
                W_904D = W_904D - dx;
            }
        } else {
            W_904D = W_904D + dx;
        }
    }
    t1 = far_e5a99((unsigned char far *)B_901B);
    if (B_8A88 != 0) {
        loc_2 = arg_0;
        loc_4 = 0x100;
        loc_6 = arg_2;
        loc_8 = 0x100;
        t2 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&loc_4 + 0), (unsigned long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c));
        t3 = far_eb007((unsigned char far *)B_901B, *(long *)((char *)&loc_8 + 0), (unsigned int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_10));
        dx2 = loc_10;
        dx3 = dx2 - *(int *)((char *)&loc_c + 0);
        loc_12 = (int)(((long)loc_e << 16 | (unsigned)dx2) - loc_c >> 16);
        loc_14 = dx3;
        if (arg_4 != 0) {
            if ((*(int *)((char *)&loc_c + 0) | loc_a) == 0 && TBL_8834.f_0 != 0x1000) {
                if (B_8A88 >= 98) {
                    B_8A88 = (unsigned char)98;
                }
                ax6 = B_8A88;
                cx3 = ax6;
                if (cx3 > 0) {
                    t6 = (long)(int)ax6 * 6L;
                    si4 = (int)t6;
                    di4 = (int near *)(TBL_882E + (int)t6);
                    while (si4 != 0) {
                        dx7 = *(int *)((char *)&TBL_882A + 0 + si4);
                        *(int *)((char *)&TBL_8832 + 0 + si4) = *(int *)((char *)&TBL_882C + 0 + si4);
                        *(int *)((char *)&TBL_8830 + 0 + si4) = dx7;
                        *(int *)((char *)&TBL_8834 + 0 + si4) = *di4;
                        si4 = si4 - 6;
                        di4 = di4 - 3;
                        cx3 = cx3 - 1;
                    }
                }
                B_8A88 = (unsigned char)(B_8A88 + 1);
                TBL_8832.f_0 = 0;
                TBL_8830.f_0 = 0;
                TBL_8834.f_0 = 0x1000;
            }
            cx4 = 1;
            si5 = (struct s1 near *)0x7c0c;
            loc_18 = B_8A88;
            while (loc_18 > cx4) {
                ax7 = *(int *)((char near *)si5 + 2);
                dx8 = *(int *)((char near *)si5);
                flags3 = ax7 - loc_a;
                if (!CC("<u", flags3) && (CC("!=", flags3) || dx8 >= (unsigned int)*(int *)((char *)&loc_c + 0))) {
                    dx9 = loc_14;
                    *(int *)((char near *)si5) = *(int *)((char near *)si5) + dx9;
                    *(int *)((char near *)si5 + 2) = (int)(si5->f_0 + ((long)loc_12 << 16 | (unsigned)dx9) >> 16);
                }
                si5 = (struct s1 near *)((char near *)si5 + 6);
                cx4 = cx4 + 1;
            }
        } else {
            cx = 0;
            for (;;) {
                ax = B_8A88;
                loc_18 = ax;
                if (ax <= cx) {
                    break;
                }
                t5 = (long)(int)cx * 6L;
                ax2 = *(int *)((char *)&TBL_8832 + 0 + (int)t5);
                flags = ax2 - loc_e;
                if (!CC("<u", flags) && (CC("!=", flags) || (unsigned int)*(int *)((char *)&TBL_8830 + 0 + (int)t5) >= loc_10)) {
                    break;
                }
                ax3 = *(int *)((char *)&TBL_8832 + 0 + (int)t5);
                flags2 = ax3 - loc_a;
                if (!CC("<u", flags2) && (CC("!=", flags2) || (unsigned int)*(int *)((char *)&TBL_8830 + 0 + (int)t5) >= (unsigned int)*(int *)((char *)&loc_c + 0))) {
                    loc_16 = cx + 1;
                    t4 = (long)(int)(cx + 1) * 6L;
                    arg_0 = (int)t4;
                    di2 = (int near *)((struct g_TBL_882A near *)((char near *)&TBL_882A + (int)t4) + 2);
                    while (loc_18 > loc_16) {
                        dx4 = *(int *)((char *)&TBL_8830 + 0 + arg_0);
                        *(int *)((char *)&TBL_882C + 0 + arg_0) = *(int *)((char *)&TBL_8832 + 0 + arg_0);
                        *(int *)((char *)&TBL_882A + 0 + arg_0) = dx4;
                        *di2 = *(int *)((char *)&TBL_8834 + 0 + arg_0);
                        arg_0 = arg_0 + 6;
                        di2 = di2 + 3;
                        loc_16 = loc_16 + 1;
                    }
                    B_8A88 = (unsigned char)(B_8A88 - 1);
                    cx = cx - 1;
                }
                cx = cx + 1;
            }
            si2 = (struct s1 near *)(struct g_TBL_8830 near *)((char near *)&TBL_8830 + cx * 6);
            while (loc_18 > cx) {
                dx6 = loc_14;
                *(int *)((char near *)si2) = *(int *)((char near *)si2) - dx6;
                *(int *)((char near *)si2 + 2) = (int)(si2->f_0 - ((long)loc_12 << 16 | (unsigned)dx6) >> 16);
                si2 = (struct s1 near *)((char near *)si2 + 6);
                cx = cx + 1;
            }
            if (B_8A88 != 0 && (TBL_8830.f_0 | TBL_8832.f_0) != 0) {
                if (B_8A88 >= 98) {
                    B_8A88 = (unsigned char)98;
                }
                ax4 = B_8A88;
                cx2 = ax4;
                if (cx2 > 0) {
                    ax5 = ax4 * 6;
                    si3 = ax5;
                    di3 = (int near *)(TBL_882E + ax5);
                    while (si3 != 0) {
                        dx5 = *(int *)((char *)&TBL_882A + 0 + si3);
                        *(int *)((char *)&TBL_8832 + 0 + si3) = *(int *)((char *)&TBL_882C + 0 + si3);
                        *(int *)((char *)&TBL_8830 + 0 + si3) = dx5;
                        *(int *)((char *)&TBL_8834 + 0 + si3) = *di3;
                        si3 = si3 - 6;
                        di3 = di3 - 3;
                        cx2 = cx2 - 1;
                    }
                }
                B_8A88 = (unsigned char)(B_8A88 + 1);
                TBL_8832.f_0 = 0;
                TBL_8830.f_0 = 0;
                TBL_8834.f_0 = 0x1000;
            }
        }
        t7 = (long)(int)B_8A88 * 6L;
        bx = W_903D;
        *(int *)((char *)&TBL_8832 + 0 + (int)t7) = W_903F;
        *(int *)((char *)&TBL_8830 + 0 + (int)t7) = bx;
        *(int *)((char *)&TBL_8834 + 0 + (int)t7) = 0;
    }
    return;
}
