/* differs: 308 at +3, 43 bytes; 311 at +3, 43 bytes; 312 at +3, 42 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_87FE;

int far far_e5796(char arg_0)
{
    int ax;
    unsigned int bx;

    ax = ((char)(0xa8ec /* SEG_A8EC */ >> 8) << 8 | (unsigned char)arg_0);
    bx = 1;
    for (;;) {
        if ((unsigned char)(char)ax > (unsigned char)*(char far *)MK_FP(0xa8ec /* SEG_A8EC */, bx + 0x5b20)) {
            bx = bx + 1;
            if (bx >= 0x3e7) {
                goto L1;
            }
            continue;
        }
        break;
    }
    goto L2;
L1:
    bx = W_87FE + 1;
L2:
    return bx;
}
