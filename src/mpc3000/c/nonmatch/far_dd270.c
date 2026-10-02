/* differs: 308 at +3, 569 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
struct g_TBL_9831 {
    int f_0;
};
struct g_TBL_981B {
    int f_0;
};
struct g_TBL_9807 {
    int f_0;
};
extern struct g_TBL_9807 TBL_9807;
extern char TBL_9808[];
extern struct g_TBL_981B TBL_981B;
extern struct g_TBL_9831 TBL_9831;
extern unsigned char TBL_dd250[];
extern int W_982F;
extern long far far_dd1c5();

long far far_dd270(long arg_0, int arg_4, int arg_6)
{
    char loc_a;
    char loc_9;
    char loc_8[8];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int bx3;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int cx5;
    int cx6;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int p10;
    int p12;
    int p8;
    int si;
    long t1;
    long t2;
    long t3;

    dx = arg_6 - 1;
    if (dx >= 0) {
        goto L1;
    }
    goto L2;
L1:
    si = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
    ax3 = (((char)ax & -16) << 8 | (unsigned char)(char)ax);
    if ((char)(ax3 >> 8) == -112) {
        goto L3;
    }
    goto L4;
L3:
    cx4 = ((unsigned char)*(char far *)MK_FP(es, si + 1) << 1) + ((char)dx << 8 | (unsigned char)(char)dx);
    dx4 = *(int far *)MK_FP(0xe58a, (unsigned int)(unsigned)(TBL_dd250 + -192 + ((ax3 & 15) << 1)));
    if ((*(int *)((char *)&TBL_9831 + 0 + cx4) & dx4) != 0) {
        goto L5;
    }
    *(int *)((char *)&TBL_9831 + 0 + cx4) = *(int *)((char *)&TBL_9831 + 0 + cx4) | dx4;
    goto L6;
L5:
    ax5 = *(int far *)MK_FP(es, si) & -241 | arg_6 - 1 << 4;
    cx5 = W_982F;
    bx2 = 0;
L7:
    if (*(int *)((char *)&TBL_981B + 0 + bx2) == ax5) {
        goto L8;
    }
    bx2 = bx2 + 2;
    cx5 = cx5 - 1;
    if (cx5 != 0) {
        goto L7;
    }
    cx6 = W_982F;
    bx3 = 0;
L9:
    if (*(int *)((char *)&TBL_981B + 0 + bx3) == -1) {
        goto L10;
    }
    bx3 = bx3 + 2;
    cx6 = cx6 - 1;
    if (cx6 != 0) {
        goto L9;
    }
    ax6 = (*(char far *)MK_FP(es, si + 1) << 8 | (unsigned char)(*(char far *)MK_FP(es, si) & 15 | -128));
    loc_a = (char)ax6;
    loc_9 = (char)(ax6 >> 8);
    loc_8[0] = (char)64;
    t2 = far_dd1c5(((long)3 << 16 | (unsigned)UNDEF), arg_6, p12, p10);
    es = UNDEF;
    goto L6;
L8:
    *(char *)((char *)&TBL_9807 + 0 + bx2) = (char)(*(char *)((char *)&TBL_9807 + 0 + bx2) + 1);
    if (*(char *)((char *)&TBL_9807 + 0 + bx2) != -1) {
        goto L11;
    }
    *(char *)((char *)&TBL_9807 + 0 + bx2) = (char)(*(char *)((char *)&TBL_9807 + 0 + bx2) - 1);
L11:
    goto L6;
L10:
    *(int *)((char *)&TBL_9807 + 0 + bx3) = 2;
    *(int *)((char *)&TBL_981B + 0 + bx3) = ax5;
    goto L6;
L4:
    if ((char)(ax3 >> 8) != -128) {
        goto L6;
    }
    dx = arg_6 - 1 << 4;
    ax4 = *(int far *)MK_FP(es, si) & -241 | dx;
    cx = W_982F;
    bx = 0;
L12:
    if (*(int *)((char *)&TBL_981B + 0 + bx) == ax4) {
        goto L13;
    }
    bx = bx + 2;
    cx = cx - 1;
    if (cx != 0) {
        goto L12;
    }
    goto L14;
L13:
    TBL_9808[bx] = (char)(TBL_9808[bx] + 1);
    ax2 = *(int *)((char *)&TBL_9807 + 0 + bx);
    if ((unsigned char)(char)(ax2 >> 8) < (unsigned char)(char)ax2) {
        goto L2;
    }
    *(int *)((char *)&TBL_981B + 0 + bx) = -1;
    p8 = (unsigned char)(char)(ax2 >> 8);
L15:
    cx2 = p8 - 1;
    if (cx2 == 0) {
        goto L14;
    }
    p8 = cx2;
    t1 = far_dd1c5(MK_FP(es, si), arg_4, arg_6);
    bx = UNDEF;
    es = UNDEF;
    goto L15;
L14:
    dx2 = arg_6;
    dx3 = ((char)dx2 - 1 << 8 | (unsigned char)((char)dx2 - 1));
    cx3 = ((unsigned char)*(char far *)MK_FP(es, si + 1) << 1) + ((char)(dx3 >> 8) << 8 | (unsigned char)(char)(dx3 >> 8));
    *(int *)((char *)&TBL_9831 + 0 + cx3) = *(int *)((char *)&TBL_9831 + 0 + cx3) & ~*(int far *)MK_FP(0xe58a, (unsigned int)(unsigned)(TBL_dd250 + -192 + ((((char)(bx >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si)) & 15) << 1)));
L6:
    t3 = far_dd1c5(MK_FP(es, si), arg_4, arg_6);
    ax2 = (int)t3;
    dx = (int)(t3 >> 16);
L2:
    return ((long)dx << 16 | (unsigned)ax2);
}
