/* differs: 308 at +0, 33 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int near fn_fb903(void)
{
    int dx;

    if ((unsigned int)(dx - 1) >= (unsigned int)*(int far *)((char far *)*(long far *)MK_FP(0xfb81, (unsigned int)(unsigned)((char *)0x34)))) {
        goto L1;
    }
    return 0;
L1:
    return -10;
}
