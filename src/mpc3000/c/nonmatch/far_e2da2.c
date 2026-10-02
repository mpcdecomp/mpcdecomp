/* differs: 308 at +3, 2555 bytes; 311 at +3, 2555 bytes; 312 at +3, 2557 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct s1 {
    char pad_0[1];
    char f_1;
};
extern int W_8814;
extern unsigned int W_9021;
extern int W_9023;
extern int W_9025;
extern int W_9027;
extern unsigned int W_9029;
extern int W_902B;
extern unsigned int W_902D;
extern int W_902F;
extern unsigned int W_9031;
extern int W_9033;
extern unsigned int W_9035;
extern int W_9037;
extern int W_904B;
extern int W_9055;
extern void far far_da25f();
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_dad54(int);
extern long far far_e56a0(int, int, long);
extern long far far_e570d(char, int);

void far far_e2da2(struct s1 far *arg_0, int arg_4)
{
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    unsigned int loc_8;
    int loc_6;
    unsigned int loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    int ax18;
    int ax19;
    int ax2;
    int ax20;
    int ax21;
    int ax22;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int es;
    int flags;
    int flags10;
    int flags11;
    int flags12;
    int flags13;
    int flags14;
    int flags15;
    int flags16;
    int flags17;
    int flags18;
    int flags19;
    int flags2;
    int flags20;
    int flags21;
    int flags22;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int flags7;
    int flags8;
    int flags9;
    int p34;
    int p342;
    int p36;
    int p362;
    int p38;
    int p382;
    int p40;
    int p402;
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
    long t19;
    long t2;
    long t20;
    long t21;
    long t22;
    int t23;
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
    long t33;
    int t34;
    long t35;
    long t36;
    long t37;
    long t38;
    long t39;
    long t4;
    long t40;
    long t41;
    long t42;
    long t43;
    long t44;
    long t5;
    int t6;
    long t7;
    int t8;
    long t9;

    t1 = far_e570d(arg_0->f_1, arg_4);
    loc_2 = (int)(t1 >> 16);
    loc_4 = (int)t1;
    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    if (*(char far *)MK_FP(es, bx) > 0) {
        *(int far *)MK_FP(es, bx + 20) = loc_2;
        *(int far *)MK_FP(es, bx + 18) = loc_4;
        return;
    }
    W_8814 = W_8814 + W_9055;
    t2 = far_dad54(1);
    W_9055 = 0;
    ax = W_9033;
    flags = ax - W_902F;
    if (CC("<=u", flags)) {
        if (!CC("!=", flags) && W_9031 > W_902D) {
            goto L1;
        }
        ax5 = loc_2;
        flags5 = ax5 - W_9033;
        if (CC("<=u", flags5)) {
            if (!CC("!=", flags5) && loc_4 > W_9031) {
                goto L2;
            }
            t31 = far_daa07(W_9031, W_9033, loc_4, loc_2);
            loc_a = (int)(t31 >> 16);
            loc_c = (int)t31;
            t32 = far_da9e4(W_902D, W_902F, -1, -1);
            t33 = far_da9e4(W_9031, W_9033, -1, -1);
            p382 = (int)(t33 >> 16);
            p402 = (int)t33;
            far_da25f(((long)p382 << 16 | (unsigned)p402));
            p342 = W_902F;
            p362 = W_902D;
            t35 = far_daa07(p362, p342, W_9031, W_9033);
            loc_12 = (int)(t35 >> 16);
            loc_14 = (int)t35;
            ax12 = W_902B;
            flags12 = ax12 - W_9033;
            if (!CC(">u", flags12) && (CC("!=", flags12) || W_9029 <= W_9031)) {
                ax13 = W_902B;
                flags13 = ax13 - loc_2;
                if (!CC("<u", flags13) && (CC("!=", flags13) || W_9029 >= loc_4)) {
                    p342 = W_902B;
                    p362 = W_9029;
                    t36 = far_da9e4(p362, p342, loc_14, loc_12);
                    W_902B = (int)(t36 >> 16);
                    W_9029 = (int)t36;
                }
            }
            si3 = 0;
            while (si3 <= W_904B) {
                t44 = far_e570d(0, si3);
                loc_6 = (int)(t44 >> 16);
                loc_8 = (int)t44;
                ax21 = loc_6;
                flags21 = ax21 - loc_2;
                if (!CC("<u", flags21) && (CC("!=", flags21) || loc_8 >= loc_4)) {
                    ax22 = loc_6;
                    flags22 = ax22 - W_9033;
                    if (!CC(">u", flags22) && (CC("<u", flags22) || loc_8 < W_9031)) {
                        t37 = far_da9e4(loc_8, loc_6, loc_14, loc_12);
                        p342 = (int)(t37 >> 16);
                        p362 = (int)t37;
                        p382 = si3;
                        p402 = 0;
                        t38 = far_e56a0(p402, p382, ((long)p342 << 16 | (unsigned)p362));
                    }
                }
                si3 = si3 + 1;
            }
            t39 = far_e570d(0, 0);
            loc_6 = (int)(t39 >> 16);
            loc_8 = (int)t39;
            ax14 = loc_6;
            flags14 = ax14 - loc_2;
            if (!CC("<u", flags14) && (CC("!=", flags14) || loc_8 >= loc_4)) {
                ax15 = loc_6;
                flags15 = ax15 - W_9033;
                if (!CC(">u", flags15) && (CC("<u", flags15) || loc_8 < W_9031)) {
                    t40 = far_da9e4(loc_8, loc_6, loc_14, loc_12);
                    t41 = far_e56a0(0, 0, t40);
                }
            }
            ax16 = W_9037;
            flags16 = ax16 - loc_2;
            if (!CC("<u", flags16) && (CC("!=", flags16) || W_9035 >= loc_4)) {
                ax17 = W_9037;
                flags17 = ax17 - W_9033;
                if (!CC(">u", flags17) && (CC("<u", flags17) || W_9035 < W_9031)) {
                    t42 = far_da9e4(W_9035, W_9037, loc_14, loc_12);
                    W_9037 = (int)(t42 >> 16);
                    W_9035 = (int)t42;
                }
            }
            dx2 = loc_c;
            t43 = far_da9e4(W_902D, W_902F, -dx2, -loc_a - (dx2 != 0));
            W_902F = (int)(t43 >> 16);
            W_902D = (int)t43;
            W_9033 = loc_2;
            W_9031 = loc_4;
        } else {
L2:
            t22 = far_daa07(loc_4, loc_2, W_902D, W_902F);
            loc_e = (int)(t22 >> 16);
            loc_10 = (int)t22;
            p38 = W_902F;
            p40 = W_902D;
            far_da25f(((long)p38 << 16 | (unsigned)p40), *(long *)((char *)&W_9031 + 0), t22);
            p34 = W_902F;
            p36 = W_902D;
            t24 = far_daa07(p36, p34, W_9031, W_9033);
            loc_16 = -(int)(t24 >> 16) - ((int)t24 != 0);
            loc_18 = -(int)t24;
            ax6 = W_902B;
            flags6 = ax6 - W_902F;
            if (!CC("<u", flags6) && (CC("!=", flags6) || W_9029 >= W_902D)) {
                ax7 = W_902B;
                flags7 = ax7 - loc_2;
                if (!CC(">u", flags7) && (CC("<u", flags7) || W_9029 < loc_4)) {
                    p34 = W_902B;
                    p36 = W_9029;
                    t25 = far_da9e4(p36, p34, loc_18, loc_16);
                    W_902B = (int)(t25 >> 16);
                    W_9029 = (int)t25;
                }
            }
            si2 = 0;
            while (si2 <= W_904B) {
                t30 = far_e570d(0, si2);
                loc_6 = (int)(t30 >> 16);
                loc_8 = (int)t30;
                ax10 = loc_6;
                flags10 = ax10 - W_902F;
                if (!CC("<u", flags10) && (CC("!=", flags10) || loc_8 >= W_902D)) {
                    ax11 = loc_6;
                    flags11 = ax11 - loc_2;
                    if (!CC(">u", flags11) && (CC("<u", flags11) || loc_8 < loc_4)) {
                        t26 = far_da9e4(loc_8, loc_6, loc_18, loc_16);
                        p34 = (int)(t26 >> 16);
                        p36 = (int)t26;
                        p38 = si2;
                        p40 = 0;
                        t27 = far_e56a0(p40, p38, ((long)p34 << 16 | (unsigned)p36));
                    }
                }
                si2 = si2 + 1;
            }
            ax8 = W_9037;
            flags8 = ax8 - W_902F;
            if (!CC("<u", flags8) && (CC("!=", flags8) || W_9035 >= W_902D)) {
                ax9 = W_9037;
                flags9 = ax9 - loc_2;
                if (!CC(">u", flags9) && (CC("<u", flags9) || W_9035 < loc_4)) {
                    t28 = far_da9e4(W_9035, W_9037, loc_18, loc_16);
                    W_9037 = (int)(t28 >> 16);
                    W_9035 = (int)t28;
                }
            }
            t29 = far_da9e4(W_9031, W_9033, loc_10, loc_e);
            W_9033 = (int)(t29 >> 16);
            W_9031 = (int)t29;
            W_902F = loc_2;
            W_902D = loc_4;
        }
    } else {
L1:
        t3 = far_daa07(W_9031, W_9033, loc_4, loc_2);
        loc_a = (int)(t3 >> 16);
        loc_c = (int)t3;
        t4 = far_da9e4(W_9021, W_9023, -1, -1);
        t5 = far_da9e4(W_9031, W_9033, -1, -1);
        far_da25f(t5);
        t7 = far_daa07(loc_4, loc_2, W_902D, W_902F);
        loc_e = (int)(t7 >> 16);
        loc_10 = (int)t7;
        far_da25f(*(long *)((char *)&W_902D + 0), *(long *)((char *)&W_9025 + 0), t7);
        t9 = far_daa07(W_9021, W_9023, W_9031, W_9033);
        loc_12 = (int)(t9 >> 16);
        loc_14 = (int)t9;
        t10 = far_daa07(W_902D, W_902F, W_9025, W_9027);
        loc_16 = -(int)(t10 >> 16) - ((int)t10 != 0);
        loc_18 = -(int)t10;
        ax2 = W_902B;
        flags2 = ax2 - loc_2;
        if (CC("<u", flags2) || !CC("!=", flags2) && W_9029 < loc_4) {
            t12 = far_da9e4(W_9029, W_902B, loc_18, loc_16);
            W_902B = (int)(t12 >> 16);
            W_9029 = (int)t12;
        } else {
            t11 = far_da9e4(W_9029, W_902B, loc_14, loc_12);
            W_902B = (int)(t11 >> 16);
            W_9029 = (int)t11;
        }
        si = 0;
        while (si <= W_904B) {
            t21 = far_e570d(0, si);
            loc_6 = (int)(t21 >> 16);
            loc_8 = (int)t21;
            ax4 = loc_6;
            flags4 = ax4 - loc_2;
            if (CC("<u", flags4) || !CC("!=", flags4) && loc_8 < loc_4) {
                t15 = far_da9e4(loc_8, loc_6, loc_18, loc_16);
                t16 = far_e56a0(0, si, t15);
            } else {
                t13 = far_da9e4(loc_8, loc_6, loc_14, loc_12);
                t14 = far_e56a0(0, si, t13);
            }
            si = si + 1;
        }
        ax3 = W_9037;
        flags3 = ax3 - loc_2;
        if (CC("<u", flags3) || !CC("!=", flags3) && W_9035 < loc_4) {
            t18 = far_da9e4(W_9035, W_9037, loc_18, loc_16);
            W_9037 = (int)(t18 >> 16);
            W_9035 = (int)t18;
        } else {
            t17 = far_da9e4(W_9035, W_9037, loc_14, loc_12);
            W_9037 = (int)(t17 >> 16);
            W_9035 = (int)t17;
        }
        t19 = far_da9e4(W_9025, W_9027, loc_10, loc_e);
        W_9033 = (int)(t19 >> 16);
        W_9031 = (int)t19;
        dx = loc_c;
        t20 = far_da9e4(W_9021, W_9023, -dx, -loc_a - (dx != 0));
        W_902F = (int)(t20 >> 16);
        W_902D = (int)t20;
    }
    ax18 = W_902B;
    flags18 = ax18 - W_9023;
    if (!CC("<u", flags18) && (CC("!=", flags18) || W_9029 >= W_9021)) {
        dx3 = W_9025;
        W_902B = W_9027;
        W_9029 = dx3;
    }
    ax19 = W_902F;
    flags19 = ax19 - W_9023;
    if (!CC("<u", flags19) && (CC("!=", flags19) || W_902D >= W_9021)) {
        dx4 = W_9025;
        W_902F = W_9027;
        W_902D = dx4;
    }
    ax20 = W_9033;
    flags20 = ax20 - W_9023;
    if (!CC("<u", flags20) && (CC("!=", flags20) || W_9031 >= W_9021)) {
        dx5 = W_9025;
        W_9033 = W_9027;
        W_9031 = dx5;
    }
    if (W_902B == W_902F && W_9029 == W_902D) {
        dx6 = W_9031;
        W_902B = W_9033;
        W_9029 = dx6;
    }
    return;
}
