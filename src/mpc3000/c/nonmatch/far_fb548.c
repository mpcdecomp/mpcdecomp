/* differs: 308 at +0, 15 bytes; 311 at +0, 15 bytes; 312 at +0, 15 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_fb548(void)
{
    return *(int far *)((char far *)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) + 12);
}
