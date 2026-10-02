/* differs: 308 at +5, 52 bytes; 311 at +5, 52 bytes; 312 at +5, 52 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_E424;
extern unsigned char B_E428[];
extern int FP_E40C;
extern int W_901D;
extern int W_901F;
extern int W_E40E;

long far far_c2c33(void)
{
    int ax;

    ax = B_E424;
    if (ax != 0) {
        if (ax != 1) {
            if (ax != 2) {
                return (long)(unsigned char far *)B_E428;
            }
            return ((long)W_E40E << 16 | (unsigned)(FP_E40C + 26));
        }
        if ((W_901D | W_901F) != 0) {
            return ((long)W_901F << 16 | (unsigned)(W_901D + 0x12a));
        }
L1:
        return (long)(unsigned char far *)B_E428;
    }
    goto L1;
}
