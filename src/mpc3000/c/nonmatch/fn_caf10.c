/* differs: 308 at +0, 9 bytes; 311 at +0, 9 bytes; 312 at +0, 9 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void near fn_caf10(void)
{
    int cx;

    cx = 0x5000;
    do {
        cx = cx - 1;
    } while (cx != 0);
    return;
}
