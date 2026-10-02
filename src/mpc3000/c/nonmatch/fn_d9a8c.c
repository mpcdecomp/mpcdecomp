/* differs: 308 at +5, 232 bytes; 311 at +5, 232 bytes; 312 at +5, 231 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
struct g_W_902D {
    long f_0;
};
extern char B_901B;
extern char B_901C;
extern int W_9029;
extern int W_902B;
extern struct g_W_902D W_902D;
extern int W_902F;
extern int W_9035;
extern int W_9037;
extern int W_904D;
extern long far far_e56a0(char, int, long, int, int);
extern long far fn_d9a44(long);
long far fn_d9a44(long p0) { return 0; }

long far fn_d9a8c(char far *arg_0, int arg_2, int arg_4)
{
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int di;
    int dx;
    int es;
    long t1;
    long t2;

    if (B_901B != 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    loc_2 = arg_4 - 1;
    di = *(int *)((char *)&arg_0 + 0) + loc_2;
    while (loc_2 >= 0) {
        t2 = fn_d9a44(W_902D.f_0);
        dx = (int)(t2 >> 16);
        W_902F = dx;
        *(int *)((char *)&W_902D + 0) = (int)t2;
        *(char far *)((char far *)W_902D.f_0) = *(char far *)MK_FP(arg_2, di);
        di = di - 1;
        loc_2 = loc_2 - 1;
    }
    ax = (unsigned char)*arg_0 & 248;
    if (ax == 168) {
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        ax2 = (int)((unsigned char)*(char far *)MK_FP(es, bx + 2) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 1) << 1) >> 1;
        dx = (int)(far_e56a0(B_901C, ax2, W_902D.f_0, 0, 0) >> 16);
        if (ax2 == W_904D) {
            dx = *(int *)((char *)&W_902D + 0);
            W_9037 = W_902F;
            W_9035 = dx;
        }
    } else if (ax == 248) {
        t1 = far_e56a0(B_901C, 0, W_902D.f_0, 0, 0);
        dx = *(int *)((char *)&W_902D + 0);
        W_902B = W_902F;
        W_9029 = dx;
    }
    return ((long)dx << 16 | (unsigned)arg_4);
}
