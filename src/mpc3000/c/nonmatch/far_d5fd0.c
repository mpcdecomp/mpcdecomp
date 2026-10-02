/* differs: 308 at +0, 148 bytes; 311 at +0, 147 bytes; 312 at +0, 147 bytes */
extern int W_D627;
extern int W_D629;

long far far_d5fd0(void)
{
    unsigned int ax;
    unsigned int bx;
    unsigned int bx2;
    int cx;
    int flags;
    int p2;
    char t1;

    p2 = __flags(flags);
    _disable();
    outp(-0x3fcd, (char)0);
    ax = 0x4e20 - (inp(-0x3fd0) << 8 | (unsigned char)inp(-0x3fd0));
    if (ax <= 0x3e8) {
        t1 = inp(-0x3fef);
        outp(-0x3fef, (char)-2);
        outp(-0x3ff0, (char)-57);
        _enable();
        _disable();
        outp(-0x3fef, t1);
        ax = ax;
    }
    bx = W_D627;
    bx2 = bx + ax;
    cx = W_D629 + (bx2 < bx);
    __insn("popf", p2);
    return ((long)cx << 16 | (unsigned)bx2);
}
