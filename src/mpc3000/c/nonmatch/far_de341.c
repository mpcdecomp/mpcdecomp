/* differs: 308 at +0, 33 bytes; 311 at +0, 33 bytes; 312 at +0, 33 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_9CFD[];
extern int W_9D61;
extern int W_9D63;
extern int W_9D65;

int far far_de341(void)
{
    __stos2((unsigned char far *)TBL_9CFD, 0, 100);
    W_9D65 = 0;
    W_9D63 = 0;
    W_9D61 = 1;
    return 0;
}
