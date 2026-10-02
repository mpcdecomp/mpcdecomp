/* differs: 308 at +0, 83 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long interrupt far fn_fb2e5(void)
{
    int di;
    int di2;
    int ds;

    di = (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40));
    ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
    if (*(char far *)MK_FP(ds, di + 16) > 0) {
        goto L1;
    }
L2:
    return 0L;
L1:
    di2 = *(int far *)MK_FP(ds, di + 10);
    if ((*(int far *)MK_FP(ds, di2 + 30) | *(int far *)MK_FP(ds, di2 + 28)) == 0) {
        goto L2;
    }
    return 0L;
}
