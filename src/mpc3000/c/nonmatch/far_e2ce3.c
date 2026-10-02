/* differs: 308 at +0, 211 bytes; 311 at +0, 210 bytes; 312 at +0, 211 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901B;
extern int W_8C31;
extern int W_8C33;
extern int W_8C3D;
extern int W_8C3F;
extern int W_9021;
extern int W_9023;
extern int W_9025;
extern int W_9027;
extern unsigned int W_902D;
extern int W_902F;
extern unsigned int W_9031;
extern int W_9033;
extern long far far_daa07(int, int, int, int);

long far far_e2ce3(void)
{
    int ax;
    unsigned int cx;
    int flags;
    long t1;
    long t2;

    if (B_901B == 0) {
        ax = W_9033;
        flags = ax - W_902F;
        if (!CC("<u", flags) && (CC("!=", flags) || W_9031 >= W_902D)) {
            t1 = far_daa07(W_9021, W_9023, W_9031, W_9033);
            t2 = far_daa07(W_902D, W_902F, W_9025, W_9027);
            cx = (int)t1 + (int)t2;
            return ((long)((int)(t1 >> 16) + (int)(t2 >> 16) + (cx < (unsigned int)(int)t1)) << 16 | (unsigned)cx);
        }
        return far_daa07(W_902D, W_902F, W_9031, W_9033);
    }
    return far_daa07(W_8C3D, W_8C3F, W_8C31, W_8C33);
}
