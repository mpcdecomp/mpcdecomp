/* differs: 308 at +0, 18 bytes; 311 at +0, 18 bytes; 312 at +0, 18 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void near fn_ead18(void)
{
    int ax;
    int bx;
    int cx;

    cx = 0;
    for (;;) {
        bx = bx + 2;
        if (*(int far *)MK_FP(ax, bx) == 0) {
            cx = cx - 1;
            if (cx == 0) {
                break;
            }
            continue;
        }
        break;
    }
    return;
}
