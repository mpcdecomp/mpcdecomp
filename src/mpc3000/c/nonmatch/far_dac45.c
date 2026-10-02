/* differs: 308 at +3, 38 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_dac45(int arg_0)
{
    int ax;
    int dx;

    ax = 0;
    dx = 0;
    if (arg_0 < *(int far *)MK_FP(0x9d15 /* SEG_9751 */, (unsigned int)(unsigned)((char *)0x2))) {
        ax = *(int far *)MK_FP(0x9d15 /* SEG_9751 */, (unsigned int)(unsigned)((char *)0x0)) * arg_0 + 4;
        dx = 0x9d15 /* SEG_9751 */;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
