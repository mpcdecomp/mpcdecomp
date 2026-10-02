/* differs: 308 at +0, 24 bytes; 311 at +0, 24 bytes; 312 at +0, 24 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7143;

int far fn_d6987(void)
{
    int ax;
    int si;

    si = 0;
    do {
        ax = *(int far *)MK_FP(0, si);
        si = si + 2;
    } while ((B_7143 & 1) != 0);
    return ax;
}
