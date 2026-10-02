/* differs: 308 at +3, 92 bytes; 311 at +3, 92 bytes; 312 at +3, 92 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long far far_d79b0(int arg_0, char arg_2)
{
    int ax;
    int dx;

    if (*(char *)((char *)&arg_0 + 0) == 1) {
        dx = 196;
        goto L1;
    }
    if (*(char *)((char *)&arg_0 + 0) == 2) {
        dx = 204;
        goto L1;
    }
    if (*(char *)((char *)&arg_0 + 0) == 3) {
        dx = 212;
        goto L1;
    }
    if (*(char *)((char *)&arg_0 + 0) == 4) {
        dx = 220;
L1:
        ax = ((char)(ax >> 8) << 8 | (unsigned char)0);
        if (arg_2 == 2) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)0);
        }
        outp(dx, (char)ax);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
