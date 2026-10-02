/* differs: 308 at +0, 40 bytes; 311 at +0, 40 bytes; 312 at +0, 40 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D4BE;
extern int W_12C8;
extern int W_12CA;
extern int W_12CC;

int far far_d78b2(void)
{
    int ax;

    _disable();
    W_12C8 = 0;
    W_12CA = 0;
    W_12CC = 0;
    B_D4BE = (char)0;
    __insn("popf", __flags(0));
    return 0;
}
