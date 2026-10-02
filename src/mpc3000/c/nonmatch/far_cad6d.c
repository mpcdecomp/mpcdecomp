/* differs: 308 at +3, 53 bytes; 311 at +3, 53 bytes; 312 at +3, 53 bytes */
#define UNDEF 0
int far far_cad6d(long arg_0, int arg_4, int arg_6)
{
    int ax;
    int di;
    int es;
    int si;

    ax = __insn("int 0x41", 4, arg_4, arg_6, (int)arg_0, si, di, es, (int)(arg_0 >> 16));
    if (ax == 0) {
        ax = -0xb00;
        if (UNDEF == arg_6) {
            ax = 0;
        }
    }
    return ax;
}
