/* differs: 308 at +0, 86 bytes; 311 at +0, 86 bytes; 312 at +0, 86 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_cdd04(void)
{
    int bx;
    int cx;

    bx = 32;
    do {
        cx = 8;
        do {
            outpw(96, bx + 0x6ff);
            outpw(98, 0);
            outpw(100, cx - 1 & -0x8000);
            cx = cx - 1;
        } while (cx != 0);
        if (bx != 1) {
            outpw(96, bx + 0x6ff);
            outpw(98, 0);
            outpw(100, 0);
        }
        bx = bx - 1;
    } while (bx != 0);
    return;
}
