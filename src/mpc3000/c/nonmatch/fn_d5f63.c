/* differs: 308 at +0, 6 bytes; 311 at +0, 6 bytes; 312 at +0, 6 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_fb672(void);

long near fn_d5f63(void)
{
    return far_fb672();
}
