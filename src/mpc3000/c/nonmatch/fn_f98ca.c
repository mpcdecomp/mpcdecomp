/* differs: 308 at +0, 50 bytes; 311 at +0, 50 bytes; 312 at +0, 50 bytes */
#define SEG_DATA _DS
void near fn_f98ca(void)
{
    int ax;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;

    __insn("int 0x43", 4, ((char)(bx >> 8) << 8 | (unsigned char)(char)cx), cx, dx, si, di, es, SEG_DATA);
    return;
}
