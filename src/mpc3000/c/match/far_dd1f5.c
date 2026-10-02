#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_943C;
extern char B_943D;
extern char B_943E;
extern char TBL_943B;

void far far_dd1f5(void)
{
    while ((TBL_943B & 2) != 0 || (B_943C & 2) != 0 || ((B_943D & 2) != 0 || (B_943E & 2) != 0)) {
    }
    return;
}
