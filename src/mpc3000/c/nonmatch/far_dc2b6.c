/* differs: 308 at +0, 15 bytes; 311 at +0, 15 bytes; 312 at +0, 15 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_F2B6;
extern int W_F2B8;

int far far_dc2b6(void)
{
    W_F2B6 = 0;
    W_F2B8 = 0;
    return 0;
}
