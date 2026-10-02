/* differs: 308 absent; 311 at +3, 49 bytes; 312 at +3, 49 bytes */
#define SEG_DATA _DS
int far far_b1ab2(int arg_0)
{
    int cx;
    int di;
    int dx;
    int es;
    int si;

    *(int *)0x1d24 = arg_0;
    if ((arg_0 & 2) != 0) {
        arg_0 = arg_0 ^ 1;
    }
    return __insn("int 0x43", 2, arg_0, cx, dx, si, di, es, SEG_DATA);
}
