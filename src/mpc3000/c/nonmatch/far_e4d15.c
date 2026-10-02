/* differs: 308 at +5, 663 bytes; 311 at +5, 659 bytes; 312 at +5, 659 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[16];
    char f_10;
};
extern char B_8A9F;
extern char TBL_90C1[];
extern char far *W_8C35;
extern int W_8C37;
extern long far far_e259f();
extern int far far_e4e74();

long far far_e4d15(int arg_0, int arg_2, struct s1 far *arg_4, int arg_6)
{
    int loc_2;
    long loc_4;
    int loc_6;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    unsigned int cx;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
    int di;
    int di2;
    int di3;
    int di4;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int es;
    int es2;
    int es3;
    int es4;
    int si;
    int si2;
    long t1;
    int t2;

    if (arg_0 < 0) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    if (arg_0 > 99) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    t1 = far_e259f(*(char *)((char *)&arg_0 + 0));
    if ((int)t1 != 0) {
        di = FP_OFF(arg_4);
        es = FP_SEG(arg_4);
        __movs2(MK_FP(es, di), MK_FP(SEG_DATA, 0x7254), 16);
        *(char far *)MK_FP(es, di + 16) = *(char *)(0x7264);
        return (long)MK_FP((int)(t1 >> 16), 1);
    }
    if (*(char *)((char *)&arg_2 + 0) < 0) {
        es2 = (int)(*(long *)((char *)&W_8C35 + 0) >> 16);
        ax = arg_6;
        si = *(int *)((char *)&arg_4 + 0);
        cx = ~__repne_scas1(MK_FP(es2, (int)*(long *)((char *)&W_8C35 + 0) + 9), 0, -1);
        dx2 = 16 - cx;
        if (cx > 16) {
            cx = cx + dx2;
            dx2 = 0;
        }
        cx2 = cx >> 1;
        __movs2(((long)ax << 16 | (unsigned)si), MK_FP(es2, si), cx2 * 2);
        di2 = si + cx2 * 2;
        cx3 = cx & 1;
        __movs1(((long)ax << 16 | (unsigned)di2), MK_FP(es2, si + cx2 * 2), cx3);
        __stos1(((long)ax << 16 | (unsigned)(di2 + cx3)), 0, dx2);
        arg_4->f_10 = (char)0;
        return ((long)dx2 << 16 | (unsigned)0);
    }
    dx3 = *(int *)((char *)&W_8C35 + 0);
    ax2 = (int)(((long)W_8C37 << 16 | (unsigned)dx3) + 0x151L >> 16);
    loc_2 = ax2;
    *(int *)((char *)&loc_4 + 0) = dx3 + 0x151;
    dx4 = ((char)(dx3 + 0x151 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&W_8C35 + 0) + 336));
    for (;;) {
        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)(char)dx4);
        dx4 = ((char)(dx4 >> 8) << 8 | (unsigned char)((char)dx4 - 1));
        if ((char)ax3 == 0) {
            break;
        }
        es4 = (int)(loc_4 >> 16);
        ax2 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es4, (int)loc_4));
        if ((char)ax2 == *(char *)((char *)&arg_2 + 0)) {
            goto L1;
        }
        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 24;
    }
    if (B_8A9F == arg_0) {
        ax4 = *(char *)((char *)&arg_2 + 0);
        loc_6 = ax4;
        if ((TBL_90C1[ax4] & 2) != 0) {
            t2 = far_e4e74(arg_4, ax4);
            return ((long)UNDEF << 16 | (unsigned)0);
        }
L2:
        di3 = FP_OFF(arg_4);
        es3 = FP_SEG(arg_4);
        __movs2(MK_FP(es3, di3), MK_FP(SEG_DATA, 0x7254), 16);
        *(char far *)MK_FP(es3, di3 + 16) = *(char *)(0x7264);
        return ((long)dx4 << 16 | (unsigned)1);
    }
    goto L2;
L1:
    ax5 = arg_6;
    si2 = *(int *)((char *)&arg_4 + 0);
    cx4 = ~__repne_scas1(MK_FP(es4, *(int *)((char *)&loc_4 + 0) + 5), 0, -1);
    dx5 = 16 - cx4;
    if (cx4 > 16) {
        cx4 = cx4 + dx5;
        dx5 = 0;
    }
    cx5 = cx4 >> 1;
    __movs2(((long)ax5 << 16 | (unsigned)si2), MK_FP(es4, si2), cx5 * 2);
    di4 = si2 + cx5 * 2;
    cx6 = cx4 & 1;
    __movs1(((long)ax5 << 16 | (unsigned)di4), MK_FP(es4, si2 + cx5 * 2), cx6);
    __stos1(((long)ax5 << 16 | (unsigned)(di4 + cx6)), 0, dx5);
    arg_4->f_10 = (char)0;
    return ((long)dx5 << 16 | (unsigned)0);
}
int far far_e4e74(struct s1 far *p0, int p1) { return 0; }
