/* differs: 308 at +0, 26 bytes; 311 at +0, 26 bytes; 312 at +0, 26 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_cdc6d(void)
{
    int ax;

    ax = (inpw(104) | 0x100) & -129;
    outpw(104, ax);
    return ax;
}
