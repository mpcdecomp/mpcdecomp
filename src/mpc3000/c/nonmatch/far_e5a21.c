/* differs: matches beside its same-file callees (the stubs) */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_F750;
extern int far far_e59bd(void);
int far far_e59bd(void) { return 0; }

void far far_e5a21(void)
{
    int ax;

    B_F750 = (char)0;
    far_e59bd();
    return;
}
