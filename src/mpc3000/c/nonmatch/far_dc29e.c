/* differs: 308 at +0, 22 bytes; 311 at +0, 22 bytes; 312 at +0, 22 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_F47A[];
extern int W_F2B4;

int far far_dc29e(void)
{
    __stos2((unsigned char far *)TBL_F47A, -1, 0x2ca);
    W_F2B4 = 0;
    return -1;
}
