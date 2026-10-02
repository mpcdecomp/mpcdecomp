/* differs: 308 at +0, 43 bytes; 311 at +0, 43 bytes; 312 at +0, 43 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_7AC6;
extern int W_7AC8;

void far far_d4f81(void)
{
    W_7AC6 = *(int far *)MK_FP(0, 0x100);
    W_7AC8 = *(int far *)MK_FP(0, 0x102);
    *(int far *)MK_FP(0, 0x100) = 42;
    *(int far *)MK_FP(0, 0x102) = 0xde1b /* SEG_D4E7 */;
    return;
}
