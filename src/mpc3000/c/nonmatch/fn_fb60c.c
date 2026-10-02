/* differs: 308 at +0, 3 bytes; 311 at +0, 3 bytes; 312 at +0, 3 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far fn_fb60c(void)
{
    return SEG_STACK;
}
