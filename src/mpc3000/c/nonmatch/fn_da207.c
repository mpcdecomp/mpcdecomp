/* differs: 308 at +0, 96 bytes; 311 at +0, 96 bytes; 312 at +0, 96 bytes */
long near fn_da207(void)
{
    int ax;
    int cx;
    int flags;

    _disable();
    outpw(-0x3ff8, 20);
    ax = (unsigned char)(inp(-0x3ff1) | (char)cx);
    outp(-0x3ff1, (char)ax);
    outpw(-0x3ff1, ((char)(ax >> 8) << 8 | (unsigned char)16));
    __insn("popf", __flags(flags));
    return ((long)-0x3ff1 << 16 | (unsigned)((char)(ax >> 8) << 8 | (unsigned char)16));
}
