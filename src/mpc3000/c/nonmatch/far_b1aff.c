/* differs: 308 at +0, 35 bytes; 311 at +0, 35 bytes; 312 at +0, 35 bytes */
#define SEG_DATA _DS
int far far_b1aff(void)
{
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;

    return __insn("int 0x43", 6, bx, cx, dx, si, di, es, SEG_DATA);
}
