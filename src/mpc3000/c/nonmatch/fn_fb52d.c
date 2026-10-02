/* differs: 308 at +0, 33 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int near fn_fb52d(void)
{
    int ax;
    int dx;

    ax = -1;
    if ((unsigned char)(char)dx < (unsigned char)*(char far *)((char far *)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) + 14)) {
        ax = 0;
    }
    return ax;
}
