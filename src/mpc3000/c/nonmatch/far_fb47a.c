/* differs: 308 at +0, 74 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern void far far_fb45f(void);
void far far_fb45f(void) { }

int far far_fb47a(void)
{
    int ax;
    int cx;
    int ds;
    int si;
    int t1;

    ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
    si = *(int far *)MK_FP(ds, (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) + 10);
    _disable();
    *(int far *)MK_FP(ds, si + 10) = cx;
    *(int far *)MK_FP(ds, si + 12) = 0;
    far_fb45f();
    ax = *(int far *)MK_FP(ds, si + 12);
    if (ax != 0) {
        ax = -5;
    }
    return ax;
}
