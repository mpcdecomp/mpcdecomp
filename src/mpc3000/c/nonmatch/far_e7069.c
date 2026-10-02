/* differs: matches beside its same-file callees (the stubs) */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_e60f0(void);
extern long far far_e6fef(void);
long far far_e6fef(void) { return 0; }

long far far_e7069(void)
{
    long t1;

    t1 = far_e6fef();
    return far_e60f0();
}
