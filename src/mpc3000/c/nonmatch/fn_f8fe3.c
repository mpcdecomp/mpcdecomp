/* differs: 308 at +0, 124 bytes; 311 at +0, 125 bytes; 312 at +0, 125 bytes */
#define SEG_DATA _DS
#define UNDEF 0
long near fn_f8fe3(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int dx;
    int dx2;
    int es;
    int si;

    ax = __insn("int 0x40", (7 << 8 | (unsigned char)(char)ax2), bx, cx, ((char)(dx >> 8) << 8 | (unsigned char)*(char *)0x18), si, di, es, SEG_DATA);
    dx2 = UNDEF;
    if (!CC("<u", UNDEF)) {
        ax = __insn("int 0x40", 0x201, 44, 1, (unsigned char)(char)dx2, si, di, SEG_DATA, SEG_DATA);
        dx2 = UNDEF;
    }
    return ((long)dx2 << 16 | (unsigned)ax);
}
