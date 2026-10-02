#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_F77B;
extern char B_F77E;
extern unsigned char B_F77F;

int far fn_e7623(void)
{
    if (B_F77B == 71) {
        goto L1;
    }
    return 0;
L1:
    if (B_F77E == 69) {
        goto L2;
    }
    if (B_F77E != 70) {
        goto L3;
    }
L2:
    return B_F77F;
L3:
    return 0;
}
