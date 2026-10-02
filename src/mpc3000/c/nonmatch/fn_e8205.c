/* differs: 308 at +0, 46 bytes; 311 at +0, 46 bytes; 312 at +0, 46 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_744A;

long interrupt far fn_e8205(void)
{
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_744A) = (char)1;
    outp(-0x3ff0, (char)99);
    return 0L;
}
