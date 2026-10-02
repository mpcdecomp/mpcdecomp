/* differs: 308 at +0, 71 bytes; 311 at +0, 71 bytes; 312 at +0, 71 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int near fn_f8fb4(void)
{
    int ax;
    int ax2;
    int ax3;

L1:
    return (4 << 8 | (unsigned char)(char)ax);
    ax = (unsigned int)(*(int *)0x6 + 15) >> 4;
    if (ax <= 32) {
        goto L2;
    }
    goto L1;
L2:
    *(int *)0x24 = ax;
    ax2 = (unsigned char)*(char *)0x5 * *(int *)0xb + *(int *)0x3;
    *(int *)0x26 = ax2;
    *(int *)0x28 = ax2 + *(int *)0x24;
    return;
}
