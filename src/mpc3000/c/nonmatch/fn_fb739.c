/* differs: 308 at +0, 53 bytes; 311 at +0, 53 bytes; 312 at +0, 53 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long near fn_fb739(void)
{
    unsigned int ax;
    unsigned int ax2;
    int bx;
    int es;

    ax = *(int far *)MK_FP(es, bx);
    ax2 = ax << 1 | ax >> 15;
    _disable();
    return ((long)*(int far *)MK_FP(es, bx + 2) << 16 | (unsigned)((ax2 << 1 | ax2 >> 15) & 3));
}
