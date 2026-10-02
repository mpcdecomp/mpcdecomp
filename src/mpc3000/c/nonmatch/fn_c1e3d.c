/* differs: matches beside its same-file callees (the stubs) */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_96EF;
extern long far fn_c1deb(void);
extern long far fn_c1e77(int, int);
long far fn_c1deb(void) { return 0; }

long far fn_c1e3d(void)
{
    long t1;
    long t2;
    long t3;
    long t4;

    B_96EF = (char)1;
    t1 = fn_c1e77(0, 50);
    t2 = fn_c1e77(1, 7);
    t3 = fn_c1e77(2, 29);
    t4 = fn_c1e77(3, 63);
    return fn_c1deb();
}
long far fn_c1e77(int p0, int p1) { return 0; }
