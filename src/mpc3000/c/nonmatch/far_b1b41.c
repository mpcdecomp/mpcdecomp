/* differs: 308 at +3, 97 bytes; 311 at +3, 97 bytes; 312 at +3, 97 bytes */
#define SEG_DATA _DS
#define UNDEF 0
int far far_b1b41(int arg_0, int arg_2)
{
    int ax;
    int bx;
    int bx2;
    int di;
    int dx;
    int es;
    int si;

    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_0 + 0));
L1:
    ax = __insn("int 0x43", 4, bx, arg_2, dx, si, di, es, SEG_DATA);
    bx = UNDEF;
    dx = UNDEF;
    es = UNDEF;
    arg_2 = UNDEF - 1;
    if (arg_2 != 0) {
        goto L1;
    }
    return __insn("int 0x43", 3, __insn("int 0x43", 7, bx, arg_2, dx, si, di, es, SEG_DATA), UNDEF, UNDEF, si, di, UNDEF, SEG_DATA);
}
