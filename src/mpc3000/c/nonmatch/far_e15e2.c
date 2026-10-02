/* differs: 308 absent; 311 absent; 312 at +5, 784 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
struct g_W_8C35 {
    long f_0;
};
struct g_W_903D {
    long f_0;
};
extern char B_8289;
extern char B_8800;
extern char B_8802;
extern char B_8806;
extern char B_8A9F;
extern char B_8C41;
extern char B_901B;
extern char B_901C;
extern char B_9457;
extern char B_D612;
extern int W_8281;
extern int W_8283;
extern int W_8814;
extern int W_8C31;
extern int W_8C33;
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern int W_8C3D;
extern int W_8C3F;
extern int W_901D;
extern int W_901F;
extern int W_9021;
extern int W_9023;
extern int W_9025;
extern int W_9027;
extern int W_9029;
extern int W_902B;
extern int W_902D;
extern int W_902F;
extern int W_9031;
extern int W_9033;
extern struct g_W_903D W_903D;
extern int W_903F;
extern int W_904B;
extern int W_904D;
extern int W_9055;
extern int W_9059;
extern void far far_cb3de(long);
extern long far far_cb3f9(long);
extern long far far_d9b6e(int, char far *, int);
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_dad54(int);
extern void far far_db240(int, int);
extern int far far_e0031(char far *);
extern long far far_e188c(char far *);
extern long far far_e259f(char);
extern int far far_e4ee4(long, int);
extern long far far_e51be(char far *, int, int);
extern long far far_e5a99(char far *);
extern long far far_e6d33(int, int);

long far far_e15e2(unsigned int arg_0)
{
    int loc_14;
    int loc_12;
    char far *loc_10;
    int loc_e;
    char far *loc_c;
    int loc_a;
    char loc_8[3];
    char loc_5;
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
    int di;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int es;
    int es2;
    int si;
    int si2;
    int si3;
    long t1;
    long t10;
    long t11;
    int t12;
    long t13;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    if (arg_0 > 99) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    t1 = far_e259f(*(char *)((char *)&arg_0 + 0));
    if ((int)t1 == 0) {
        return (long)MK_FP((int)(t1 >> 16), -2);
    }
    *(int *)((char *)&loc_8 + 0) = 0;
    if (B_8C41 >= 0) {
        *(int *)((char *)&loc_8 + 0) = 1;
        ax = far_e0031((char far *)&B_8C41);
    }
    if (B_901B >= 0) {
        ax2 = far_e0031((char far *)&B_901B);
    }
    B_8800 = (char)0;
    t2 = far_e259f(*(char *)((char *)&arg_0 + 0));
    t3 = far_daa07(W_8C3D, W_8C3F, W_8C31, W_8C33);
    loc_2 = (int)(t3 >> 16);
    loc_4 = (int)t3;
    if ((int)(t3 >> 16) <= 0 && ((int)(t3 >> 16) < 0 || (unsigned int)(int)t3 < 0x317)) {
        B_9457 = (char)(B_9457 | 4);
        return (long)MK_FP((int)(t3 >> 16), -3);
    }
    B_8802 = (char)0;
    ax3 = W_8C37;
    dx2 = *(int *)((char *)&W_8C35 + 0);
    W_901F = ax3;
    W_901D = dx2;
    t4 = far_e6d33(dx2, ax3);
    dx3 = *(int *)((char *)&W_8C35 + 0);
    loc_a = W_8C37;
    *(int *)((char *)&loc_c + 0) = dx3;
    di = (int)W_8C35.f_0;
    es = (int)(W_8C35.f_0 >> 16);
    __stos2(MK_FP(es, di), 0, 0x186);
    *(char far *)MK_FP(es, di + 0x186) = (char)0;
    *loc_c = (char)(*(char *)((char *)&arg_0 + 0) | -128);
    far_e4ee4(((long)loc_a << 16 | (unsigned)(*(int *)((char *)&loc_c + 0) + 9)), arg_0);
    bx = FP_OFF(loc_c);
    es2 = FP_SEG(loc_c);
    *(int far *)MK_FP(es2, bx + 27) = 1;
    *(char far *)MK_FP(es2, bx + 0x14f) = (char)1;
    *(char far *)MK_FP(es2, bx + 0x150) = (char)2;
    loc_12 = loc_a;
    loc_14 = *(int *)((char *)&loc_c + 0) + 42;
    si = 0;
    do {
        ax5 = loc_14;
        loc_14 = loc_14 + 4;
        far_cb3de(((long)loc_12 << 16 | (unsigned)ax5));
        si = si + 1;
    } while (si < 64);
    t6 = far_cb3f9(((long)loc_a << 16 | (unsigned)(*(int *)((char *)&loc_c + 0) + 0x12a)));
    *(int *)((char *)&loc_c + 0) = *(int *)((char *)&loc_c + 0) + 0x151;
    loc_e = loc_a;
    *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_c + 0);
    si2 = 0;
    do {
        *loc_10 = (char)-1;
        *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) + 24;
        si2 = si2 + 1;
    } while (si2 < 2);
    t7 = far_da9e4(*(int *)((char *)&W_8C35 + 0), W_8C37, 0x187, 0);
    W_9027 = (int)(t7 >> 16);
    W_9025 = (int)t7;
    W_902B = (int)(t7 >> 16);
    W_9029 = (int)t7;
    W_9033 = (int)(t7 >> 16);
    W_9031 = (int)t7;
    W_902F = (int)(t7 >> 16);
    W_902D = (int)t7;
    t8 = far_da9e4(*(int *)((char *)&W_8C35 + 0), W_8C37, loc_4, loc_2);
    W_9023 = (int)(t8 >> 16);
    W_9021 = (int)t8;
    W_9055 = 0;
    W_8814 = 0;
    B_901B = (char)0;
    W_904B = W_8281;
    W_903F = 0;
    *(int *)((char *)&W_903D + 0) = 0;
    si3 = 1;
    while (si3 <= W_8281) {
        far_db240(1, si3);
        ax7 = W_9059;
        *(int *)((char *)&W_903D + 0) = *(int *)((char *)&W_903D + 0) + ax7;
        W_903F = (int)(W_903D.f_0 + (long)(int)ax7 >> 16);
        W_8814 = W_9059;
        t13 = far_dad54(1);
        si3 = si3 + 1;
    }
    loc_5 = (char)-1;
    t9 = far_d9b6e(1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), 1);
    dx4 = W_9031;
    W_902B = W_9033;
    W_9029 = dx4;
    t10 = far_e188c((char far *)&B_901B);
    B_D612 = (char)1;
    t11 = far_e5a99((char far *)&B_901B);
    B_901C = (char)(B_901C | B_8289);
    W_904D = W_8283;
    B_8A9F = *(char *)((char *)&arg_0 + 0);
    far_e0031((char far *)&B_901B);
    dx5 = (int)(far_e51be((char far *)&B_901B, arg_0, 0) >> 16);
    if (*(int *)((char *)&loc_8 + 0) != 0) {
        dx5 = (int)(far_e51be((char far *)&B_8C41, B_8806, 1) >> 16);
    }
    return ((long)dx5 << 16 | (unsigned)0);
}
long far far_e188c(char far *p0) { return 0; }
