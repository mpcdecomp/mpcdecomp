/* differs: 308 at +5, 637 bytes; 311 at +5, 629 bytes; 312 at +5, 628 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901C;
extern char TBL_90C1[];
extern char far *W_8C35;
extern int W_8C37;
extern long far far_e49b0(int);
extern long far far_e57c8(int, int, long);
extern long far far_e76cd(int);
extern void far fn_e50b8(void);

long far far_e4f54(int arg_0, int arg_2, int arg_4, int arg_6)
{
    char loc_16[22];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx2;
    unsigned int cx;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
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
    long t2;
    long t3;
    int t4;

    if (arg_2 > 99) {
        return ((long)dx << 16 | (unsigned)-6);
    }
    t1 = far_e49b0(arg_0);
    if ((int)t1 != 0) {
        return t1;
    }
    bx = arg_2;
    TBL_90C1[bx] = (char)(TBL_90C1[bx] | 2);
    t2 = far_e57c8(arg_0, bx, *(long *)((char *)&arg_4 + 0));
    ax = (int)t2;
    dx2 = (int)(t2 >> 16);
    if (ax != -5) {
        goto L1;
    }
    si = 0;
    di2 = arg_4;
    do {
        es = arg_6;
        if (*(char far *)MK_FP(es, di2) != 0) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, di2));
            loc_16[si] = (char)ax;
            di2 = di2 + 1;
        } else {
            loc_16[si] = (char)32;
        }
        si = si + 1;
    } while (si < 16);
    loc_16[si] = (char)0;
    dx3 = *(int *)((char *)&W_8C35 + 0);
    ax2 = (int)(((long)W_8C37 << 16 | (unsigned)dx3) + 0x151L >> 16);
    *(int *)((char *)&loc_16 + 20) = ax2;
    *(int *)((char *)&loc_16 + 18) = dx3 + 0x151;
    dx4 = ((char)(dx3 + 0x151 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&W_8C35 + 0) + 336));
    for (;;) {
        ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)(char)dx4);
        dx4 = ((char)(dx4 >> 8) << 8 | (unsigned char)((char)dx4 - 1));
        if ((char)ax2 == 0) {
            break;
        }
        bx2 = (int)*(long *)((char *)&loc_16 + 18);
        es2 = (int)(*(long *)((char *)&loc_16 + 18) >> 16);
        if (*(char far *)MK_FP(es2, bx2) == -1) {
            goto L2;
        }
        *(int *)((char *)&loc_16 + 18) = *(int *)((char *)&loc_16 + 18) + 24;
    }
    t3 = far_e76cd(3);
    if ((int)t3 != 0) {
        return (long)MK_FP((int)(t3 >> 16), -3);
    }
    *(char far *)((char far *)*(long *)((char *)&loc_16 + 18)) = *(char *)((char *)&arg_2 + 0);
    ax3 = *(int *)((char *)&loc_16 + 20);
    si2 = *(int *)((char *)&loc_16 + 18);
    cx = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 0, -1);
    dx2 = 16 - cx;
    if (cx > 16) {
        cx = cx + dx2;
        dx2 = 0;
    }
    cx2 = cx >> 1;
    __movs2(((long)ax3 << 16 | (unsigned)(si2 + 5)), MK_FP(SEG_STACK, si2 + 5), cx2 * 2);
    di3 = si2 + 5 + cx2 * 2;
    cx3 = cx & 1;
    __movs1(((long)ax3 << 16 | (unsigned)di3), MK_FP(SEG_STACK, si2 + 5 + cx2 * 2), cx3);
    __stos1(((long)ax3 << 16 | (unsigned)(di3 + cx3)), 0, dx2);
    if ((B_901C & 2) != 0) {
        fn_e50b8();
        dx2 = UNDEF;
    }
L1:
    return ((long)dx2 << 16 | (unsigned)0);
L2:
    *(char far *)MK_FP(es2, bx2) = *(char *)((char *)&arg_2 + 0);
    ax4 = *(int *)((char *)&loc_16 + 20);
    si3 = *(int *)((char *)&loc_16 + 18);
    cx4 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 0, -1);
    dx5 = 16 - cx4;
    if (cx4 > 16) {
        cx4 = cx4 + dx5;
        dx5 = 0;
    }
    cx5 = cx4 >> 1;
    __movs2(((long)ax4 << 16 | (unsigned)(si3 + 5)), MK_FP(SEG_STACK, si3 + 5), cx5 * 2);
    di4 = si3 + 5 + cx5 * 2;
    cx6 = cx4 & 1;
    __movs1(((long)ax4 << 16 | (unsigned)di4), MK_FP(SEG_STACK, si3 + 5 + cx5 * 2), cx6);
    __stos1(((long)ax4 << 16 | (unsigned)(di4 + cx6)), 0, dx5);
    return ((long)dx5 << 16 | (unsigned)0);
}
void far fn_e50b8(void) { }
