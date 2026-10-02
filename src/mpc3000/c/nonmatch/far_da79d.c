/* differs: 308 at +0, 21 bytes; 311 at +0, 21 bytes; 312 at +0, 21 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_da79d(void)
{
    if (*(char far *)MK_FP(-0xc00, 0x3fe) == -86) {
        *(char far *)MK_FP(-0xc00, 0x3fe) = (char)68;
    }
    return;
}
