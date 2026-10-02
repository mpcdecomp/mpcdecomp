/* differs: 308 at +0, 50 bytes; 311 at +0, 50 bytes; 312 at +0, 50 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int near fn_f9e85(void)
{
    int ax;
    int bp;

    if ((unsigned char)*(char far *)MK_FP(SEG_STACK, bp + 2) <= 3) {
        *(char *)0x7 = (char)0;
        return;
    }
    *(char *)0x7 = (char)1;
    return ((char)(ax >> 8) << 8 | (unsigned char)0);
}
