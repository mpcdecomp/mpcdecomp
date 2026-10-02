/* differs: 308 at +5, 1278 bytes; 311 at +5, 1281 bytes; 312 at +5, 1280 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[4];
    int f_4;
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
extern unsigned char B_8A88;
extern char B_901B;
extern int TBL_882E;
extern struct g_TBL_8830 TBL_8830;
extern struct g_TBL_8832 TBL_8832;
extern struct g_TBL_8834 TBL_8834;
extern char far *W_901D;
extern int W_901F;
extern unsigned int W_9021;
extern int W_9023;
extern unsigned int W_9025;
extern int W_9027;
extern unsigned int W_9029;
extern int W_902B;
extern unsigned int W_902D;
extern int W_902F;
extern unsigned int W_9031;
extern int W_9033;
extern int W_9039;
extern int W_903B;
extern long far far_da25f();
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_e2ce3(void);
extern long far far_fa0c8();

long far far_e76cd(int arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    char loc_c[6];
    unsigned int loc_e;
    int loc_10;
    long loc_12;
    int loc_14;
    struct s1 far *loc_16;
    int loc_18;
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
    unsigned int bx2;
    unsigned int bx3;
    int bx4;
    int bx5;
    unsigned int cx;
    unsigned int cx2;
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int flags7;
    int si;
    int si2;
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
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    if (B_901B == 0) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)0);
L1:
    loc_4 = *(char far *)((char far *)*(long *)((char *)&W_901D + 0) + 336);
    if (arg_0 >= 0) {
        goto L2;
    }
    arg_0 = 0;
L2:
    ax = 99 - loc_4;
    loc_18 = ax;
    if (ax >= arg_0) {
        goto L3;
    }
    arg_0 = ax;
L3:
    loc_2 = *(char far *)((char far *)*(long *)((char *)&W_901D + 0) + 335);
    loc_6 = B_8A88 + 1 - loc_2;
    ax2 = arg_0;
    t1 = far_fa0c8(24, ax2, -(ax2 < 0));
    ax3 = loc_6;
    t2 = far_fa0c8(6, ax3, -(ax3 < 0), (int)(t1 >> 16), (int)t1);
    cx = (int)t1 + (int)t2;
    *(int *)((char *)&loc_c + 0) = (int)(t1 >> 16) + (int)(t2 >> 16) + (cx < (unsigned int)(int)t1);
    loc_e = cx;
    if ((loc_e | *(int *)((char *)&loc_c + 0)) != 0) {
        goto L4;
    }
    goto L5;
L4:
    t3 = far_e2ce3();
    cx2 = loc_e;
    bx = *(int *)((char *)&loc_c + 0) + (cx2 + 100 < cx2);
    flags = (int)(t3 >> 16) - bx;
    if (CC(">", flags)) {
        goto L6;
    }
    if (CC("<", flags)) {
        goto L7;
    }
    if ((unsigned int)(int)t3 >= cx2 + 100) {
        goto L6;
    }
L7:
    return (long)MK_FP((int)(t3 >> 16), -3);
L6:
    ax4 = W_9033;
    flags2 = ax4 - W_902F;
    if (CC(">=u", flags2)) {
        goto L8;
    }
    goto L9;
L8:
    if (CC(">u", flags2)) {
        goto L10;
    }
    if (W_9031 > W_902D) {
        goto L10;
    }
    goto L9;
L10:
    t4 = far_daa07(W_9021, W_9023, W_9031, W_9033);
    t5 = far_daa07(W_9031, W_9033, W_902D, W_902F);
    t6 = far_da9e4(W_9021, W_9023, -1, -1);
    t7 = far_da9e4(W_9031, W_9033, -1, -1);
    t8 = far_da25f(t7);
    dx2 = W_9025;
    W_9033 = W_9027;
    W_9031 = dx2;
    t9 = far_da9e4(W_9029, W_902B, (int)t4, (int)(t4 >> 16));
    W_902B = (int)(t9 >> 16);
    W_9029 = (int)t9;
    ax5 = W_902B;
    flags3 = ax5 - W_9023;
    if (CC("<u", flags3)) {
        goto L11;
    }
    if (CC("!=", flags3)) {
        goto L12;
    }
    if (W_9029 < W_9021) {
        goto L11;
    }
L12:
    dx3 = W_9025;
    W_902B = W_9027;
    W_9029 = dx3;
L11:
    t10 = far_da9e4(W_902D, W_902F, (int)t4, (int)(t4 >> 16));
    W_902F = (int)(t10 >> 16);
    W_902D = (int)t10;
    ax6 = W_902F;
    flags4 = ax6 - W_9023;
    if (CC("<u", flags4)) {
        goto L9;
    }
    if (CC("!=", flags4)) {
        goto L13;
    }
    if (W_902D < W_9021) {
        goto L9;
    }
L13:
    dx4 = W_9025;
    W_902F = W_9027;
    W_902D = dx4;
L9:
    flags5 = *(int *)((char *)&loc_c + 0);
    if (CC("<", flags5)) {
        goto L14;
    }
    if (CC("!=", flags5)) {
        goto L15;
    }
    if (loc_e < 0) {
        goto L14;
    }
L15:
    t11 = far_daa07(W_9031, W_9033, W_9025, W_9027);
    dx5 = loc_e;
    t12 = far_da9e4(W_9031, W_9033, dx5 - 1, (int)(((long)*(int *)((char *)&loc_c + 0) << 16 | (unsigned)dx5) - 1L >> 16));
    t13 = far_da9e4(W_9031, W_9033, -1, -1);
    t14 = far_da25f(t13);
    goto L16;
L14:
    t15 = far_daa07(W_9031, W_9033, W_9025, W_9027);
    t16 = far_da9e4(W_9025, W_9027, loc_e, *(int *)((char *)&loc_c + 0));
    t17 = far_da25f(*(long *)((char *)&W_9025 + 0), t16);
L16:
    t18 = far_da9e4(W_9025, W_9027, loc_e, *(int *)((char *)&loc_c + 0));
    W_9027 = (int)(t18 >> 16);
    W_9025 = (int)t18;
    ax7 = W_902B;
    flags6 = ax7 - W_9033;
    if (CC(">u", flags6)) {
        goto L17;
    }
    if (CC("!=", flags6)) {
        goto L18;
    }
    if (W_9029 > W_9031) {
        goto L17;
    }
L18:
    t19 = far_da9e4(W_9029, W_902B, loc_e, *(int *)((char *)&loc_c + 0));
    W_902B = (int)(t19 >> 16);
    W_9029 = (int)t19;
L17:
    t20 = far_da9e4(W_9031, W_9033, loc_e, *(int *)((char *)&loc_c + 0));
    W_9033 = (int)(t20 >> 16);
    W_9031 = (int)t20;
    ax8 = W_902F;
    flags7 = ax8 - W_9027;
    if (CC(">u", flags7)) {
        goto L5;
    }
    if (CC("<u", flags7)) {
        goto L19;
    }
    if (W_902D >= W_9025) {
        goto L5;
    }
L19:
    dx6 = W_9025;
    W_902F = W_9027;
    W_902D = dx6;
L5:
    bx2 = (int)*(long *)((char *)&W_901D + 0);
    es = (int)(*(long *)((char *)&W_901D + 0) >> 16);
    *(char far *)MK_FP(es, bx2 + 0x150) = (char)(*(char *)((char *)&loc_4 + 0) + *(char *)((char *)&arg_0 + 0));
    *(char far *)MK_FP(es, bx2 + 0x14f) = (char)(B_8A88 + 1);
    bx3 = bx2 + loc_4 * 24;
    loc_10 = W_901F + (bx3 < bx2) + (bx3 + 0x151 < bx3);
    *(int *)((char *)&loc_12 + 0) = bx3 + 0x151;
    si = 0;
    if (si >= arg_0) {
        goto L20;
    }
L21:
    es2 = (int)(loc_12 >> 16);
    __stos2(MK_FP(es2, (int)loc_12), 0, 24);
    *(char far *)MK_FP(es2, *(int *)((char *)&loc_12 + 0)) = (char)-1;
    *(int *)((char *)&loc_12 + 0) = *(int *)((char *)&loc_12 + 0) + 24;
    si = si + 1;
    if (si < arg_0) {
        goto L21;
    }
L20:
    loc_14 = loc_10;
    *(int *)((char *)&loc_16 + 0) = *(int *)((char *)&loc_12 + 0);
    bx4 = (int)loc_12;
    es3 = (int)(loc_12 >> 16);
    dx7 = W_9039;
    *(int far *)MK_FP(es3, bx4 + 2) = W_903B;
    *(int far *)MK_FP(es3, bx4) = dx7;
    loc_16->f_4 = TBL_882E;
    si2 = 0;
    di = 0;
    ax9 = B_8A88;
    goto L22;
L23:
    *(int *)((char *)&loc_16 + 0) = *(int *)((char *)&loc_16 + 0) + 6;
    dx7 = *(int *)((char *)&TBL_8830 + 0 + di);
    bx5 = FP_OFF(loc_16);
    es4 = FP_SEG(loc_16);
    *(int far *)MK_FP(es4, bx5 + 2) = *(int *)((char *)&TBL_8832 + 0 + di);
    *(int far *)MK_FP(es4, bx5) = dx7;
    *(int far *)MK_FP(es4, bx5 + 4) = *(int *)((char *)&TBL_8834 + 0 + di);
    di = di + 6;
    si2 = si2 + 1;
L22:
    if (ax9 > si2) {
        goto L23;
    }
    return ((long)dx7 << 16 | (unsigned)0);
}
