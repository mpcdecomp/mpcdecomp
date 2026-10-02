/* differs: 308 at +5, 412 bytes; 311 at +5, 413 bytes; 312 at +5, 414 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9A;
extern unsigned char B_901B[];
extern int W_8C35;
extern int W_8C37;
extern int W_901D;
extern int W_901F;
extern int W_9025;
extern int W_9027;
extern int W_9029;
extern int W_902B;
extern int W_902D;
extern int W_902F;
extern int W_9031;
extern int W_9033;
extern int W_903D;
extern int W_903F;
extern int W_904B;
extern long far far_da9e4(int, int, int, int);
extern long far far_e259f(char);
extern long far far_e26cc(long);
extern long far far_e2ce3(int);
extern int far far_e344a(unsigned char far *);
extern long far far_e49b0(void);

long far far_e12dc(char arg_0)
{
    char loc_4[4];
    int loc_6;
    char loc_7;
    char loc_a[3];
    long loc_c;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int cx;
    int di;
    int dx;
    int dx2;
    int es;
    int flags;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;

    t1 = far_e259f(arg_0);
    if ((int)t1 != 0) {
        return (long)MK_FP((int)(t1 >> 16), -1);
    }
    t2 = far_e26cc(*(long *)((char *)&W_8C35 + 0));
    t3 = far_e2ce3(0);
    flags = 0 - (int)(t3 >> 16);
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)((int)t2 + 0x190) > (unsigned int)(int)t3)) {
        return ((long)((int)t2 + 0x190) << 16 | (unsigned)-3);
    }
    loc_6 = B_8A9A;
    t4 = far_e49b0();
    *(int *)((char *)&loc_4 + 0) = (int)t4;
    if ((int)t4 != 0) {
        return t4;
    }
    B_8A9A = *(char *)((char *)&loc_6 + 0);
    dx = W_901D;
    *(int *)((char *)&loc_a + 0) = W_901F;
    *(int *)((char *)&loc_c + 0) = dx;
    t5 = far_e259f(arg_0);
    bx = (int)loc_c;
    es = (int)(loc_c >> 16);
    loc_7 = *(char far *)MK_FP(es, bx);
    di = *(int *)((char *)&loc_c + 0);
    ax = W_8C37;
    si = W_8C35;
    cx = (unsigned int)(int)t2 >> 1;
    __movs2(MK_FP(es, di), ((long)ax << 16 | (unsigned)si), cx * 2);
    __movs1(MK_FP(es, di + cx * 2), ((long)ax << 16 | (unsigned)(si + cx * 2)), (int)t2 & 1);
    *(char far *)MK_FP(es, bx) = loc_7;
    *(int far *)MK_FP(es, bx + 3) = 0;
    *(int far *)MK_FP(es, bx + 1) = 0;
    far_e344a((unsigned char far *)B_901B);
    t6 = far_da9e4(W_901D, W_901F, (int)t2, 0);
    W_9027 = (int)(t6 >> 16);
    W_9025 = (int)t6;
    ax3 = W_9027;
    dx2 = W_9025;
    W_902B = ax3;
    W_9029 = dx2;
    W_9033 = ax3;
    W_9031 = dx2;
    W_902F = ax3;
    W_902D = dx2;
    W_904B = 0;
    W_903F = 0;
    W_903D = 0;
    return ((long)dx2 << 16 | (unsigned)0);
}
