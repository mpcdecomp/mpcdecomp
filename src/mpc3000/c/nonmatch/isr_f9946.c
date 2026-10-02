/* differs: 308 at +1, 67 bytes; 311 at +1, 67 bytes; 312 at +1, 67 bytes */
#define SEG_DATA _DS
long interrupt far isr_f9946(void)
{
    int ax;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    int t1;

    t1 = __insn("int 0x42", ax, bx, cx, dx, si, di, es, SEG_DATA);
    outp(-0x3ff0, (char)96);
    return 0L;
}
