/* differs: 308 at +0, 139 bytes; 311 at +0, 140 bytes; 312 at +0, 140 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void near fn_f941d(void)
{
    int bx;
    int cx;
    char near *di;
    int dx;
    int flags;
    int flags2;
    int p2;

    p2 = __flags(flags);
    dx = *(int *)0x24 << 4;
    bx = 0x24d;
    for (;;) {
L1:
        di = (char near *)12;
        cx = 10;
        for (;;) {
            flags2 = di[bx] - 32;
            if (!CC("<u", flags2)) {
                flags2 = di[bx] - 127;
                if (!CC(">=u", flags2)) {
                    di = di + 1;
                    cx = cx - 1;
                    if (cx == 0) {
                        goto L2;
                    }
                    continue;
                }
                break;
            }
            break;
        }
        do {
            di[bx] = (char)0;
            di = di + 1;
            flags2 = (int)(unsigned)di;
            cx = cx - 1;
        } while (cx != 0);
        goto L3;
    }
    goto L4;
L2:
L3:
    bx = bx + 32;
    dx = dx - 1;
    if (dx != 0) {
        goto L1;
    }
L4:
    __insn("popf", p2);
    return;
}
