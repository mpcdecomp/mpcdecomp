/* differs: 308 at +3, 43 bytes; 311 at +3, 44 bytes; 312 at +3, 44 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_ebeba(long arg_0)
{
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es, bx + 14) = 0;
    *(int far *)MK_FP(es, bx + 12) = 0;
    *(int far *)MK_FP(es, bx + 10) = 0;
    *(int far *)MK_FP(es, bx + 8) = 0;
    return 0L;
}
