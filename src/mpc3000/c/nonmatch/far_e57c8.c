/* differs: 308 at +5, 585 bytes; 311 at +5, 578 bytes; 312 at +5, 579 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char far *W_8C35;
extern int W_8C37;
extern long far far_e259f(int);

long far far_e57c8(int arg_0, int arg_2, long arg_4, int arg_6)
{
    char loc_16[22];
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
    int si;
    int si2;
    int si3;
    long t1;

    dx = arg_0;
    if (dx < 0) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    if (dx > 99) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    if (arg_2 > 99) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    t1 = far_e259f(dx);
    ax = (int)t1;
    if (ax != 0) {
        return (long)MK_FP((int)(t1 >> 16), -1);
    }
    si = 0;
    di = *(int *)((char *)&arg_4 + 0);
    do {
        es = arg_6;
        if (*(char far *)MK_FP(es, di) != 0) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, di));
            loc_16[si] = (char)ax;
            di = di + 1;
        } else {
            loc_16[si] = (char)32;
        }
        si = si + 1;
    } while (si < 16);
    loc_16[si] = (char)0;
    if (arg_2 < 0) {
        ax2 = W_8C37;
        si2 = *(int *)((char *)&W_8C35 + 0);
        cx = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 0, -1);
        dx2 = 17 - cx;
        if (cx > 17) {
            cx = cx + dx2;
            dx2 = 0;
        }
        cx2 = cx >> 1;
        __movs2(((long)ax2 << 16 | (unsigned)(si2 + 9)), MK_FP(SEG_STACK, si2 + 9), cx2 * 2);
        di2 = si2 + 9 + cx2 * 2;
        cx3 = cx & 1;
        __movs1(((long)ax2 << 16 | (unsigned)di2), MK_FP(SEG_STACK, si2 + 9 + cx2 * 2), cx3);
        __stos1(((long)ax2 << 16 | (unsigned)(di2 + cx3)), 0, dx2);
        return ((long)dx2 << 16 | (unsigned)0);
    }
    dx3 = *(int *)((char *)&W_8C35 + 0);
    ax3 = (int)(((long)W_8C37 << 16 | (unsigned)dx3) + 0x151L >> 16);
    *(int *)((char *)&loc_16 + 20) = ax3;
    *(int *)((char *)&loc_16 + 18) = dx3 + 0x151;
    dx4 = ((char)(dx3 + 0x151 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&W_8C35 + 0) + 336));
    for (;;) {
        ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)(char)dx4);
        dx4 = ((char)(dx4 >> 8) << 8 | (unsigned char)((char)dx4 - 1));
        if ((char)ax4 == 0) {
            break;
        }
        es2 = (int)(*(long *)((char *)&loc_16 + 18) >> 16);
        ax3 = (unsigned char)*(char far *)MK_FP(es2, (int)*(long *)((char *)&loc_16 + 18));
        if (ax3 == arg_2) {
            goto L1;
        }
        *(int *)((char *)&loc_16 + 18) = *(int *)((char *)&loc_16 + 18) + 24;
    }
    return ((long)dx4 << 16 | (unsigned)-5);
L1:
    di3 = *(int *)((char *)&loc_16 + 18);
    cx4 = ~__repne_scas1((int)arg_4, 0, -1);
    ax5 = arg_6;
    si3 = *(int *)((char *)&arg_4 + 0);
    dx5 = 16 - cx4;
    if (cx4 > 16) {
        cx4 = cx4 + dx5;
        dx5 = 0;
    }
    cx5 = cx4 >> 1;
    __movs2(MK_FP(es2, di3 + 5), ((long)ax5 << 16 | (unsigned)si3), cx5 * 2);
    di4 = di3 + 5 + cx5 * 2;
    cx6 = cx4 & 1;
    __movs1(MK_FP(es2, di4), ((long)ax5 << 16 | (unsigned)(si3 + cx5 * 2)), cx6);
    __stos1(MK_FP(es2, di4 + cx6), 0, dx5);
    return ((long)dx5 << 16 | (unsigned)0);
}
