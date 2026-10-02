/* differs: 308 at +0, 239 bytes; 311 at +0, 239 bytes; 312 at +0, 239 bytes */
long near fn_d4ff8(void)
{
    unsigned int ax;
    unsigned int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int cx;
    int cx2;
    int dx;
    int dx2;
    int dx3;
    int es;
    int flags;

    outp(-0x3fff, (char)0);
    ax = es;
    dx = 0;
    cx = 4;
    do {
        ax = ax << 1;
        dx = dx << 1 | ax >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    ax2 = ax + bx;
    dx2 = dx + (ax2 < ax);
    outpw(-0x3ffc, ax2);
    ax3 = ((char)(dx2 >> 8) << 8 | (unsigned char)((char)dx2 | 48));
    outp(-0x3ffa, (char)ax3);
    flags = cx2 - 1;
    outpw(-0x3ffe, cx2 - 1);
    ax4 = 68;
    if (dx3 != 0) {
        ax4 = 72;
    }
    outp(-0x3ff6, (char)ax4);
    _disable();
    outpw(-0x3ff8, 20);
    ax5 = (unsigned char)(inp(-0x3ff1) & -2);
    outp(-0x3ff1, (char)ax5);
    outpw(-0x3ff1, ((char)(ax5 >> 8) << 8 | (unsigned char)16));
    __insn("popf", __flags(flags));
    return ((long)-0x3ff1 << 16 | (unsigned)((char)(ax5 >> 8) << 8 | (unsigned char)16));
}
