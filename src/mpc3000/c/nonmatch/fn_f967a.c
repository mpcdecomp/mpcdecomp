/* differs: 308 absent; 311 at +1, 187 bytes; 312 at +1, 187 bytes */
#define SEG_DATA _DS
#define UNDEF 0
long near fn_f967a(void)
{
    int ax;
    int ax2;
    unsigned int bp;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int p6;
    int t1;

    bp = 4;
    for (;;) {
        ax = __insn("int 0x40", ax2, bx, cx, dx, ax2, di, es, SEG_DATA);
        bx = UNDEF;
        cx = UNDEF;
        dx = UNDEF;
        es = UNDEF;
        if (CC(">=u", UNDEF)) {
            break;
        }
        if ((char)(ax >> 8) == 3 || (char)(ax >> 8) == -128) {
            bp = 1;
        }
        if (bp <= 2) {
            p6 = ax;
            t1 = __insn("int 0x40", (unsigned char)(char)ax, bx, cx, ((char)(dx >> 8) << 8 | (unsigned char)*(char *)0x18), ax2, di, es, SEG_DATA);
            bx = UNDEF;
            cx = UNDEF;
            dx = UNDEF;
            es = UNDEF;
            ax = p6;
        }
        bp = bp - 1;
        if (bp != 0) {
            continue;
        }
        goto L1;
    }
    goto L2;
L1:
L2:
    return ((long)dx << 16 | (unsigned)ax);
}
