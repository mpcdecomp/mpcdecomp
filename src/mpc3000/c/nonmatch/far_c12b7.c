/* differs: matches beside its same-file callees (the stubs) */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far fn_c1e77(int, int);

void far far_c12b7(void)
{
    int si;
    long t1;
    long t2;
    long t3;

    t1 = fn_c1e77(10, 0);
    t2 = fn_c1e77(11, 0);
    si = 0;
    do {
        t3 = fn_c1e77(12, 0);
        si = si + 1;
    } while (si < 0x780);
    return;
}
long far fn_c1e77(int p0, int p1) { return 0; }
