/* differs: 308 absent; 311 at +3, 37 bytes; 312 at +3, 37 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_cb3de(long arg_0)
{
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es, bx) = (char)100;
    *(char far *)MK_FP(es, bx + 1) = (char)50;
    *(char far *)MK_FP(es, bx + 2) = (char)0;
    *(char far *)MK_FP(es, bx + 3) = (char)9;
    return;
}
