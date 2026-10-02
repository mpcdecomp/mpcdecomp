/* differs: 308 at +3, 79 bytes; 311 at +3, 79 bytes; 312 at +3, 79 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long far far_da413(long arg_0, char arg_4)
{
    int bx;
    int bx2;
    int dx;

    dx = 1;
    bx = (int)arg_0;
    bx2 = ((char)(bx >> 8) << 8 | (unsigned char)*(char far *)MK_FP((int)(arg_0 >> 16), bx + 1));
    if ((arg_4 & -128) == 0) {
        goto L1;
    }
    dx = dx + 1;
    bx2 = ((char)(bx2 >> 8) << 8 | (unsigned char)arg_4);
L1:
    if (((unsigned char)(char)bx2 & 96) == 64) {
        goto L2;
    }
    dx = dx + 1;
L2:
    return ((long)dx << 16 | (unsigned)dx);
}
