/* differs: 308 at +0, 10 bytes; 311 at +0, 10 bytes; 312 at +0, 10 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_d7b2c(void)
{
    return *(int far *)MK_FP(-0x7ff0, 0x12c8);
}
