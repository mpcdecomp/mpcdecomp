/* differs: 308 absent; 311 at +3, 35 bytes; 312 at +3, 35 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int far far_da3ff(long arg_0)
{
    int di;
    int es;

    di = (int)arg_0;
    es = (int)(arg_0 >> 16);
    __stos2(MK_FP(es, di), 0, 6);
    *(char far *)MK_FP(es, di + 6) = (char)0;
    return 0;
}
