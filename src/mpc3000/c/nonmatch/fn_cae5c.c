/* differs: 308 at +0, 44 bytes; 311 at +0, 44 bytes; 312 at +0, 44 bytes */
#define SEG_DATA _DS
int far fn_cae5c(void)
{
    int ax;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;

    return __insn("int 0x40", (8 << 8 | (unsigned char)(char)ax), bx, cx, dx, si, di, es, SEG_DATA);
}
