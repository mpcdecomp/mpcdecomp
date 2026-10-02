/* differs: 308 at +3, 43 bytes; 311 at +3, 43 bytes; 312 at +3, 43 bytes */
#define SEG_DATA _DS
int far far_b1ad0(int arg_0, char arg_2)
{
    int cx;
    int di;
    int dx;
    int es;
    int si;

    return __insn("int 0x43", 3, (*(char *)((char *)&arg_0 + 0) << 8 | (unsigned char)arg_2), cx, dx, si, di, es, SEG_DATA);
}
