/* differs: 308 at +0, 44 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_fb62d(void)
{
    int cx;
    int ds;
    int dx;

    ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
    *(int far *)MK_FP(ds, *(int far *)MK_FP(ds, (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) + 6) + dx) = cx;
    return;
}
