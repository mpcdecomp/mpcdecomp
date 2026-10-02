#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_cdc78(int);

void far far_c46ab(void)
{
    int si;
    long t1;

    si = 0;
    do {
        t1 = far_cdc78(si);
        si = si + 1;
    } while (si < 32);
    return;
}
