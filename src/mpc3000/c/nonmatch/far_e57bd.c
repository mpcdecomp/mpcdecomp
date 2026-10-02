/* differs: 308 at +0, 41 bytes; 311 at +0, 41 bytes; 312 at +0, 41 bytes */
extern int W_D635;
extern int W_D637;

long far far_e57bd(void)
{
    int ax;
    int dx;
    int flags;

    _disable();
    ax = W_D635;
    dx = W_D637;
    __insn("popf", __flags(flags));
    return ((long)dx << 16 | (unsigned)ax);
}
