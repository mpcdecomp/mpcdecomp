/* differs: 308 at +3, 133 bytes; 311 at +3, 133 bytes; 312 at +3, 133 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
extern char B_E558;
extern int W_E551;
extern int W_E555;
extern int far far_b1ae0(int);
extern long far fn_b1b5f(int);
long far fn_b1b5f(int p0) { return 0; }

long far fn_b1b9a(char far *arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int es;

    W_E555 = ~__repne_scas1(arg_0, 0, -1) - 1;
    ax = (int)fn_b1b5f(0 - (B_E558 != 0) + 1);
    while (*arg_0 != 0) {
        ax2 = W_E551;
        W_E551 = W_E551 - 1;
        if (ax2 == 0) {
            break;
        }
        bx = FP_OFF(arg_0);
        es = FP_SEG(arg_0);
        *(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) + 1;
        ax3 = far_b1ae0(*(char far *)MK_FP(es, bx));
    }
    W_E555 = ~__repne_scas1(arg_0, 0, -1) - 1;
    return fn_b1b5f(B_E558);
}
