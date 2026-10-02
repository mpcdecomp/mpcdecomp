/* differs: 308 absent; 311 at +5, 343 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
struct g_TBL_8AA1 {
    int f_0;
};
struct g_TBL_8AA3 {
    int f_0;
};
struct g_W_8C35 {
    long f_0;
};
extern char B_8AA0;
extern struct g_TBL_8AA1 TBL_8AA1;
extern struct g_TBL_8AA3 TBL_8AA3;
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern int W_8C39;
extern int W_8C3B;
extern int W_9021;
extern int W_9023;
extern long far far_da9b8(int, int);
extern long far far_daa59(int, int);
extern long far far_e26cc(long);
extern long far far_e26fb(long);

long far far_e259f(unsigned char arg_0)
{
    unsigned char loc_2;
    char loc_1;
    int ax;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int dx;
    int dx2;
    int p12;
    int p14;
    int p16;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    if (B_8AA0 == 0) {
        goto L1;
    }
    ax = arg_0 << 2;
    dx = *(int *)((char *)&TBL_8AA1 + 0 + ax);
    W_8C37 = *(int *)((char *)&TBL_8AA3 + 0 + ax);
    *(int *)((char *)&W_8C35 + 0) = dx;
    if ((*(int *)((char *)&W_8C35 + 0) | W_8C37) == 0) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)0);
L1:
    t1 = far_daa59(W_8C39, W_8C3B);
    cx = UNDEF;
    dx2 = (int)(t1 >> 16);
    W_8C37 = dx2;
    *(int *)((char *)&W_8C35 + 0) = (int)t1;
    loc_2 = (unsigned char)0;
    goto L2;
L3:
    bx = (int)W_8C35.f_0;
    loc_1 = *(char far *)MK_FP((int)(W_8C35.f_0 >> 16), bx);
    cx2 = ((char)(cx >> 8) << 8 | (unsigned char)loc_1);
    cx3 = ((char)(cx2 >> 8) << 8 | (unsigned char)((char)cx2 & 127));
    if ((unsigned char)(char)cx3 >= 100) {
        goto L4;
    }
    dx2 = W_8C37;
    si = (unsigned char)(char)cx3 << 2;
    *(int *)((char *)&TBL_8AA3 + 0 + si) = dx2;
    *(int *)((char *)&TBL_8AA1 + 0 + si) = bx;
L4:
    if ((char)cx3 != arg_0) {
        goto L5;
    }
    return ((long)dx2 << 16 | (unsigned)0);
L5:
    if ((unsigned char)(char)cx3 <= arg_0) {
        goto L6;
    }
    return ((long)dx2 << 16 | (unsigned)-1);
L6:
    if ((loc_1 & -128) == 0) {
        goto L7;
    }
    t2 = far_daa59(W_9021, W_9023);
    cx = UNDEF;
    dx2 = (int)(t2 >> 16);
    W_8C37 = dx2;
    *(int *)((char *)&W_8C35 + 0) = (int)t2;
    goto L8;
L7:
    t3 = far_e26fb(W_8C35.f_0);
    p16 = 0xe292;
    t4 = far_e26cc(W_8C35.f_0);
    p12 = W_8C37;
    p14 = *(int *)((char *)&W_8C35 + 0);
    t5 = far_da9b8(p14, p12);
    cx = UNDEF;
    dx2 = (int)(t5 >> 16);
    W_8C37 = dx2;
    *(int *)((char *)&W_8C35 + 0) = (int)t5;
L8:
    loc_2 = (unsigned char)(loc_2 + 1);
L2:
    if (loc_2 > arg_0) {
        goto L9;
    }
    goto L3;
L9:
    return ((long)dx2 << 16 | (unsigned)-1);
}
long far far_e26cc(long p0) { return 0; }
long far far_e26fb(long p0) { return 0; }
