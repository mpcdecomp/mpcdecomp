/* differs: 308 at +5, 878 bytes; 311 at +5, 874 bytes; 312 at +5, 877 bytes */
extern char B_8802;
extern char B_8AA0;
extern char B_8C42;
extern char B_901B;
extern char B_901C;
extern int W_8C31;
extern int W_8C33;
extern int W_8C3D;
extern unsigned int W_9021;
extern int W_9023;
extern unsigned int W_9025;
extern int W_9027;
extern unsigned int W_902D;
extern int W_902F;
extern unsigned int W_9031;
extern int W_9033;
extern void far far_da25f();
extern long far far_da9b8(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_daa3c(int, int);

void far far_e6d33(unsigned int arg_0, int arg_2)
{
    unsigned int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int dx;
    int dx2;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    long t1;
    long t10;
    int t11;
    long t12;
    int t13;
    long t14;
    long t15;
    int t16;
    long t17;
    int t18;
    long t19;
    long t2;
    long t20;
    long t21;
    int t22;
    int t3;
    long t4;
    long t5;
    long t6;
    int t7;
    long t8;
    long t9;

    B_901C = (char)(B_901C & -3);
    B_8C42 = (char)(B_8C42 & -3);
    B_8802 = (char)0;
    B_8AA0 = (char)0;
    t1 = far_daa3c(arg_0, arg_2);
    arg_2 = (int)(t1 >> 16);
    arg_0 = (int)t1;
    if (B_901B < 0) {
        t2 = far_daa07(W_8C31, W_8C33, (int)t1, (int)(t1 >> 16));
        loc_2 = (int)(t2 + 1L >> 16);
        loc_4 = (int)t2 + 1;
        flags = loc_2;
        if (!CC(">", flags) && (CC("<", flags) || loc_4 < 0)) {
            return;
        }
        far_da25f(*(long *)((char *)&W_8C31 + 0), *(long *)((char *)&W_8C3D + 0), *(long *)((char *)&loc_4 + 0));
        return;
    }
    ax = W_9033;
    flags2 = ax - W_902F;
    if (CC("<=u", flags2)) {
        if (!CC("<u", flags2) && W_9031 >= W_902D) {
            goto L1;
        }
        ax4 = arg_2;
        flags5 = ax4 - W_902F;
        if (!CC("<u", flags5) && (CC("!=", flags5) || arg_0 >= W_902D)) {
            t17 = far_daa07(arg_0, arg_2, W_902D, W_902F);
            far_da25f(*(long *)((char *)&W_902D + 0), *(long *)((char *)&W_9031 + 0), t17);
            return;
        }
        ax5 = arg_2;
        flags6 = ax5 - W_9033;
        if (CC(">u", flags6) || !CC("!=", flags6) && arg_0 > W_9031) {
            return;
        }
        t19 = far_daa07(W_9031, W_9033, arg_0, arg_2);
        t20 = far_da9b8(W_902D, W_902F, -1, -1);
        t21 = far_da9b8(W_9031, W_9033, -1, -1);
        far_da25f(t21);
        return;
    }
L1:
    ax2 = arg_2;
    flags3 = ax2 - W_9023;
    if (CC(">=u", flags3)) {
        if (!CC("!=", flags3) && arg_0 < W_9021) {
            goto L2;
        }
        t12 = far_daa07(W_9031, W_9033, W_902D, W_902F);
        loc_2 = (int)(t12 >> 16);
        loc_4 = (int)t12;
        far_da25f(*(long *)((char *)&W_902D + 0), *(long *)((char *)&W_9025 + 0), t12);
        t14 = far_daa07(arg_0, arg_2, W_9021, W_9023);
        t15 = far_da9b8(W_9025, W_9027, loc_4, loc_2);
        far_da25f(*(long *)((char *)&W_9021 + 0), t15);
        return;
    }
L2:
    ax3 = arg_2;
    flags4 = ax3 - W_9027;
    if (!CC("<=u", flags4)) {
L3:
        return;
    }
    if (!CC("!=", flags4) && arg_0 > W_9025) {
        goto L3;
    }
    t4 = far_daa07(W_9031, W_9033, W_902D, W_902F);
    loc_2 = (int)(t4 >> 16);
    loc_4 = (int)t4;
    t5 = far_da9b8(W_9021, W_9023, -1, -1);
    t6 = far_da9b8(W_9031, W_9033, -1, -1);
    far_da25f(t6);
    t8 = far_daa07(W_9025, W_9027, arg_0, arg_2);
    dx = loc_4;
    dx2 = -dx;
    t9 = far_da9b8(W_9021, W_9023, dx2 - 1, (int)(((long)(-loc_2 - (dx != 0)) << 16 | (unsigned)dx2) - 1L >> 16));
    t10 = far_da9b8(W_9025, W_9027, -1, -1);
    far_da25f(t10);
    return;
}
