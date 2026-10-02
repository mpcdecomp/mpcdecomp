/* differs: 308 at +0, 57 bytes; 311 at +0, 57 bytes; 312 at +0, 57 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long near fn_d9980(void)
{
    int bx;
    int dx;
    int es;
    int si;

    dx = *(int far *)MK_FP(es, si + 2);
    if (dx != 0) {
        bx = *(int far *)MK_FP(es, si + 6);
        if (bx == 0) {
            bx = *(int far *)MK_FP(es, si);
        }
        return ((long)(dx - 1) << 16 | (unsigned)(unsigned char)*(char far *)MK_FP(es, bx + 7 + si));
    }
    return ((long)dx << 16 | (unsigned)-1);
}
