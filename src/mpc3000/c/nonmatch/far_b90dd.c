/* differs: 308 at +24, 9 bytes; 311 at +24, 9 bytes; 312 at +24, 9 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1b41(int, int);

long far far_b90dd(void)
{
    int ax;
    int ax2;

    far_b1ad0(6, 0);
    far_b1b41(61, 40);
    return ((long)UNDEF << 16 | (unsigned)far_b1ad0(7, 0));
}
