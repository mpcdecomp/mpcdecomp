/* differs: 308 at +3, 82 bytes; 311 at +3, 82 bytes; 312 at +3, 82 bytes */
#define SEG_DATA _DS
#define UNDEF 0
int far far_b1ae0(char arg_0)
{
    int ax;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;

    __insn("int 0x43", 4, ((char)(bx >> 8) << 8 | (unsigned char)arg_0), cx, dx, si, di, es, SEG_DATA);
    return __insn("int 0x43", 3, __insn("int 0x43", 7, UNDEF, UNDEF, UNDEF, si, di, UNDEF, SEG_DATA), UNDEF, UNDEF, si, di, UNDEF, SEG_DATA);
}
