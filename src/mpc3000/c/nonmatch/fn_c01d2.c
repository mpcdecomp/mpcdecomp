/* differs: matches beside its same-file callees (the stubs) */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_EFB0;
extern long far far_b1073(int);
extern int far fn_c0180(void);
int far fn_c0180(void) { return 0; }

long far fn_c01d2(void)
{
    B_EFB0 = (char)fn_c0180();
    return far_b1073(11);
}
