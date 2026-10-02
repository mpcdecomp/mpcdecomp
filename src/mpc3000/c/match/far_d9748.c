#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8817;
extern char B_9052;
extern char B_D4BE;
extern int W_8818;
extern int W_9053;

void far far_d9748(void)
{
    W_8818 = W_9053;
    B_8817 = B_9052;
    B_D4BE = (char)80;
    return;
}
