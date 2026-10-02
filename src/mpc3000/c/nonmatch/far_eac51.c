/* differs: 308 at +44, 32 bytes; 311 at +23, 34 bytes; 312 at +23, 34 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FCA;
extern char B_7FCB;
extern char B_7FD1;
extern char B_D60A;
extern int W_D657;
extern int W_D659;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int, int);
extern int far far_de88f(int, int, int);

void far far_eac51(void)
{
    int ax;
    int ax2;
    int t1;
    int t2;

    t1 = far_b1ad0(5, 31);
    if (B_D60A != 0 && B_7FD1 != 1 && B_7FD1 != 2) {
        far_b1b05(MK_FP(SEG_DATA, 0x6d3b));
        return;
    }
    t2 = far_de88f(W_D657, B_7FCA, B_7FCB);
    W_D659 = t2;
    far_b1d48(MK_FP(SEG_DATA, 0x6d41), W_D659 / 10, t2 % 10);
    return;
}
