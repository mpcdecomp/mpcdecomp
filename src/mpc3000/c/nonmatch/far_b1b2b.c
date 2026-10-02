/* differs: 308 at +3, 51 bytes; 311 at +3, 51 bytes; 312 at +3, 51 bytes */
#define SEG_DATA _DS
int far far_b1b2b(char far *arg_0, char far *arg_4)
{
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    int t1;

    t1 = __insn("int 0x43", 7, bx, cx, dx, si, di, es, SEG_DATA);
    *arg_0 = (char)(t1 >> 8);
    *arg_4 = (char)t1;
    return t1;
}
