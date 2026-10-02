/* differs: 308 at +1, 45 bytes; 311 at +1, 45 bytes; 312 at +1, 45 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long interrupt far isr_fa04b(void)
{
    *(char far *)MK_FP(0x6dd, 0x9) = (char)1;
    outp(-0x3ff0, (char)99);
    return 0L;
}
