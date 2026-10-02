/* differs: 308 absent; 311 at +3, 43 bytes; 312 at +3, 43 bytes */
#define SEG_DATA _DS
int far far_d7b8f(int arg_0, char arg_2)
{
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;

    return __insn("int 0x46", (arg_2 << 8 | (unsigned char)*(char *)((char *)&arg_0 + 0)), bx, cx, dx, si, di, es, SEG_DATA);
}
