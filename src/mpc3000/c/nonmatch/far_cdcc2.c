/* differs: 308 at +0, 81 bytes; 311 at +0, 81 bytes; 312 at +0, 81 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_cdcc2(void)
{
    int bx;
    int cx;

    cx = 32;
    do {
        outpw(96, cx + 255);
        outpw(98, 0);
        outpw(100, -1);
        outpw(102, 15);
        if (bx != 1) {
            outpw(96, cx + 0x9ff);
            outpw(98, 3);
            outpw(100, 0);
        }
        cx = cx - 1;
    } while (cx != 0);
    return;
}
