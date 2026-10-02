/* differs: 308 at +0, 54 bytes; 311 at +0, 54 bytes; 312 at +0, 54 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_d4fb4(void)
{
    int ax;

    outp(162, (char)-64);
    if (inp(162) != -64) {
        ax = 1;
    } else {
        outp(160, (char)7);
        outp(170, (char)0);
        outp(162, (char)8);
        ax = 0;
    }
    return ax;
}
