/* differs: 308 at +2, 2 bytes; 311 at +2, 2 bytes; 312 at +2, 2 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_E263[];
extern unsigned char TBL_E2A3[];

int far far_cc60f(void)
{
    int ax;
    int near *si;

    ax = 0;
    si = (int near *)TBL_E263;
L1:
    if (*si == 0) {
        goto L2;
    }
    return 1;
L2:
    si = si + 1;
    ax = ax + 1;
    if (si != (int near *)TBL_E2A3) {
        goto L1;
    }
    return 0;
}
