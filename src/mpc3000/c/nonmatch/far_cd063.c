/* differs: 308 at +2, 24 bytes; 311 at +2, 26 bytes; 312 at +2, 26 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long far far_cd063(void)
{
    int dx;
    int si;

    dx = 0;
    si = 0x4800;
L1:
    if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, si) != 0) {
        goto L2;
    }
    return ((long)dx << 16 | (unsigned)dx);
L2:
    si = si + 36;
    dx = dx + 1;
    if (si != 0x5a00) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)-1);
}
